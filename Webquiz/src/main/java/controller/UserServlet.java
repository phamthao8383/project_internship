package controller;

import model.Account;
import service.AccountService;
import service.AccountServiceImpl;
import service.CustomerService;
import service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserServlet", urlPatterns = "/userServlet")
public class UserServlet extends HttpServlet {
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
//            case "delete":
//                deleteCustomer(request, response);
//                break;
//            case "update":
//                updateCustomer(request, response);
//                break;
//            case "search":
//                getCustomerListPage(request,response);
////                break;
//            default:
//                getCustomerList(request,response);
//                break;
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
//            case "create":
//                response.sendRedirect("customerhdl.jsp");
//                break;
//            case "update":
//                goUpdate(request,response);
//                break;
//            case "search":
//                getCustomerListPage(request,response);
            default:
                goHomePage(request,response);
                break;
        }
    }
//    Về trang chủ
    private void goHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DangNhapDangKi.jsp");
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    private void goLogin(HttpServletRequest request, HttpServletResponse response) {



    }

    private void logInUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
            String userAccount = request.getParameter("account");
            String passWord = request.getParameter("password");

           Account account = accountService.CheckLogIn(userAccount,passWord);

            if(account.getUsername() != null ) {
//                Khởi tạo session
                HttpSession session = request.getSession();
//                  Thiết lập giá trị trong session
                session.setAttribute("account", account);
                System.out.println(account);
//                response.sendRedirect("/index.jsp");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                dispatcher.forward(request,response);
            }
//            Thất bại thì quay về lại trang login
            else  {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DangNhapDangKi.jsp");
                dispatcher.forward(request,response);
            }

    }

    public void getMemberList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }
}
