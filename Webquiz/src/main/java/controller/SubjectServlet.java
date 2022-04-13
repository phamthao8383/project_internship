package controller;

import model.Subject;
import service.SubjectService;
import service.impl.SubjectServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SubjectServlet", urlPatterns = "/subjects")
public class SubjectServlet extends HttpServlet {
    private SubjectService subjectService = new SubjectServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                response.sendRedirect("subject/create.jsp");
                break;
            }
            case "edit": {
                editSubject(request, response);
                break;
            }
            case "delete": {
                  deleteSubject(request,response);
                break;
            }
            case "search": {
                //   searchSubject(request, response);
            }
            default:
                subjectList(request, response);
                break;
        }

    }

    private void deleteSubject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int subject_id = Integer.parseInt(request.getParameter("id"));
        subjectService.deleteSubject(subject_id);
        subjectList(request,response);
    }

    private void editSubject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int subject_id = Integer.parseInt(request.getParameter("id"));
        Subject subject = subjectService.selectByIdSubject(subject_id);
        request.setAttribute("subject", subject);
        request.getRequestDispatcher("subject/edit.jsp").forward(request, response);
    }

    private void subjectList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("listSubject", listSubject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("subject/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createSubject(request, response);
                break;
            }
            case "edit": {
                updateSubject(request, response);
                break;
            }
            case "delete": {
                //  deleteQuestion(request, response);
                break;
            }
        }
    }

    private void updateSubject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
        String subject_name = request.getParameter("subject_name");
        Subject subject = new Subject(subject_id,subject_name);
        subjectService.updateSubject(subject);
        subjectList(request, response);
    }

    private void createSubject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String subject_name = request.getParameter("subject_name");
        Subject subject = new Subject(subject_name);
        subjectService.insertSubject(subject);
        response.sendRedirect("/subjects");
    }
}
