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

@WebServlet(name = "HomeServlet", urlPatterns = {""})
public class HomeServlet extends HttpServlet {
    MemberService memberService = new MemberServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getStatistic(request, response);
    }

    public void getMaxPoint(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        List<Member> memberList = memberService.getMaxPoint();
        request.setAttribute("memberList", memberList);
    }

    public void getMemberNumber(HttpServletRequest request, HttpServletResponse response)
            throws  ServletException, IOException{
        List<Member> memberList2 = memberService.getMemberNumber();
        request.setAttribute("memberList2", memberList2);
    }

    public void getNewMember(HttpServletRequest request, HttpServletResponse response)
            throws  ServletException, IOException{
        List<Member> memberList3 = memberService.getMemberNumber();
        Member newMember = memberList3.get(memberList3.size()-1);
        request.setAttribute("newMember", newMember);
    }

    public void getStatistic (HttpServletRequest request, HttpServletResponse response)
            throws  ServletException, IOException{
        getMaxPoint(request, response);
        getMemberNumber(request, response);
        getNewMember(request, response);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
