package security;

import java.io.IOException;
import java.security.Principal;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	private static final Logger logger = Logger.getLogger(LoginFilter.class.getName());
    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpServletRequest httpRequest = (HttpServletRequest) request;
	    Principal user = httpRequest.getUserPrincipal();
	    HttpSession session = httpRequest.getSession();
	    if (user != null && session.getAttribute("user") == null) {
	        session.setAttribute("user", user);

	        // First-time login. You can do your intercepting thing here.
	        logger.info("First-time login - intercepted. Session ID: " + session.getId()); 
	        logger.info("Cookies: ");
	        for (Cookie c :  httpRequest.getCookies()) {
	        	logger.info(c.getName() + "=" + c.getValue());
	        }
	    }
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
