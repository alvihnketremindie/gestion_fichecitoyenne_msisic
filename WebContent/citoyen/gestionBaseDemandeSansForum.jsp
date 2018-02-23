<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/*	
	* inscription de la fiche dans la base (id du Citoyen, objet, description, datedemande)
	*   
	* verification de l'unicité de la fiche en premier lieu
	*/
%>
<sql2:query var="result1" dataSource="DonneesBase">
	SELECT id FROM ficheSansForum  where demandeur =? and objet =? and description =? and datedemande =?
	<sql2:param value="${sessionScope.id}"/>
	<sql2:param value="${param.objet}"/>
	<sql2:param value="${param.description}"/>
	<sql2:param value="${param.dateDemandemysql}"/>
</sql2:query>
<c:set var="row" value="${result1.rows}"/>
<c:set var="row0" value="${row[0].id}"/>

<c:if test="${row0 != null}">
	<%
		/*  correspondance trouver retour à mesInformationsPersonnelles.jsp */
	%>
	<c:redirect url="mesInformationsPersonnelles.jsp" />
</c:if>
<c:if test="${row0 == null}">
	<%
		/* correspondance non trouver le traitement continue */
	%>
	<sql2:update var="result" dataSource="DonneesBase">
		insert into ficheSansForum (demandeur, objet, description, datedemande)
		VALUES (${sessionScope.id},
		"${param.objet}",
		"${param.description}",
		"${param.dateDemandemysql}")
	</sql2:update>
	<c:if test="${param.ajoutdoc != null}">
		<%
			/* demande de upload d'un document appel à la page pour le choix du fichier : uploadPage.jsp */
		%>
		<c:redirect url="uploadPage.jsp" />
	</c:if>
	<c:if test="${param.ajoutdoc == null}">
		<%
			/* fiche sans document on retourne à une page d'accueil, par exemple suivreMesDemandes.jsp */
		%>
		<c:redirect url="envoieMail.jsp" />
	</c:if>
</c:if>
