<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--
inscription de la fiche dans la base (id du Citoyen, objet de la demande, date de la demande)
verification de la présence de la fiche en premier lieu (Meme demandeur et meme objet)
--%>
<sql2:query var="result1" dataSource="DonneesBase">
	SELECT id FROM fiche  where demandeur =? and objet =?
	<sql2:param value="${sessionScope.id}" />
	<sql2:param value="${param.objet}" />
</sql2:query>
<c:set var="row" value="${result1.rows}" />
<c:set var="row0" value="${row[0].id}" />

<c:if test="${row0 == null}">
	<%--
	Correspondance non trouvée.
	Premiere occurence
	Insertion de la nouvelle demande
	--%>
	<sql2:update var="result" dataSource="DonneesBase">
		insert into fiche (demandeur, objet, datedemande)
		VALUES (${sessionScope.id},
		"${param.objet}",
		"${param.dateDemandemysql}")
	</sql2:update>
	<%--
	Recuperation de l'id d'insertion pour la correspondance entre les tables "fiche" et "interaction"
	--%>
	<sql2:query var="result1" dataSource="DonneesBase">
		SELECT id FROM fiche  where demandeur =? and objet =?
		<sql2:param value="${sessionScope.id}" />
		<sql2:param value="${param.objet}" />
	</sql2:query>
	<c:set var="row" value="${result1.rows}" />
	<c:set var="row0" value="${row[0].id}" />
</c:if>
<%--
Dans tous les cas l'insertion des nouvelles description continuent dans la table "interaction"
 (id de l'interaction, contenu de la description, date de l'interaction)
 puis mis a jour du statut a "Non traite"
--%>
<sql2:update var="result" dataSource="DonneesBase">
	insert into interaction (type, contenu, dateinteraction, ficheId)
	VALUES ("description",
	"${param.description}",
	NOW(),
	${row0})
</sql2:update>
<sql2:update var="result" dataSource="DonneesBase">
	update fiche set statut = 'Non traite' where id = ${row0}
</sql2:update>
<%
/*
Enregistrement de valeur en session (Objet de la demande et le numero de la fiche)
*/
session.setAttribute("objetDemande", request.getParameter("objet"));
%>
<c:if test="${param.ajoutdoc != null}">
<%--
La demande contient l'upload d'un document appel à la page pour le choix du fichier : uploadPage.jsp
--%>
	<c:redirect url="uploadPage.jsp" />
</c:if>
<c:if test="${param.ajoutdoc == null}">
	<%
		/* fiche sans document on retourne à une page d'accueil, par exemple suivreMesDemandes.jsp */
	%>
	<c:redirect url="envoieMail.jsp" />
</c:if>

