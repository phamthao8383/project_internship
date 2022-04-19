package controller;

import model.Member;
import org.omg.PortableInterceptor.INACTIVE;
import service.MemberService;
import service.impl.MemberServiceImpl;
import util.HandleString;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MemberServlet", urlPatterns = "/admin/manage-user")
public class MemberServlet extends HttpServlet {
    MemberService memberService = new MemberServiceImpl();
    HandleString handleString = new HandleString();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "delete":
                deleteMember(request, response);
                break;
            case "update":
                updateMember(request, response);
                break;
            default:
                getMemberList(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default:
                getMemberList(request, response);
        }
    }

    private void getMemberList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Member> memberList = memberService.getMemberList();
        request.setAttribute("memberList", memberList);
        request.getRequestDispatcher("/admin/manage-user.jsp").forward(request, response);
    }

    private void updateMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int memberIDSearch = Integer.parseInt(request.getParameter("idUpdate"));
        String memberUsernameSearch = request.getParameter("usernameUpdate");
        Member memberSearch = new Member(memberIDSearch, memberUsernameSearch);

        String name = handleString.handleFont(request.getParameter("name"));
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = handleString.handleFont(request.getParameter("address"));
        double point = Double.parseDouble(request.getParameter("point"));
        int role = Integer.parseInt(request.getParameter("role"));
//        System.out.println(role);
        Member memberUpdate = new Member(name, email, phone, address, point, role);
        memberService.updateMember(memberSearch, memberUpdate);

        response.sendRedirect("/admin/manage-user");
    }

    private void deleteMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        int memberIDDelete = Integer.parseInt(request.getParameter("id"));
        Member member = new Member(memberIDDelete);
        boolean checkDeleted = memberService.deleteMember(member);
        Boolean check = Boolean.valueOf(checkDeleted);
        request.setAttribute("checkDeleted", check);
        response.sendRedirect("/admin/manage-user");
    }

}
