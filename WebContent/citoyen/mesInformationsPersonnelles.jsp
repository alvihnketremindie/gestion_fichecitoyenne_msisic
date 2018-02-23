<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>

<body class="CaseGrise">
	<%@ include file="accesmenuFiche.jspf"%>

	<%    
String nom= (String)session.getAttribute("nom");
String identifiant= (String)session.getAttribute("identifiant");
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee(); 
%>
	<%@ include file="ligneIdentification.jspf"%>
	<%@ include file="ouvreBase2.jsp"%>

	<%
String mail=(String)session.getAttribute("mail");
String prenom=(String)session.getAttribute("prenom");
String rue=(String)session.getAttribute("rue");
String ville=(String)session.getAttribute("ville");
String fixe=(String)session.getAttribute("fixe");
String mobile=(String)session.getAttribute("mobile");
%>

	<form action="gestionBaseCitoyen.jsp">
		<table width="800" class="Casebleu">
		</table>

		<table width="800" class="CaseGrise1" style="border: 0px">
			<tr>
				<td>
					<table width="800">
						<tr>
							<td class="Casebleu">Modifier les informations ci dessous si
								elle sont inexactes ou incomplètes</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="800" class="Casebleu1" style="border: 0px">
						<tr>
							<td>Nom : <%=nom %>
							</td>
							<td>prénom : <INPUT type=text name="prenom"
								style="border: 0px" value="<%=prenom %>">
							</td>
							<TD>adresse de l'administré : numero, Rue, lieu dit <INPUT
								type=text name="rue" size="40" style="border: 0px"
								value="<%=rue%>">
							</td>
							<td>code postel, ville <INPUT type=text name="ville"
								size="40" value="<%=ville%>" style="border: 0px">
							</TD>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="800" class="Casebleu1" style="border: 0px">
						<tr>
							<td>Téléphone fixe : <INPUT type=text name="fixe"
								style="border: 0px" value="<%=fixe %>">
							</td>
							<td>Téléphone mobile : <INPUT type=text name="mobile"
								style="border: 0px" value="<%=mobile %>">
							</td>
							<td>Adresse messagerie : <%=mail %>

							</td>
						</tr>
						<tr>
							<td>
								<button type="submit" name="modifier" value="modifier"
									style="width: 90px">modifier</button>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
