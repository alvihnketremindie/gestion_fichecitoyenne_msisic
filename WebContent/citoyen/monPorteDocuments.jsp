<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.swing.JFileChooser"%>
<%@ page import="java.io.File"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Document transférés par un citoyen</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
<%!String trouveSuffixe(String fichier) {
		String suffixe;
		int pos = fichier.lastIndexOf(".");
		if (pos > -1)
			suffixe = fichier.substring(pos);
		else
			suffixe = fichier;
		return suffixe;
	}%>
</head>
<body class="CaseGrise">
	<%@ include file="accesmenuFiche.jspf"%>
	<%
		String placeDocument = "../images/";
		String nom = (String) session.getAttribute("nom");
		String identifiant = (String) session.getAttribute("identifiant");
		int idDemandeur = ((Integer)(session.getAttribute("id"))).intValue();
		int idfiche = 0;
		String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
	%>
	<%@ include file="ouvreBase2.jsp"%>
	<table border="1" style="width: 400;" class="Casebleu1">
		<tr>
			<td width="400">Demandeur ou service : nom : <%=nom%></td>
			<td>Date : <%=dateDemande%></td>
		</tr>
	</table>
	<%
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn1.prepareStatement(
					"select * from document where proprietaire = ?");
			pstmt.setInt(1, idDemandeur);
			rset = pstmt.executeQuery();
			int compteur = 0;
			String nomDocument, extensionDocument, cheminDocument, imageIconne;
			ArrayList<String> lesExtensions = new ArrayList<String>(Arrays.asList(".jpg", ".jpeg", ".png", ".bmp"));
	%>
	<!--  
* Donner la liste, des documents que la personne a téléchargés, un document par ligne.
*
* Sur cette ligne, vous mettez d'abord un icône donnant le type de document, par exemple pour le pdf : pdf.jpg ,
* pour une image une vignette de l'image (petite image), inutile de le faire pour tous les documents possibles.
* Puis le nom du fichier de ce document, associé à un lien html sur le fichier, 
* de façon qu'en cliquant dessus on puisse lire le document. 
-->
	<table width="800" border="1" class="CaseGrise">
		<tr border="1">
			<th colspan="2">Icone</th>
			<th colspan="2">Nom du document</th>
		</tr>
		<%
			while (rset.next()) {
					nomDocument = rset.getString("nom");
					extensionDocument = this.trouveSuffixe(nomDocument);
					cheminDocument = placeDocument + nomDocument;
					System.out.println("Extension du document " + nomDocument + " est " + extensionDocument);
					if (extensionDocument.equalsIgnoreCase(".pdf")) {
						imageIconne = placeDocument + "pdf.jpg";
					} else if (lesExtensions.contains(extensionDocument.toLowerCase())) {
						imageIconne = placeDocument + nomDocument;
					} else {
						imageIconne = placeDocument + "indefini.png";
					}
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
			<td colspan="2" align="center"><a href="<%=cheminDocument%>"><img
					src="<%=imageIconne%>" alt="<%=nomDocument%>" width="42"
					height="42"></a></td>
			<td colspan="2" align="center"><%=nomDocument%></td>
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