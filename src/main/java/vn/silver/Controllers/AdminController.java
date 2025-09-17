package vn.silver.Controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.silver.Services.Impl.CategoryServiceImpl;
import vn.silver.Services.Impl.UserServiceImpl;
import vn.silver.Services.Impl.VideoServiceImpl;
import vn.silver.Entities.Category;
import vn.silver.Entities.User;
import vn.silver.Entities.Video;
import vn.silver.Utils.Constant;
import vn.silver.Utils.Constant.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminController() {
		super();

	}

	UserServiceImpl userService = new UserServiceImpl();
	CategoryServiceImpl categoryService = new CategoryServiceImpl();
	VideoServiceImpl videoService = new VideoServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();

		if (uri.contains("home")) {
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/home.jsp");
			rd.forward(req, resp);

		} else if (uri.contains("adminUser")) {
			List<User> listUser = userService.findAll();
			req.setAttribute("listuser", listUser);

			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/adminUser.jsp");
			rd.forward(req, resp);
		} else if (uri.contains("addUser")) {
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/addUser.jsp");
			rd.forward(req, resp);

		} else if (uri.contains("deleteUser")) {
			String sid = req.getParameter("id");
			int id = Integer.parseInt(sid);
			userService.delete(id);
			resp.sendRedirect(req.getContextPath() + "/admin/adminUser");
		} else if (uri.contains("editUser")) {
			String sid = req.getParameter("id");
			int id = Integer.parseInt(sid);
			User user = userService.findById(id);
			req.setAttribute("user", user);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/editUser.jsp");
			rd.forward(req, resp);

		} else if (uri.contains("findUser")) {
			String keyword = req.getParameter("keyword");

			List<User> users;
			if (keyword != null && !keyword.trim().isEmpty()) {
				users = userService.searchByKeyword(keyword);
			} else {
				users = userService.findAll();
			}

			req.setAttribute("listuser", users);

			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/adminUser.jsp");
			rd.forward(req, resp);

		} else if (uri.contains("findCategory")) {
			String keyword = req.getParameter("keyword");

			List<Category> users;
			if (keyword != null && !keyword.trim().isEmpty()) {
				users = categoryService.searchByKeyword(keyword);
			} else {
				users = categoryService.findAll();
			}

			req.setAttribute("listcategory", users);

			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/adminCategory.jsp");
			rd.forward(req, resp);
		} else if (uri.contains("adminCategory")) {
			List<Category> listCategory = categoryService.findAll();
			req.setAttribute("listcategory", listCategory);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/adminCategory.jsp");
			rd.forward(req, resp);
		} else if (uri.contains("deleteCategory")) {
			String sid = req.getParameter("id");
			int id = Integer.parseInt(sid);
			categoryService.delete(id);
			resp.sendRedirect(req.getContextPath() + "/admin/adminCategory");
		} else if (uri.contains("addCategory")) {
			List<User> users = userService.findAll();
			req.setAttribute("users", users);

			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/addCategory.jsp");
			rd.forward(req, resp);
		} else if (uri.contains("editCategory")) {
			String sid = req.getParameter("id");
			int id = Integer.parseInt(sid);
			Category category = categoryService.findById(id);
			req.setAttribute("category", category);

			List<User> users = userService.findAll();
			req.setAttribute("users", users);

			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/editCategory.jsp");
			rd.forward(req, resp);
		} else if (uri.contains("adminVideo")) {
			Video video = videoService.findById(1);
			req.setAttribute("video", video);

			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/adminVideo.jsp");
			rd.forward(req, resp);
		} else if (uri.contains("editVideo")) {
			String sid = req.getParameter("id");
			int id = Integer.parseInt(sid);
			Video video = videoService.findById(id);
			req.setAttribute("video", video);

			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/editVideo.jsp");
			rd.forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("addUser")) {

			String taikhoan = req.getParameter("taikhoan");
			String matkhau = req.getParameter("matkhau");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			String roleId = req.getParameter("roleId");
			int roleid = Integer.parseInt(roleId);
			String bietdanh = req.getParameter("bietdanh");
			User user = new User(taikhoan, matkhau, email, phone, bietdanh, roleid);
			// Lấy ảnh
			String fname = "";
			String uploadPath = Constant.UPLOAD_DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = req.getPart("avatar");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;

//					fname = filename;
					// upload file
					part.write(uploadPath + "User/" + fname);

					user.setAvatar("User/" + fname);
				} else {
					user.setAvatar("User/default.jpg");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			userService.create(user);
			resp.sendRedirect(req.getContextPath() + "/admin/adminUser");

		} else if (uri.contains("editUser")) {
			String sid = req.getParameter("id");
			int id = Integer.parseInt(sid);
			String taikhoan = req.getParameter("taikhoan");
			String matkhau = req.getParameter("matkhau");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			String roleId = req.getParameter("roleId");
			int roleid = Integer.parseInt(roleId);
			String bietdanh = req.getParameter("bietdanh");

			User user = userService.findById(id);
			user.setTaikhoan(taikhoan);
			user.setMatkhau(matkhau);
			user.setEmail(email);
			user.setPhone(phone);
			user.setBietdanh(bietdanh);
			user.setRoleId(roleid);

			User userOld = userService.findById(id);
			String fileold = userOld.getAvatar();
			// Lấy ảnh
			String fname = "";
			String uploadPath = Constant.UPLOAD_DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = req.getPart("avatar");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;

//					fname = filename;
					// upload file
					part.write(uploadPath + "User/" + fname);

					user.setAvatar("User/" + fname);
				} else {
					user.setAvatar(fileold);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			userService.update(user);
			resp.sendRedirect(req.getContextPath() + "/admin/adminUser");
		} else if (uri.contains("addCategory")) {

			String tensanpham = req.getParameter("tensanpham");
			String userid = req.getParameter("userId");
			int userId = Integer.parseInt(userid);

			User user = userService.findById(userId);

			Category category = new Category();
			category.setTensanpham(tensanpham);
			category.setUser(user);
			// Lấy ảnh
			String fname = "";
			String uploadPath = Constant.UPLOAD_DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = req.getPart("hinhanh");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;

//					fname = filename;
					// upload file
					part.write(uploadPath + "Category/" + fname);

					category.setHinhanh("Category/" + fname);
				} else {
					category.setHinhanh("Category/default.jpg");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			categoryService.create(category);
			resp.sendRedirect(req.getContextPath() + "/admin/adminCategory");
		} else if (uri.contains("editCategory")) {

			String sid = req.getParameter("id");
			int id = Integer.parseInt(sid);
			String tensanpham = req.getParameter("tensanpham");
			String userid = req.getParameter("userId");
			int userId = Integer.parseInt(userid);

			User user = userService.findById(userId);

			Category category = categoryService.findById(id);

			category.setTensanpham(tensanpham);
			category.setUser(user);
			// Lấy ảnh
			String fname = "";
			String uploadPath = Constant.UPLOAD_DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = req.getPart("hinhanh");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;

//				fname = filename;
					// upload file
					part.write(uploadPath + "Category/" + fname);

					category.setHinhanh("Category/" + fname);
				} else {
					category.setHinhanh(category.getHinhanh());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			categoryService.update(category);
			resp.sendRedirect(req.getContextPath() + "/admin/adminCategory");

		} else if (uri.contains("editVideo")) {

			String sid = req.getParameter("id");
			int id = Integer.parseInt(sid);
			String tensanpham = req.getParameter("tenvideo");

			Video video = videoService.findById(id);

			video.setTenvideo(tensanpham);
			// Lấy ảnh
			String fname = "";
			String uploadPath = Constant.UPLOAD_DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = req.getPart("video");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;

//				fname = filename;
					// upload file
					part.write(uploadPath + fname);

					video.setVideo(fname);
				} else {
					video.setVideo(video.getVideo());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			videoService.update(video);
			resp.sendRedirect(req.getContextPath() + "/admin/adminVideo");
		}
	}
}
