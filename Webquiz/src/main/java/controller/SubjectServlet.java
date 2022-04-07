package controller;

import model.Subject;
import service.SubjectService;
import service.impl.SubjectServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SubjectServlet", value = "/SubjectServlet")
public class SubjectServlet extends HttpServlet {
    private SubjectService subjectService=new SubjectServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                subjectList(request, response);
                break;
        }

    }

    private void subjectList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("listSubject", listSubject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
