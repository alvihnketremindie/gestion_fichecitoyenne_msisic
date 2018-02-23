<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="gerelesCitoyen" class="utile.GereCitoyen" scope="session" />
<!DOCTYPE html>
<html>
<!--- 
  **** les 4 propriétés du bean nom, identifiant, mail, motPasse doivent être initialisées 
        par la page, en utilisant le "jsp:setProperty "
-->
<jsp:setProperty name="gerelesCitoyen" property="*" />

<%!ResultSet rset = null;%>
<!--  definition de la base dans le bean et recherche du Citoyen  dans la base par le bean -->

<%
	gerelesCitoyen.ouverture("demandecitoyen");
	/*
	**  Recherche de la personne dans la base par le bean, méthode recherchePersonne()
	**
	**      s'il n'est pas   trouvé et que le mail et le nom ne sont pas présents
	**                         appel à la page d'inscription "index.jsp"
	**      s'il n'est pas   trouvé et que le mail et le nom sont présents
	**                         inscription méthode inscrireUtilisateur()
	*/
	if (!gerelesCitoyen.recherchePersonne()) {
		if (gerelesCitoyen.getMail()==null || gerelesCitoyen.getMail().trim().equals("") || gerelesCitoyen.getNom()==null || gerelesCitoyen.getNom().trim().equals("")) {
%>
<jsp:forward page="index.jsp">
	<jsp:param name="erreur" value="notfound"/>
</jsp:forward>
<%
		} else {
			gerelesCitoyen.inscrireUtilisateur();
		}
	}
	/*
	** Arrivé ici, on sait que la personne est inscrite, on recherche ses caractéristiques par recherchePersonne()
	** et on met en variable de session, (gardez les mêmes noms pour la suite)
	**              id, nom, prenom, mobile, fixe, rue, ville, identifiant, mail, fonction
	*/
	if(gerelesCitoyen.recherchePersonne()) {
		rset = gerelesCitoyen.getRset();
		System.out.println("Inscription et Connexion OK ---- Mise en session");
		session.setAttribute("id", rset.getInt("id"));
		session.setAttribute("nom", rset.getString("nom"));
		session.setAttribute("prenom", rset.getString("prenom"));
		session.setAttribute("identifiant", rset.getString("identifiant"));
		session.setAttribute("mail", rset.getString("mail"));
		session.setAttribute("fixe", rset.getString("fixe"));
		session.setAttribute("mobile", rset.getString("mobile"));
		session.setAttribute("rue", rset.getString("rue"));
		session.setAttribute("ville", rset.getString("ville"));
		session.setAttribute("fonction", rset.getString("fonction"));
	
		/*
		** si c'est un administrateur : appel à la page  "gereDemandeCitoyen.jsp"
		** si c'est un citoyen appel à la page  mesInformationsPersonnelles.jsp
		*/
		if (rset.getString("fonction").equals("citoyen")) {
%>
<c:redirect url="citoyen/mesInformationsPersonnelles.jsp" />
<%
		} else {
%>
<c:redirect url="citoyen/gereDemandeCitoyen.jsp" />
<%
		}
	}
	
%>
</html>
