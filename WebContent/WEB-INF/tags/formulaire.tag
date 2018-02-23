<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="couleur" required="true" %>
<%@ attribute name="action" required="true" %>
<%@ attribute name="methode" required="true" %>
<%@ attribute name="taille" required="true" %>
<%@ tag body-content="empty" dynamic-attributes="ligneTexte" %>

<form method="${methode}" action="${action}">
	<table style="background-color:${couleur};">
		<c:forEach var="ligne" begin="0" items="${ligneTexte}" varStatus="loopCounter">
			<c:if test="${ligne.value!='submit'}">
				<tr>
					<c:set var="nom" value="${ligne.key}" />
					<td>${nom} :</td>
					<td><input type="${ligne.value}" name="${nom}" size="${taille}" /></td>
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="ligne" begin="0" items="${ligneTexte}" varStatus="loopCounter">
			<c:if test="${ligne.value=='submit'}">
				<tr>
					<td>${ligne.key} :</td>
					<td><input type="${ligne.value}" name="${ligne.key}" size="${taille}" /></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</form>