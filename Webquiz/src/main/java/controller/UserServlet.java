package controller;

import model.Account;
import model.ExamHistory;
import model.User;
import service.AccountService;
import service.UserService;
import service.impl.AccountServiceImpl;
import service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserServlet", urlPatterns = {"/userServlet", "/user"})
public class UserServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    private AccountService accountService = new AccountServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                logInUser(request, response);
                break;
            case "infoUser":
                goGetInfo(request,response);
                break;
            case "createAccount":
                createNewAccount(request, response);
                break;
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action ==null) {
            action = "";
        }
        switch (action) {

            case "login":
                goLogin(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "infoUser":
                goGetInfo(request,response);
                break;

            default:
                goHomePage(request,response);
                break;
        }
    }


//  Về trang chủ
    private void goHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hiển thị danh sách vinh danh / thống kê thành viên
        response.setContentType("text/html;charset=UTF8");
        HomeServlet homeServlet = new HomeServlet();
        homeServlet.getMaxPoint(request, response);
        homeServlet.getMemberNumber(request, response);
        homeServlet.getNewMember(request, response);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request,response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
//            Hủy session
            session.invalidate();
//            quay về trang đăng nhập
            goLogin(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    private void goLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/user/DangNhapDangKi.jsp");
        dispatcher.forward(request,response);

    }

    private void logInUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
            String userAccount = request.getParameter("account");
            String passWord = request.getParameter("password");

           Account account = accountService.CheckLogIn(userAccount,passWord);
            User user = userService.getUserAccount(userAccount);

            if(account.getUsername() != null ) {
//                Khởi tạo session
                HttpSession session = request.getSession();
//                  Thiết lập giá trị trong session
                session.setAttribute("account", account);
                session.setAttribute("user", user);
                System.out.println(account);
//                response.sendRedirect("/index.jsp");
                HomeServlet homeServlet = new HomeServlet();
                homeServlet.getMaxPoint(request, response);
                homeServlet.getMemberNumber(request, response);
                homeServlet.getNewMember(request, response);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                dispatcher.forward(request,response);
            }
//            Thất bại thì quay về lại trang login
            else  {
                goLogin(request,response);
            }

    }
// Xem thông tin cá nhân
    private void goGetInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        request.setAttribute("history", userService.getListExamHistory(idUser));
        request.getRequestDispatcher("/user/TrangCaNhan.jsp").forward(request, response);
    }

    private void createNewAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF8");
            String nameAccount = request.getParameter("nameAccount");
            String name = request.getParameter("name");
            String ps1 = request.getParameter("passw");
            String ps2 = request.getParameter("con_passw");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            int i = accountService.CheckAccount(nameAccount);
            if(i == 1 ) {
                System.out.println("Trùng tên account!!");
            } else if(i == 0) {
                User user = new User(name, email,phone,address,"img",nameAccount);
                Account account = new Account(nameAccount, ps1, 2);
                accountService.AddAccount(account);
                userService.addUserList(user);
                goLogin(request,response);
            }
    }

}
