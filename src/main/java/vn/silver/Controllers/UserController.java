package vn.silver.Controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.silver.Entities.Category;
import vn.silver.Entities.User;
import vn.silver.Entities.Video;
import vn.silver.Services.Impl.CategoryServiceImpl;
import vn.silver.Services.Impl.VideoServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	CategoryServiceImpl service = new CategoryServiceImpl();
	VideoServiceImpl videoService = new VideoServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();

		if (uri.contains("home")) {

			Video product = videoService.findById(1);
			req.setAttribute("product", product);

			RequestDispatcher rd = req.getRequestDispatcher("/views/user/home.jsp");
			rd.forward(req, resp);
		} else if (uri.contains("userCategory")) {
			HttpSession session = req.getSession();
			User currentUser = (User) session.getAttribute("account");

			List<Category> listCategorybyUser = service.getCategoryByUser(currentUser);
			req.setAttribute("listProduct", listCategorybyUser);

			RequestDispatcher rd = req.getRequestDispatcher("/views/user/userCategory.jsp");
			rd.forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
