
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
	%>
	<%@ include file="ligneIdentification.jspf"%>
	<%@ include file="ouvreBase2.jsp"%>
	<!-- 
*  recherche des caractéristiques de la fiche dans la base 
-->

	<%
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn1.prepareStatement("select * from fiche where id = ?");
			pstmt.setInt(1, numFiche);
			rset = pstmt.executeQuery();
			if (rset.next()) {
	%>
	<table style="width: 400;" class="Casebleu">
		<!-- 
*              affichage  objet
-->
		<tr>
			<td width="100" class="CaseGrise">
				<p>
					<b> Date de creation : </b>
				</p>
			</td>
			<td width="100" class="Casebleu1">
				<p>
					<%=rset.getDate("datedemande")%>
				</p>
			</td>
		</tr>
		<tr>
			<td width="100" class="Casebleu1">
				<p>
					<b> Objet : </b>
				</p>
			</td>
			<td width="100" class="CaseGrise">
				<p>
					<%=rset.getString("objet")%>
				</p>
			</td>
		</tr>
	</table>
	<p>Détail de votre demande</p>
	<table style="width: 400;" class="Casebleu">
		<tr>


			<!-- 
* et affichage  description et réponse
-->
			<td class="CaseGrise">
				<p>
					<b> Description : </b>
				</p>
			</td>
			<td class="Casebleu1">
				<p>
					<%=rset.getString("description")%>
				</p>
			</td>
		</tr>
		<tr>
			<td class="Casebleu1">
				<p>
					<b> Reponse : </b>
				</p>
			</td>
		</tr>
		<td class="CaseGrise">
			<p>
				<%=rset.getString("reponse")%>
			</p>
		</td>
		</tr>
	</table>
	<%
		}
		} catch (Exception E) {
			System.out.println(" -------- probleme ouverture  " + E.getClass().getName());
			E.printStackTrace();
		}
	%>
</body>
</html>
