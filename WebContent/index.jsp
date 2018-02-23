<%@ page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>identification créateur de fiche d'intervention</title>
<link type="text/css" href="style/deco.css" rel="stylesheet">
<style type="text/css">
td {
	width: 300px;
}
</style>
</head>
<body>
	<img src="image/logo.jpg" width="500">
	<h3>Service de relation avec les Citoyens</h3>
	<h3>Gestion des fiches citoyens</h3>
	<!--  avant l'identification on efface toutes les données des sessions précédentes -->

	<!-- 
****   Affichage d'un message si le parametre "erreur" est présent
****   Affichage d'un message si le parametre "finsession" est présent
-->

	<%
		session.invalidate();
		if (request.getParameter("erreur") != null) {
	%>
	<font color="red">Attention! Vous avez fait une mauvaise
		manipulation. Veuillez recommencer</font>
	<%
		}
	%>
	<%
		if (request.getParameter("finsession") != null) {
	%>
	<font color="red">Votre session a expiré. Veuillez vous
		reconnecter</font>
	<%
		}
	%>

	<h2>Veuillez vous identifier ou créer un compte</h2>
	<form name="commande" method="get" action="identiteCitoyen.jsp">
		<table style="width: 500;" class="Casebleu1">
			<tr>
				<td colspan="2"><strong>Pour une connexion remplissez
						les 2 premiers champs. Pour une nouvelle inscription remplissez
						les 4 champs</strong></td>
			</tr>
			<!-- 
****   un  "input text" pour l'identifiant, mini  4 caractères maxi 10 caractères
        un "input password" pour le mot de passe
-->
			<tr>
				<td><label>Identifiant : </label></td>
				<td><input name="identifiant" type="text" pattern=".{4,10}" required title="mini 4 caracteres, maxi 10 caracteres"></td>
			</tr>
			<tr>
				<td><label>Mot de passe : </label></td>
				<td><input name="motPasse" type="password" required></td>
			</tr>
			
			<!-- 
****       un  "input text"  pour le nom   mini  4 caractères maxi 10 caractères
           un  "input email" un pour le mail, avec vérification de la syntaxe, maxi 30 caractères
           expression régulière possible   "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"          
-->
			
			<tr>
				<td><label>Nom : </label></td>
				<td><input name="nom" type="text" pattern=".{4,10}" ></td>
			</tr>
			<tr>
				<td><label>Mail : </label></td>
				<td><input name="mail" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" maxlength="30" title="mail 30 caracteres maxi"></td>
			</tr>
			<tr>
				<td colspan="2"><button name="connexion" type="submit" value="se connecter" style="width: 120px">se connecter</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
