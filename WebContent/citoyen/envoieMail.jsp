<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>

<%
	/*
	Pour envoyer un mail, il faut en général disposer d'un opérateur (serveur et port)
	qui dispose d'un serveur d'envoi de mail (serveur SMTP), et d'un compte chez cet opérateur.
	   
	Une exception est parfois permise, par exemple si vous êtes sur un réseau local derrière une 
	livebox (ou autre), dans ce cas vous avez la possibilité d'envoyer un mail 
	sans vous identifier et sans donner l'opérateur, en effet la livebox a son opérateur, 
	et si vous y êtes connecté c'est que vous y avez un compte. 
	Dans ce cas, utilisez   la méthode  de GéreCitoyen.envoieMail :
	
	public static void envoieMail( String objet, String deLaPart, String pour , String contenu) 
		ici deLaPart  est une adresse mail correcte, que vous pouvez donner. 
	
	Dans le cas plus général, par exemple si vous voulez passez par le serveur SMTP de l'école 
		c'est la méthode de GereCitoyen.envoieMailSecure :
	
	public static void envoieMailSecure( String objet, String deLaPart, String pour , String contenu, String motpasse, String host, String port) {
	
	Dans ce cas, 
		host et port désignent le serveur smtp d'un opérateur et le port associé
		deLaPart  et  motpasse désignent une adresse mail et son mot de passe chez cet opérateur;
	
	Dans cette méthode, au premier passage vous devrez donc donner ces indications.
	
	Par la suite ces informations (deLaPart , motpasse, serveur, port) sont stockées dans des variables de session et il est donc inutile de les demander.
	
	Voici donc les trois parties de cette page :
	
	1) Si à l'appel de la page,  les variables de session qui représentent  
		l'adresse mail et le mot de passe de l'expéditeur: ne sont pas connues 
		et que ces informations ne sont pas en paramètre  (envoyeurconnu = null) , 
		un formulaire est envoyé pour   demander 
	l'adresse mail, 
	le mot de passe, 
	le serveur,  par defaut     "z.imt.fr"  et 
	le port   par defaut  "587" , 
	ce formulaire a un bouton submit, de nom envoyeurconnu, 
	l'action de ce formulaire est la page courante.
	   
	Attention, l'envoi d'un formulaire, c'est une autre requête, donc nouveaux paramètres,
	or dans la première requête il y avait selon le cas un paramètre " nomDocument". 
	Il faut donc faire suivre cette valeur ("partie "hidden")
	
	2) Si à l'appel de la page,
		les variables de session qui représentent  l'adresse mail et le mot de passe de l'expéditeur:
		ne sont pas connues, mais que vous revenez du formulaire, (envoyeurconnu présent)
		Vous mettez les variables (adresseMail, motPasse, serveur, port) en session.
	
	3) Si les variables de session qui représentent  l'adresse mail et le mot de passe de l'expéditeur 
		sont connues (vous venez de les créer ou vous les avez créées lors d'un autre appel), 
		vous pouvez envoyer le mail.
		
	Envoi du mail :
	Recherche dans la base de la dernière fiche de la personne connectée
	Recherche des caractéristiques de cette fiche et du mail de la personne connectée
	
	Le mail contient en objet, l'objet de la fiche.
	et en contenu, le texte que vous voulez et le champ description de la fiche
	S'il y a eu un document avec la fiche, le nom de ce document
	*/

	ResultSet rset = null;
	PreparedStatement pstmt = null;
	int id = ((Integer) (session.getAttribute("id"))).intValue();
	String nom = (String) session.getAttribute("nom");
	String identifiant = (String) session.getAttribute("identifiant");
	String mailCitoyen = (String) session.getAttribute("mail");
	String objetDemande = (String) session.getAttribute("objetDemande");
	String nomDocument = request.getParameter("nomDocument");
	int numeroFiche = 0;
	String texte;
	String descriptionDemande = "";
	/*
	Si le formulaire a ete correctement rempli alors on met en session les variables
	adresse mail de l'expéditeur
	mot de passe de l'expéditeur
	serveur smtp
	port de connexion
	*/
	String valider = request.getParameter("valider");
	if (valider != null && !valider.trim().equals("")) {
		session.setAttribute("adresseMail", request.getParameter("adresseMail"));
		session.setAttribute("motDePasseExp", request.getParameter("motDePasseExp"));
		session.setAttribute("serveur", request.getParameter("serveur"));
		session.setAttribute("port", request.getParameter("port"));
	}
	String adresseMail = (String) session.getAttribute("adresseMail");
	String motDePasseExp = (String) session.getAttribute("motDePasseExp");
	String serveur = (String) session.getAttribute("serveur");
	String port = (String) session.getAttribute("port");

	if (adresseMail == null || adresseMail.trim().equals("") || serveur == null || serveur.trim().equals("")
			|| port == null || port.trim().equals("")) {
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
		<tr><td colspan="2"><button name="valider" type="submit" value="valider" style="width: 120px">valider</button></td></tr>
	</table>
	<input name="nomDocument" type="hidden" value="<%=nomDocument%>">
</form>
<%
	} else {
		//Recherche des informations de la fiche

		//Envoi du mail au citoyen
		texte = "Bonjour \r\n";
		pstmt = conn1.prepareStatement("select * from fiche where demandeur = ? and objet = ? limit 1");
		pstmt.setInt(1, id);
		pstmt.setString(2, objetDemande);
		rset = pstmt.executeQuery();
		if (rset.next()) {
			numeroFiche = rset.getInt("id");

			pstmt = conn1.prepareStatement(
					"select * from interaction where ficheId = ? and type = 'description' order by id desc limit 1");
			pstmt.setInt(1, numeroFiche);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				descriptionDemande = rset.getString("contenu");

				if (numeroFiche != 0 && descriptionDemande != null) {
					texte = "Votre fiche n° " + numeroFiche + " sera traité dans les plus bref delais \r\n";
					texte += "Objet: " + objetDemande + " \r\n";
					texte += "Description: " + descriptionDemande + " \r\n";
					if (nomDocument != null && !nomDocument.trim().equals("")
							&& !nomDocument.trim().equals("null")) {
						texte += "Nom document : " + nomDocument + " \r\n";
					}
					GereCitoyen.envoieMailSecure(objetDemande, adresseMail, mailCitoyen, texte, motDePasseExp,
							serveur, port, "Votre service de gestion de fiche citoyenne :)");
				}
			}
		}
%>
<jsp:forward page="mesInformationsPersonnelles.jsp"></jsp:forward>
<%
	}
%>


