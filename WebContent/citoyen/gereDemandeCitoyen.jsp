<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body class="CaseGrise">
	<%@ include file="accesmenuFicheAdministration.jspf"%>
	<%
		String ajoutdoc = request.getParameter("ajoutdoc");
		String docmise = request.getParameter("docmise");
		String nom = (String) session.getAttribute("nom");
		String identifiant = (String) session.getAttribute("identifiant");
		String objet = null;
		String statut = null;
		int numboucle = 0;
		String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
		int id;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
	%>
	<table border="1" width="800" class="Casebleu1">
		<tr>
			<td><h2>Personne connectée : <%=nom%>&nbsp;&nbsp;</h2></td>
			<td><h2>Date courante : <%=dateDemande%></h2></td>
		</tr>
	</table>
	<p></p>
<%--
*	  une liste des fiches qui n'ont pas été traitées (champs réponse inexistant),
*	  une liste des fiches traitées.  
*  Dans ces deux listes vous mettez :
*	  une ligne par fiche, cette  ligne comprend : le numéro de la fiche (id), l'objet de la fiche, la date de création de la fiche. 
*     Pour que ce soit plus lisible, alternez entre deux couleurs sur les lignes.
*  Avec le numéro de la fiche vous mettez un lien vers la page "reponseFicheCitoyenne.jsp" qui permet d'écrire la réponse à  la fiche, 
--%>
	<table border="1" width="800" class="CaseGrise">
		<tr>
			<td><h2>Fiches</h2></td>
		</tr>
	</table>
	<p></p>
	<%
		try {
			pstmt = conn1.prepareStatement("select * from fiche");
			rset = pstmt.executeQuery();
	%>
	<table width="800" border="1" class="Casebleu1">
		<tr border="1">
			<th colspan="2">Numero</th>
			<th colspan="2">Objet</th>
			<th colspan="2">Date de creation</th>
			<th colspan="2">Statut</th>
		</tr>
		<%
			while (rset.next()) {
				id = rset.getInt("id");
				dateDemande = rset.getString("datedemande");
				objet = rset.getString("objet");
				statut = rset.getString("statut");
					if (numboucle % 2 == 0) {
		%>
		<tr class="Casebleu1" border="1">
			<%
				} else {
			%>
		<tr class="CaseGrise" border="1">
			<%
				}
					numboucle++;
			%>
			<td colspan="2" align="center"><button name="numeroDemande" type="button"
					onClick="self.location.href='reponseFicheCitoyenne.jsp?id=<%=id%>&numboucle=<%=numboucle%>'"
					style="width: 120px">Fiche <%=id%></button></td>
			<td colspan="2" align="center"><%=objet%></td>
			<td colspan="2" align="center"><%=dateDemande%></td>
			<td colspan="2" align="center"><%=statut%></td>
		</tr>
		<%
			}
		%>
	</table>
	<p></p>
	<%
		} catch (Exception E) {
			System.out.println(" -------- probleme ouverture  " + E.getClass().getName());
			E.printStackTrace();
		}
	%>
</body>
</html>
