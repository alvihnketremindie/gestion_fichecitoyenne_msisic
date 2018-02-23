<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE  HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body class="CaseGrise">
<%@ include file="accesmenuFiche.jspf"%>
<%
String nom = (String) session.getAttribute("nom");
String identifiant = (String) session.getAttribute("identifiant");
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
String dateDemandemysql = laDate.getAnnee() + "/" + laDate.getMois() + "/" + laDate.getJour();
String objetDemande = request.getParameter("objetDemande");
if(objetDemande == null || objetDemande.trim().equalsIgnoreCase("null")) {
	objetDemande = "";
}
%>
<%@ include file="ligneIdentification.jspf"%>


	<!--
*partie 1
* Vous   ajoutez une table comprenant un formulaire avec
*	un champ input texte "Objet"  (max 100 caractères).
*	Un champ textArea  "Description" ( 100 colonnes, 15 lignes) 
*	Et deux boutons "valider" et "abandonner"
* Le bouton "valider" appelle la page gestionBasedemande.jsp avec le contenu du formulaire, 
* cette page enregistre cette fiche dans la table "fiche", avec une référence au citoyen qui l'écrit.
* Le bouton "abandonner" vous ramène à une page d'accueil, par exemple "mesInformationsPersonelles.jsp", ou une autre
* vous passez aussi en paramètre : dateDemande et dateDemandemysql

 -->

	<!--
*partie 2
* Rajoutez  dans le formulaire de la page deposerUneDemande.jsp un bouton supplémentaire  
  " validez en ajoutant un document",  de nom "ajoutdoc"
   il appelle aussi la page gestionBasedemande.jsp
   il permettra de savoir qu'il faut joindre un document 
  (pdf, word, excel, jpg, etc..) à la  fiche.
*
-->
	<form name="depotfiche" method="get" action="gestionBaseDemande.jsp">
		<input name="dateDemandemysql" type="hidden" value=<%= dateDemandemysql%>>
		<input name="dateDemande" type="hidden" value=<%= dateDemande%>>
		<table class="CaseGrise1" style="width: 800;">
			<tr>
				<td class="Casebleu14">Si vous voulez illustrer vos propos par
					une photo, vous cliquez sur "valider en ajoutant une photo".
					Attention sa taille doit être inférieure à 200 koctets, vous avez
					des logiciels pour réduire la taille d'une image : waibeImage,
					image resizer, light image resizer, etc..
					Pour les documents, la limite est de 500 koctets.</td>
			</tr>
			<tr><td><label>Objet : </label></td></tr>
			<tr><td><input name="objet" type="text" pattern=".{4,100}" value="<%=objetDemande%>" required></td></tr>
			<tr><td><label>Description : </label></td></tr>
			<tr><td><textarea name="description" rows="15" cols="100" required></textarea></td></tr>
			<tr><td colspan="2"><button name="valider" type="submit" value="valider" style="width: 120px">Valider</button></td></tr>
			<tr><td colspan="2"><button name="ajoutdoc" type="submit" value="ajoutdoc" style="width: 240px">Valider en ajoutant un document</button></td></tr>
			<tr><td colspan="2"><button name="abandonner" type="button" value="abandonner" onClick="self.location.href='mesInformationsPersonnelles.jsp'" style="width: 120px">Abandonner</button></td></tr>
		</table>
	</form>
</body>
</html>
