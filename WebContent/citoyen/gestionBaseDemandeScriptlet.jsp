<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<%
	ResultSet rset = null;
	PreparedStatement pstmt = null;
	String ajoutdoc = request.getParameter("ajoutdoc");
	String valider = request.getParameter("valider");
	String objet = request.getParameter("objet");
	String description = request.getParameter("description");

	int id = ((Integer) (session.getAttribute("id"))).intValue();
	String dateDemandemysql = request.getParameter("dateDemandemysql");

	/*	
	* inscription de la fiche dans la base   (id du Citoyen, objet, description, datedemande)
	*   
	*
	*/

	try {
		pstmt = conn1.prepareStatement("insert into fiche(demandeur, objet, description, datedemande) VALUES (?,?,?,?)");
		pstmt.setInt(1, id);
		pstmt.setString(2, objet);
		pstmt.setString(3, description);
		pstmt.setString(4, dateDemandemysql);
		pstmt.executeUpdate();
	} catch (Exception E) {
		System.out.println(" -------- probleme ouverture  " + E.getClass().getName());
		E.printStackTrace();
	}

	if (ajoutdoc != null) {
		/*
		* demande de upload d'un document appel à la page pour le choix du fichier : uploadPage.jsp  
		*/
%>
<jsp:forward page="uploadPage.jsp"></jsp:forward>
<%
	} else {
		/*
		* fiche sans document on retourne à une page d'accueil, par exemple
		*                       suivreMesDemandes.jsp
		*/
	}
%>
<jsp:forward page="envoieMail.jsp"></jsp:forward>
<!--<jsp:forward page="mesInformationsPersonnelles.jsp"></jsp:forward>-->
