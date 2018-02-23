package utile;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class portier implements Filter {
	
	private FilterConfig filterConfig = null;

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException { 
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
		HttpSession session = hrequest.getSession(true);

		String nom = (String)session.getAttribute("nom");
		String identifiant= (String) session.getAttribute("identifiant");
		if(nom == null || identifiant == null || nom.equals("") || identifiant.equals("")) {
			// Le nom ou l'identifiant n'est pas reconnu au niveau de la session
			hresponse.sendRedirect("http://localhost:8080/gestionCitoyen/index.jsp");
		} else {
			chain.doFilter(request, response);
		}

	}		
	
	public void destroy() {
		this.filterConfig = null;
	}
}
