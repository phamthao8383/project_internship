package controller;

import model.Question;
import model.Subject;
import service.QuestionService;
import service.SubjectService;
import service.impl.QuestionServiceImpl;
import service.impl.SubjectServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuiestionServlet", urlPatterns = "/questions")
public class QuiestionServlet extends HttpServlet {
    private QuestionService questionService=new QuestionServiceImpl();
    private SubjectService subjectService=new SubjectServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
              //  showFormCreate(request, response);
                response.sendRedirect("create.jsp");
                break;
            }
            case "edit": {
              //  editQuestion(request, response);
                break;
            }
            case "delete": {
               // deleteQuestion(request, response);
            }
            case "search": {
             //   searchQuestion(request, response);
            }
            default:
                questionList(request, response);
                break;
        }

    }

    private void questionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Question> listQuestion = questionService.selectAllQuestion();
        request.setAttribute("listQuestion", listQuestion);
        List<Subject> listSubject=subjectService.selectAllSubject();
        request.setAttribute("listSubject",listSubject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("question/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
