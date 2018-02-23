
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2"%>




<!-- modification  des informations sur un  citoyen dans la base et dans les variables de session  -->

<c:if test="${param.modifier != null}">
	<sql2:update var="result" dataSource="DonneesBase">
    update  personne set prenom="${param.prenom}", fixe="${param.fixe}", mobile="${param.mobile}", rue="${param.rue}", ville="${param.ville}" where id= ${sessionScope.id}
 		<c:set var="prenom" value="${param.prenom}" scope="session" />
		<c:set var="fixe" value="${param.fixe}" scope="session" />
		<c:set var="mobile" value="${param.mobile}" scope="session" />
		<c:set var="rue" value="${param.rue}" scope="session" />
		<c:set var="ville" value="${param.ville}" scope="session" />
	</sql2:update>
</c:if>



<!--  appel page suivante dans tous les cas -->

<c:redirect url="suivreMesDemandes.jsp" />





