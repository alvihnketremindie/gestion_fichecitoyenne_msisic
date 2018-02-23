
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>

<%@ include file="ouvreBase2.jsp"%>
<%
	Statement stmt = conn1.createStatement();
	ResultSet rset = null;
	PreparedStatement pstmt = null;
	String modifier = request.getParameter("modifier");
	String prenom = request.getParameter("prenom");
	String rue = request.getParameter("rue");
	String ville = request.getParameter("ville");
	String fixe = request.getParameter("fixe");
	String mobile = request.getParameter("mobile");
	int id = ((Integer) (session.getAttribute("id"))).intValue();

	// modification  des informations sur un  citoyen
	if (modifier != null) {
		// inscription des caractéristiques de la personne dans la base  et dans les variables de sessions

		pstmt = conn1
				.prepareStatement("UPDATE  personne  set prenom=?,fixe=?,mobile=?,rue=?,ville=?  where id =?");
		pstmt.setString(1, prenom);
		pstmt.setString(2, fixe);
		pstmt.setString(3, mobile);
		pstmt.setString(4, rue);
		pstmt.setString(5, ville);
		pstmt.setInt(6, id);
		pstmt.executeUpdate();

		session.setAttribute("prenom", prenom);
		session.setAttribute("mobile", mobile);
		session.setAttribute("fixe", fixe);
		session.setAttribute("rue", rue);
		session.setAttribute("ville", ville);

	}
	response.sendRedirect("suivreMesDemandes.jsp");
%>