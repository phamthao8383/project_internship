package controller;

import model.Account;
import model.ExamHistory;
import model.User;
import service.AccountService;
import service.UserService;
import service.impl.AccountServiceImpl;
import service.impl.UserServiceImpl;
import util.HandleString;
import util.PasswordEncryption;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet(name = "UserServlet", urlPatterns = {"/userServlet"})
public class UserServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    private AccountService accountService = new AccountServiceImpl();
    private HandleString handleString = new HandleString();
    private PasswordEncryption passwordEncryption = new PasswordEncryption();

    private int pageSize = 10;

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
            case "updateMyInfo":
                updateMyInfo(request,response);
                break;
            case "updateImage" :
                updateImage(request,response);
                break;
            case "updatePassword":
                updatePassword(request, response);
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


//  Ve trang chủ
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
//            quay ve trang đăng nhập
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
//            Thất bại thì quay ve lại trang login
            else  {
                request.setAttribute("sai", 1);
                goLogin(request,response);
            }

    }
// Xem thông tin cá nhân
    private void goGetInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int index = Integer.parseInt(request.getParameter("index"));
        if (index == 0) {
            index = 1;
        }
        int count = userService.countHistory(idUser);
        System.out.println(count);
        int engPage = count / pageSize;
        if(count % pageSize != 0) {
            engPage++;
        }

        request.setAttribute("countPage", engPage);
        request.setAttribute("indexPage", index);
        request.setAttribute("pageSize", pageSize);

        System.out.println(engPage);



        request.setAttribute("user", userService.getUserId(idUser));
        request.setAttribute("history", userService.getListExamHistoryPage(idUser,index,pageSize));
        request.getRequestDispatcher("/user/TrangCaNhan.jsp").forward(request, response);
    }

    private void updateMyInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String name = request.getParameter("name");
        name = handleString.handleFont(name);
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        address = handleString.handleFont(address);
        String phone = request.getParameter("phone");
        User user = new User(idUser,name,email,phone,address);
        userService.updateUserId(user);
        goGetInfo(request,response);
    }

    private void updateImage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF8");
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String account = request.getParameter("account");
        Part part = request.getPart("inputFile");
        String realPath = request.getServletContext().getRealPath("/uploads");
        // chổ ni ae tự thêm đường link foder uploads của dự án vào
        String realPath2 = "D:\\InternNhom2\\project_internship\\Webquiz\\src\\main\\webapp\\uploads";
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

        if(!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }
        System.out.println(realPath);
//        cái này xong là lưu file được rồi.
//        part.write(realPath+"/"+account + filename);
        part.write(realPath+"/"+account + filename);
//        chừ lưu filename vào database nữa là ok
        userService.updateImageUserId(idUser, account + filename);
        goGetInfo(request,response);
    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String account = request.getParameter("nameAccount");
        String password = request.getParameter("password");
        password = passwordEncryption.encrypt(password);
        String ps1 = request.getParameter("newPassword");
        ps1 = passwordEncryption.encrypt(ps1);
        String ps2 = request.getParameter("confirmPassword");
        ps2 = passwordEncryption.encrypt(ps2);

        if(ps1.equals(ps2)) {
            Account acc = accountService.CheckLogIn(account,password);
            if(acc.getUsername()!=null) {
                accountService.editPassword(account, ps1);
                System.out.println("dung rồi");
                goGetInfo(request,response);
            } else {
                goGetInfo(request,response);
            }

        } else {
            System.out.println("sai roi cau a");
        }

    }


    private void createNewAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            response.setContentType("text/html;charset=UTF8");
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            String nameAccount = request.getParameter("nameAccount");
            String name = request.getParameter("name");
            name = handleString.handleFont(name);
            name = handleString.handleName(name);
            String ps1 = request.getParameter("passw");
            String ps2 = request.getParameter("con_passw");
            ps1 = passwordEncryption.encrypt(ps1);
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            address = handleString.handleFont(address);
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
