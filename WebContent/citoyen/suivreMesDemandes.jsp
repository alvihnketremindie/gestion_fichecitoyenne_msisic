<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body class="CaseGrise">
	<!-- 
*	 une ligne par fiche, 
*   cette  ligne comprend : le numéro de la fiche (id), l'objet de la fiche, 
*               la date de création de la fiche. 
*     Pour que ce soit plus lisible, alternez entre deux couleurs sur les lignes.
*	Avec le numéro de la fiche vous mettez 
*          un lien vers la page d'affichage du contenu de la fiche : ficheCitoyenne.jsp
-->
	<%@ include file="accesmenuFiche.jspf"%>
	<%
		String nom = (String) session.getAttribute("nom");
		String identifiant = (String) session.getAttribute("identifiant");
		int idDemandeur = ((Integer)(session.getAttribute("id"))).intValue();
		String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
		int id;
		String objet;
		String statut = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn1.prepareStatement("select * from fiche where demandeur = ?");
			pstmt.setInt(1, idDemandeur);
			rset = pstmt.executeQuery();
			int compteur = 0;
	%>
	<%@ include file="ligneIdentification.jspf"%>
	<table width="800" border="1" class="Casebleu1">
		<tr border="1">
			<th colspan="2">Numero</th>
			<th colspan="2">Objet</th>
			<th colspan="2">Date de creation</th>
			<th colspan="2">Statut</th>
		</tr>
		<%
			while (rset.next()) {
				dateDemande = rset.getString("datedemande");
				objet = rset.getString("objet");
				id = rset.getInt("id");
				statut = rset.getString("statut");
					if (compteur % 2 == 0) {
		%>
		<tr class="Casebleu1" border="1">
			<%
				} else {
			%>
		
		<tr class="CaseGrise" border="1">
			<%
				}
						compteur++;
			%>
			<td colspan="2" align="center"><button name="numeroDemande"
					type="button"
					onClick="self.location.href='ficheCitoyenne.jsp?numeroDemande=<%=id%>'"
					style="width: 120px">Fiche <%=id%></button></td>
			<td colspan="2" align="center"><%=objet%></td>
			<td colspan="2" align="center"><%=dateDemande%></td>
			<td colspan="2" align="center"><%=statut%></td>
		</tr>
		<%
			}
		%>
		</table>
		<%
			} catch (Exception E) {
				System.out.println(" -------- probleme ouverture  " + E.getClass().getName());
				E.printStackTrace();
			}
		%>
	

</body>
</html>
