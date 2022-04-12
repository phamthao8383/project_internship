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

@WebServlet(name = "QuestionServlet", urlPatterns = "/questions")
public class QuestionServlet extends HttpServlet {
    private QuestionService questionService = new QuestionServiceImpl();
    private SubjectService subjectService = new SubjectServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                showFormCreate(request, response);
                response.sendRedirect("question/create.jsp");
                break;
            }
            case "edit": {
                editQuestion(request, response);
                break;
            }
            case "delete": {
                deleteQuestion(request, response);
                break;
            }
            case "search": {
                //   searchQuestion(request, response);
            }
            default:
                questionList(request, response);
                break;
        }

    }

//    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int question_id=Integer.parseInt(request.getParameter("question_id"));
//        Question question=questionService.selectQuestion(question_id);
//          request.setAttribute("listQuestion",question);
//         response.sendRedirect("question/delete.jsp");
//
//    }


    private void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int question_id = Integer.parseInt(request.getParameter("id"));
        questionService.deleteQuestion(question_id);
        questionList(request, response);

    }

    private void editQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int question_id = Integer.parseInt(request.getParameter("id"));
        Question question = questionService.selectQuestion(question_id);
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("question", question);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("question/edit.jsp").forward(request, response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> subjects = subjectService.selectAllSubject();
        request.setAttribute("listSubject", subjects);
        request.getRequestDispatcher("question/create.jsp").forward(request, response);
    }

    private void questionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Question> listQuestion = questionService.selectAllQuestion();
        request.setAttribute("listQuestion", listQuestion);
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("listSubject", listSubject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/question-bank.jsp");
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
                createQuestion(request, response);
                break;
            }
            case "edit": {
                updateQuestion(request, response);
                break;
            }
            case "delete": {
                //  deleteQuestion(request, response);
                break;
            }
        }

    }

    private void updateQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int question_id = Integer.parseInt(request.getParameter("question_id"));
        String description = request.getParameter("description");
        String answer1 = request.getParameter("answer1");
        String answer2 = request.getParameter("answer2");
        String answer3 = request.getParameter("answer3");
        String answer4 = request.getParameter("answer4");
        String correct_answer = request.getParameter("correct_answer");
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
//        String subject_name = request.getParameter("subject_name");

        Question question = new Question(question_id, description, answer1, answer2, answer3, answer4, correct_answer, new Subject(subject_id));
        questionService.updateQuestion(question);
        questionList(request, response);
    }

    private void createQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //  int question_id= Integer.parseInt(request.getParameter("question_id"));
        String description = request.getParameter("description");
        String answer1 = request.getParameter("answer1");
        String answer2 = request.getParameter("answer2");
        String answer3 = request.getParameter("answer3");
        String answer4 = request.getParameter("answer4");
        String correct_answer = request.getParameter("correct_answer");
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
        Question question = new Question(description, answer1, answer2, answer3, answer4, correct_answer, new Subject(subject_id));
        questionService.insertQuestion(question);
        response.sendRedirect("/questions");

    }
}
