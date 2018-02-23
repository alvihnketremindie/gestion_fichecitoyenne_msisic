
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2"%>

<%@ include file="ouvreBase2.jsp"%>
<%
//Statement stmt = conn1.createStatement();
ResultSet rset = null;
PreparedStatement pstmt=null;
String mailCitoyen = null;
String objet = null;
String description =null;


int id = ((Integer)(session.getAttribute("id"))).intValue();
String mail=(String)session.getAttribute("mail");
String reponse = request.getParameter("reponse");
String valider = request.getParameter("valider");
int numFiche  =  (request.getParameter("numFiche")!=null)? Integer.parseInt(request.getParameter("numFiche")):0;
int numDemande  =  (request.getParameter("numDemande")!=null)? Integer.parseInt(request.getParameter("numDemande")):0;
int num=0, num2=0;

String soumettre = request.getParameter("soumettre");
if (soumettre != null && !soumettre.trim().equals("")) {
	session.setAttribute("adresseMail", request.getParameter("adresseMail"));
	session.setAttribute("motDePasseExp", request.getParameter("motDePasseExp"));
	session.setAttribute("serveur", request.getParameter("serveur"));
	session.setAttribute("port", request.getParameter("port"));
}

String adresseMail = (String) session.getAttribute("adresseMail");
String motDePasseExp = (String) session.getAttribute("motDePasseExp");
String serveur = (String) session.getAttribute("serveur");
String port = (String) session.getAttribute("port");
if (adresseMail == null || adresseMail.trim().equals("") || serveur == null || serveur.trim().equals("") || port == null || port.trim().equals("")) {
	//Les variables de sessions attendues ne sont pas là
%>
<form name="formulairemail" method="post" action="">

<table class="CaseGrise1" style="width: 800;">
	<tr>
		<td class="Casebleu14">
		Entrez vos informations de messagerie :
		l'adresse mail, le mot de passe, le serveur (par defaut "z.imt.fr")
		et le port (par defaut "587").
		</td>
	</tr>
	<tr><td><label>Adresse mail : </label></td></tr>
	<tr><td><input name="adresseMail" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required></td></tr>
	<tr><td><label>Mot de passe : </label></td></tr>
	<tr><td><input name="motDePasseExp" type="password" required></td></tr>
	<tr><td><label>Serveur : </label></td></tr>
	<tr><td><input name="serveur" type="text" value="z.imt.fr" required></td></tr>
	<tr><td><label>Port : </label></td></tr>
	<tr><td><input name="port" type="text" value="587" required></td>
	</tr>
	<tr><td colspan="2"><button name="soumettre" type="submit" value="soumettre" style="width: 120px">soumettre</button></td></tr>
</table>
<input name="reponse" type="hidden" value="<%=reponse%>">
<input name="numFiche" type="hidden" value="<%=numFiche%>">
<input name="numDemande" type="hidden" value="<%=numDemande%>">
<input name="valider" type="hidden" value="<%=valider%>">
</form>
<%
} else {

pstmt= conn1.prepareStatement("select  mail, objet FROM personne , fiche  where fiche.demandeur = personne.id and fiche.id=?"); 
pstmt.setInt(1,numFiche);
rset = pstmt.executeQuery();
if (rset.next()) {
	mailCitoyen =rset.getString("mail");
	objet =rset.getString("objet");
	pstmt = conn1.prepareStatement("select * from interaction where ficheId = ? and type = 'description' order by id desc limit 1");
	pstmt.setInt(1, numFiche);

	rset = pstmt.executeQuery();
	if (rset.next()) {
		description = rset.getString("contenu");
	}
	
	
	
	String objetMail ="Réponse à votre ficheCitoyenne ";
	String contenu= "Bonjour \r\n";
	contenu = contenu + "voici le contenu et la reponse de votre fiche, elle a été enregistée sous le numéro " + numFiche +"\r\n";
	contenu = contenu + "Objet : " + objet +"\r\n";
	contenu = contenu + "Description : " + description +"\r\n";
	contenu = contenu + "Reponse : "+ reponse +"\r\n";
	contenu = contenu + "Si nous apportons une autre reponse vous en serez averti" +"\r\n";
	
	GereCitoyen.envoieMailSecure(objetMail, adresseMail, mailCitoyen, contenu, motDePasseExp, serveur, port, "Cordialement, La mairie");
}
%>
<!--  en jstl  inscription de la reponse par un administrateur et retour administration  -->

<c:if test="${(param.valider != null) and (param.reponse != null) }">
	<sql2:update var="result" dataSource="DonneesBase">
		update  fiche set statut="traite"  where id= ${param.numFiche}
	</sql2:update>
	<sql2:update var="result" dataSource="DonneesBase">
		insert into interaction (type, contenu, dateinteraction, ficheId)
		VALUES ("reponse",
		"${param.reponse}",
		NOW(),
		${param.numFiche})
	 </sql2:update>
	<c:redirect url="gereDemandeCitoyen.jsp" />
</c:if>
<% 
	
}
%>