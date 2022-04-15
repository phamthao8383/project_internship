package controller;

import model.Exam;
import model.Question;
import service.ExamService;
import service.impl.ExamServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ExamServlet", urlPatterns = "/exam_list")
public class ExamServlet extends HttpServlet {
    ExamService examService = new ExamServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "examLoadQuestions" :
                loadExamQuestion(request, response);
                break;
            case "goExam" :
                goExam(request, response);
                break;
            default:
                examList(request, response);
                break;
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                examList(request, response);
                break;
        }
    }

    private void examList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_sj = Integer.parseInt(request.getParameter("sj_id"));
        request.setAttribute("listExam", examService.examList(id_sj));
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/DanhSachDe.jsp");
        dispatcher.forward(request,response);
    }

    private void loadExamQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int examId = Integer.parseInt(request.getParameter("examId"));
        request.setAttribute("listQuestion", examService.loadExamQuestion(examId));
        request.setAttribute("examId",examId );
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/exam-question.jsp");
        dispatcher.forward(request,response);
    }

    private void goExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int examId = Integer.parseInt(request.getParameter("examId"));
        request.setAttribute("listQuestion", examService.loadExamQuestion(examId));
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/start_exam.jsp");
        dispatcher.forward(request,response);
    }
}
