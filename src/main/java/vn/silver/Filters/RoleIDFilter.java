package vn.silver.Filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebFilter(urlPatterns = {
	    "/views/admin/*",
	    "/views/manager/*",
	    "/views/user/*"
	})
public class RoleIDFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        
        if(session == null || session.getAttribute("roleId")==null) {
        	resp.sendRedirect(req.getContextPath() + "/views/login.jsp");
            return;
        }
        int roleId = (int) session.getAttribute("roleId");
        String path = req.getRequestURI();

        // kiểm tra role hợp lệ với path
        if (path.contains("/views/admin/") && roleId != 1) {
            resp.sendRedirect(req.getContextPath() + "/views/login.jsp");
            return;
        } else if (path.contains("/views/manager/") && roleId != 2) {
            resp.sendRedirect(req.getContextPath() + "/views/login.jsp");
            return;
        } else if (path.contains("/views/users/") && roleId != 3) {
            resp.sendRedirect(req.getContextPath() + "/views/login.jsp");
            return;
        }

        // nếu hợp lệ thì cho đi tiếp
        chain.doFilter(request, response);
	}

}
