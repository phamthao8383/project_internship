package controller;

import model.Member;
import service.MemberService;
import service.impl.MemberServiceImpl;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "":
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
            case "view":
                getMemberList(request, response);
                break;
            default:
        }
    }

    private void getMemberList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Member> memberList = memberService.getMemberList();
        request.setAttribute("memberList", memberList);
        request.getRequestDispatcher("/admin/manage-user.jsp").forward(request, response);
    }

    private void updateMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }
//
//    private void getMemberList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        List<Member> memberList = memberService.getMemberList();
//        System.out.println("ok");
//        request.setAttribute("memberList", memberList);
//        request.getRequestDispatcher("/admin/manage-user.jsp").forward(request, response);
//    }

}
