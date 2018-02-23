<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Chargement d'un fichier chez l'utilisateur</title>
	<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body>
<%
if (request.getParameter("tropgrand") != null) {
%>
<h3>Attention votre fichier doit faire moins de 350 koctets</h3>
<%
}
%>
	<form enctype="multipart/form-data" action="uploadGestion.jsp" method=post>
		<br>
		<br>
		<br>
		<div style="text-align: center;">
			<table style="border: 1px solid black" class="Casebleu1">
				<tr><td colspan="2"><p align="center"><b>Chargement de votre fichier</b></td></tr>
				<tr>
					<td><p><b>Choisissez le fichier à transmettre, sa taille ne doit pas dépasser 350 koctets </b></p></td>
					<td><input name="F1" type="file"></td>
				</tr>
				<tr><td colspan="2"><p align="right"><input type="submit" value="Envoyez le fichier"></p></td></tr>
			</table>
		</div>
	</form>
</body>
</html>