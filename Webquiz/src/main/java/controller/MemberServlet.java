package controller;

import model.Member;
import org.omg.PortableInterceptor.INACTIVE;
import repository.BaseRepository;
import repository.MemberRepository;
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
    private final int entryDisplay = BaseRepository.entryDisplay;

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
            case "search":
                searchMemberList(request, response);
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
        response.setContentType("text/html;charset=UTF8");
        String index = request.getParameter("index");
        if (index == null){
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        int indexMember = ((indexPage - 1)*entryDisplay + 1);
        // Tạo bảng
        List<Member> memberList = memberService.getMemberList(indexPage);
        request.setAttribute("memberList", memberList);
        pagingNumber(request, response);                          // Dãy số phân trang dưới bảng
        request.setAttribute("currentPage", indexPage);     // Index của trang(bảng) đang hiển thị thông tin
        request.setAttribute("indexMember", indexMember);   // Index vị trí của thành viên đầu tiên trong bảng
        request.setAttribute("entryDisplay", entryDisplay); // Số thành viên được hiển thị trên mỗi trang(bảng)
        request.getRequestDispatcher("/admin/manage-user.jsp").forward(request, response);
    }

    private void searchMemberList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF8");
        String index = request.getParameter("index");
        if (index == null){
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        int indexMember = ((indexPage - 1)*entryDisplay + 1);
        String nameSearch = handleString.handleFont(request.getParameter("nameSearch"));
        // Tạo bảng
        List<Member> memberList = memberService.searchMemberList(indexPage, nameSearch);
        request.setAttribute("memberList", memberList);
        pagingNumber(request, response);                          // Dãy số phân trang dưới bảng
        request.setAttribute("currentPage", indexPage);     // Index của trang(bảng) đang hiển thị thông tin
        request.setAttribute("indexMember", indexMember);   // Index vị trí của thành viên đầu tiên trong bảng
        request.setAttribute("entryDisplay", entryDisplay); // Số thành viên được hiển thị trên mỗi trang(bảng)
        request.getRequestDispatcher("/admin/manage-user.jsp").forward(request, response);
    }

    private void updateMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int memberIDSearch = Integer.parseInt(request.getParameter("idUpdate"));
        String memberUsernameSearch = request.getParameter("usernameUpdate");
        Member memberSearch = new Member(memberIDSearch, memberUsernameSearch);

        String name = handleString.handleName(handleString.handleFont(request.getParameter("name")));
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = handleString.handleFont(request.getParameter("address"));
        int role = Integer.parseInt(request.getParameter("role"));
        Member memberUpdate = new Member(name, email, phone, address, role);
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

    private void pagingNumber(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int totalMember = memberService.getTotalMember();
        int maxPages = (totalMember/entryDisplay);
        if (totalMember % entryDisplay != 0){
            maxPages++;
        }
        request.setAttribute("totalMember", totalMember);
        request.setAttribute("maxPages", maxPages);
    }

}
