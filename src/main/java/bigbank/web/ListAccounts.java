package bigbank.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

import bigbank.BankService;

@Controller
public class ListAccounts {

    private final BankService bankService;

    public ListAccounts(BankService bankService) {
        Assert.notNull(bankService);
        this.bankService = bankService;
    }

    @RequestMapping("/listAccounts.html")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response, @CookieValue("JSESSIONIDSSO") String ssoID) throws Exception {
        // Security check (this is unnecessary if Spring Security is performing the authorization)
//        if (request.getUserPrincipal() == null) {
//            throw new AuthenticationCredentialsNotFoundException("You must login to view the account list (Spring Security message)"); // only for Spring Security managed authentication
//        }

    	
        // Actual business logic
        ModelAndView mav = new ModelAndView("listAccounts");
        mav.addObject("accounts", bankService.findAccounts());
        // access the security context
    	mav.addObject("principal", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
    	mav.addObject("ssoID", ssoID);
        return mav;
    }

}
