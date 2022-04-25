package controller;

import repository.BaseRepository;
import util.PasswordEncryption;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet(name = "/user/newPassword" ,urlPatterns = "/userPass")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BaseRepository baseRepository = new BaseRepository();
	PasswordEncryption passwordEncryption = new PasswordEncryption();
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
//
				newPassword = passwordEncryption.encrypt(newPassword);
				System.out.println(session.getAttribute("email"));
				String myQuery=  "update account set account.password = ? where  account.username in (\n" +
						"\tselect ac.username from\n" +
						"\t(SELECT * FROM quiz_web.account) as ac inner join user on user.username = ac.username\n" +
						"    where email = ?)";
				PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(myQuery);
				preparedStatement.setString(1, newPassword);

				preparedStatement.setString(2, (String) session.getAttribute("email"));

				int rowCount = preparedStatement.executeUpdate();
				System.out.println(rowCount);
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/user/DangNhapDangKi.jsp");
					dispatcher.forward(request,response);
				} else {
					request.setAttribute("status", "resetFailed");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/user/DangNhapDangKi.jsp");
					dispatcher.forward(request,response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
