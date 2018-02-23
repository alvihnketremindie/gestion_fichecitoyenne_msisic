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

	<h2>Veuillez vous identifier ou créer un compte</h2>

	<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
	<tags:formulaire couleur="#c0ebe7" action="identiteCitoyenne.jsp" methode="get" taille="30"
		soummettre="submit"
		nom="text"
		courriel="email"
		password="password"
		identifiant="text" />

</body>
</html>
