<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
     <link type="text/css" href="../style/deco.css" rel="stylesheet" > 
  </head>
    
  <body   class= "CaseGrise" >
  <%@ include file="accesmenuFiche.jspf" %>  

  <%    
String nom= (String)session.getAttribute("nom");
String identifiant= (String)session.getAttribute("identifiant");
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee(); 
%>
<%@ include file="ligneIdentification.jspf" %> 


<% 
//passage de ces variables dans le contexte JSTL
	  pageContext.setAttribute("nom", nom);	
	  pageContext.setAttribute("identifiant", identifiant);	
%>
  <sql:query var="result" dataSource="DonneesBase">
             SELECT * FROM personne  where nom = ? and identifiant =?
            <sql:param value="${nom}" />
			<sql:param value="${identifiant}" />
   </sql:query>  


	  <c:if test="${result != null}" >
	  <c:set var="rowa" value="${result.rows[0]}"/>

<form action = "gestionBaseCitoyen.jsp" > 
<table width="800" class="Casebleu"> 
</table> 

<table width="800" class="CaseGrise1" style ="border:0px" > 
  <tr> <td >
    <table width="800"> 
      <tr> <td class="Casebleu"> 
        Modifier les informations ci dessous si elle sont inexactes ou incomplètes
      </td> </tr>
    </table>  
  </td> </tr> 
  <tr> <td >  
  <table width="800" class="Casebleu1" style ="border:0px">
    <tr><td >
        Nom :    <%=nom %>
    </td>
    <td>
       prénom : 
         <INPUT type=text name="prenom"   id="prenom" style ="border:0px"  value="<c:out value="${rowa.prenom }" />">   
    </td>
    <TD> 
       adresse de l'administré :  numero, Rue, lieu dit
        <INPUT type=text name="rue" size="40"    id="rue" style ="border:0px" value="${rowa.rue }" > 
      </td>
      <td>   
          code postel, ville
            <INPUT type=text name="ville" size="40" value ="${rowa.ville }"   id="ville" style ="border:0px">   
     </TD>  </tr>
    </table> 
 </td></tr>
 <tr>  <td>  
   <table width="800" class="Casebleu1" style ="border:0px">
    <tr> <td>
         Téléphone fixe : 
       <INPUT type=text name="fixe"    id="fixe" style ="border:0px" value="${rowa.fixe }" > 
     </td>
     <td>
      Téléphone mobile :
       <INPUT type=text name="mobile"    id="mobile"     style ="border:0px" value="${rowa.mobile }" >  
     </td>
     <td>
          Adresse messagerie : "${rowa.mail}"
  
      </td> </tr>
  <tr>  <td>  
   	<button  type="submit" name="modifier" value="modifier" onclick="modifier.value=this.value" style="width: 90px"> modifier</button> 
 </td> </tr>
   </table> 
 </td> </tr>
</table> 
</form>
 </c:if>   
  </body>
</html>
