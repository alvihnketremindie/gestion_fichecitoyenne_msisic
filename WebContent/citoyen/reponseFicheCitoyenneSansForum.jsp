<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
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
		String nom = (String) session.getAttribute("nom");
		String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
		int id = Integer.parseInt(request.getParameter("id"));
		int numboucle = Integer.parseInt(request.getParameter("numboucle"));
	%>
	<table border="1" width="800" class="Casebleu1">
		<tr>
			<td><h2>
					Personne connectée :
					<%=nom%>
					&nbsp;&nbsp;
				</h2></td>
			<td>
				<h2>
					Date courante:
					<%=dateDemande%>
				</h2>
			</td>
		</tr>
	</table>

	<!-- 
* Sur une   ligne vous mettez le numéro de la fiche et son objet.
*    Puis sa description
*    Puis un " TEXTAREA" pour écrire la réponse.
*            Enfin deux boutons, un pour "validez" et l'autre pour "abandonner".
*     Le bouton "validez" appelle la page "gereBaseReponse" qui écrit tout simplement la réponse 
*           dans la table fiche de la base de données.
*     Le bouton "abandonner" appelle la page gereDemandeCitoyen.jsp
  -->

	<%@ include file="ouvreBase2.jsp"%>
	<%
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn1.prepareStatement("select * from fiche where id = ? and reponse = ''");
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();
			if (rset.next()) {
	%>
	<form name="depotfiche" method="get" action="gestionBaseReponse.jsp">
		<table style="width: 400;" class="Casebleu">
			<input type="hidden" name="numFiche" value="<%=id%>"/>
			<input type="hidden" name="numDemande" value="<%=numboucle%>"/>
			<tr class="CaseGrise">
				<td>
					<p>
						<b> Numero fiche : </b>
					</p>
				</td>
				<td>
					<p>
						<%=numboucle%>
					</p>
				</td>
			</tr>
			<tr class="Casebleu">
				<td>
					<p>
						<b> Objet : </b>
					</p>
				</td>
				<td>
					<p>
						<%=rset.getString("objet")%>
					</p>
				</td>
			</tr>
			<tr class="CaseGrise">
				<td>
					<p>
						<b> Description : </b>
					</p>
				</td>
				<td>
					<p>
						<%=rset.getString("description")%>
					</p>
				</td>
			</tr>
		</table>
		<table style="width: 400;">
			<tr class="Casebleu">
				<td>
					<p>
						<b><label>Reponse : </label></b>
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<p>
						<textarea name="reponse" rows="15" cols="100" required></textarea>
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button name="valider" type="submit"
						value="valider" style="width: 120px">valider</button></td>
				<td colspan="2"><button name="abandonner" type="button"
						value="abandonner"
						onClick="self.location.href='gereDemandeCitoyen.jsp'"
						style="width: 120px">abandonner</button></td>
			</tr>
		</table>
	</form>
	<%
		}
		} catch (Exception E) {
			System.out.println(" -------- probleme ouverture  " + E.getClass().getName());
			E.printStackTrace();
		}
	%>

</body>
</html>
