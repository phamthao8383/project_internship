package controller;

import model.Account;
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
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet(name = "UserServlet", urlPatterns = {"/userServlet"})
public class UserServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    private AccountService accountService = new AccountServiceImpl();
    private HandleString handleString = new HandleString();
    private PasswordEncryption passwordEncryption = new PasswordEncryption();

    private int pageSize = 5;

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
            default:
                goLogin(request, response);
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
        String indexStr = request.getParameter("index");
        String check = request.getParameter("check");
        if(check == "") {
            check ="0";
        }

        if (indexStr == "" ) {
            indexStr = "1";
        }
        int index = Integer.parseInt(indexStr);

        int count = userService.countHistory(idUser);
        System.out.println(count);
        int engPage = count / pageSize;
        if(count % pageSize != 0) {
            engPage++;
        }
//                  Thiết lập giá trị trong session
        request.setAttribute("check", check);
        request.setAttribute("countPage", engPage);
        request.setAttribute("indexPage", index);
        request.setAttribute("check", check);
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
        String imageLink = request.getParameter("imageLink");
        System.out.println(imageLink);
//        Part part = request.getPart("inputFile");
//        System.out.println(part);
       /* String realPath = request.getServletContext().getRealPath("/uploads");
//         chổ ni ae tự thêm đường link foder uploads của dự án vào
        String realPath2 = "D:\\InternNhom2\\project_internship\\Webquiz\\src\\main\\webapp\\uploads";
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

        if(!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }
        System.out.println(realPath);
//        cái này xong là lưu file được rồi.
        part.write(realPath+"/"+account + filename);
        part.write(realPath+"/"+account + filename);*/
//        chừ lưu filename vào database nữa là ok
        userService.updateImageUserId(idUser, imageLink);
        goGetInfo(request,response);
    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String account = request.getParameter("nameAccount");
        System.out.println(account);
        String password = request.getParameter("password");
        System.out.println(password);
        String ps1 = request.getParameter("newPassword");
        ps1 = passwordEncryption.encrypt(ps1);
        String ps2 = request.getParameter("confirmPassword");
        ps2 = passwordEncryption.encrypt(ps2);

        Account acc = accountService.CheckLogIn(account,password);
        System.out.println(acc.getUsername());
        if(acc.getUsername()!=null) {
            accountService.editPassword(account, ps1);
            System.out.println("da doi mat khau");
            goGetInfo(request,response);
        } else {
            System.out.println("Chua doi mat khau");
            request.setAttribute("checkPassword", 0);
            goGetInfo(request,response);
        }
    }


    private void createNewAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            response.setContentType("text/html;charset=UTF8");
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            String nameAccount = request.getParameter("nameAccount");
//            List<Account> accountList = accountService.CheckAccount(nameAccount);
//            request.setAttribute("accountList", accountList);
            String name = request.getParameter("name");
            if(name!=null && name != ""){
                name = handleString.handleFont(name);
                name = handleString.handleName(name);
            }
            String ps1 = request.getParameter("passw");
            String ps2 = request.getParameter("con_passw");
            ps1 = passwordEncryption.encrypt(ps1);
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            address = handleString.handleFont(address);
            String phone = request.getParameter("phone");
            boolean isExist = isExistAccount(nameAccount);
            if (isExist) {
                request.setAttribute("isExist", true);
                System.out.println("Trùng tên account!!");
                goLogin(request,response);
                return;
                //
                    //                accountList = null;
            } else {

                User user = new User(name, email,phone,address,"img",nameAccount);
                Account account1 = new Account(nameAccount, ps1, 2);
                accountService.AddAccount(account1);
                userService.addUserList(user);
                request.setAttribute("isExist", false);
                goLogin(request,response);
            }
    }
    public boolean isExistAccount(String username){
        int isExist = accountService.CheckAccount2(username);
        if(isExist > 0){
            return true;
        }
        return false;
    }
}
