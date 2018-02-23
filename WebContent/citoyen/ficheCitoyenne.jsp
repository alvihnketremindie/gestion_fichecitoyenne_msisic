
<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Demande Citoyenne Mairie Loc-Maria-Plouzanéé</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body class="CaseGrise">
	<%@ include file="accesmenuFiche.jspf"%>
	<%
		int numFiche = Integer.parseInt(request.getParameter("numeroDemande"));
		String nom = (String) session.getAttribute("nom");
		String identifiant = (String) session.getAttribute("identifiant");
		String mail = (String) session.getAttribute("mail");
		String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
		String contenuForum,  champForum, styleForum;
		String objet = "";
	%>
	<%@ include file="ligneIdentification.jspf"%>
	<%@ include file="ouvreBase2.jsp"%>
<%-- 
Recherche des caractéristiques de la fiche dans la base 
--%>

	<%
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn1.prepareStatement("select * from fiche where id = ?");
			pstmt.setInt(1, numFiche);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				objet = rset.getString("objet");
	%>
<%-- 
affichage  objet
--%>
	<table>
		<tr>
			<td class="Casebleu1"><p><b>Date de creation : </b></p></td>
			<td class="CaseGrise"><p><%=rset.getDate("datedemande")%></p></td>
		</tr>
		<tr>
			<td class="Casebleu1"><p><b>Objet : </b></p></td>
			<td class="CaseGrise"><p><%=objet%></p></td>
		</tr>
	</table>
	<p>Détail de votre demande</p>
<%-- 
Affichage  description et réponse
--%>
	<table>
		<%
			pstmt = conn1.prepareStatement("select * from interaction where ficheId = ?");
			pstmt.setInt(1, numFiche);
			rset = pstmt.executeQuery();
			int compteur = 0;
			while (rset.next()) {
				contenuForum = rset.getString("contenu");
				champForum = rset.getString("type");
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
		
		<tr>
			<td class="CaseGrise"><p><b><%=champForum%></b></p></td>
			<td class="Casebleu1"><p><%=contenuForum%></p></td>
		</tr>
	<%
	}
	%>
	</table>
	<%
	
			}
		} catch (Exception E) {
			System.out.println(" -------- probleme ouverture  " + E.getClass().getName());
			E.printStackTrace();
		}
	%>
	<button name="numeroDemande" type="button"
					onClick="self.location.href='deposerUneDemande.jsp?objetDemande=<%=objet%>'"
	style="width: 120px">Nouveau message</button>
</body>
</html>
