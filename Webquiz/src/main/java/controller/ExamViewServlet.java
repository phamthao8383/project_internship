package controller;

import service.ExamViewService;
import service.impl.ExamViewServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ExamViewServlet", urlPatterns = "/exam_list")
public class ExamViewServlet extends HttpServlet {
    ExamViewService examViewService = new ExamViewServiceImpl();
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
            case "examSummit" :
                examSummit(request,response);
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
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int id_sj = Integer.parseInt(request.getParameter("sj_id"));
        request.setAttribute("listExam", examViewService.examList(id_sj));
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/DanhSachDe.jsp");
        dispatcher.forward(request,response);
    }

    private void loadExamQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int examId = Integer.parseInt(request.getParameter("examId"));
        request.setAttribute("listQuestion", examViewService.loadExamQuestion(examId));
        request.setAttribute("exam",examViewService.getExamId(examId) );
        request.setAttribute("examId",examId);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/exam-question.jsp");
        dispatcher.forward(request,response);
    }

    private void goExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int examId = Integer.parseInt(request.getParameter("examId"));
        request.setAttribute("listQuestion", examViewService.loadExamQuestion(examId));
        request.setAttribute("exam",examViewService.getExamId(examId) );
        request.setAttribute("examId",examId );
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/start_exam.jsp");
        dispatcher.forward(request,response);
    }

    private void examSummit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int userId = Integer.parseInt(request.getParameter("userId"));
        int examId = Integer.parseInt(request.getParameter("examId"));

        int diem = 0;
        int i = 1;
        while (request.getParameter("answerQuestion"+i) != null) {
            String answer = request.getParameter("answerQuestion"+i);
            String question = request.getParameter("question"+i);
            if(answer.equals((question))) {
                diem = diem +10;
            }

            System.out.println("Câu " + i + ":");
            System.out.println("Đáp án lựa chọn: " + question);
            System.out.println("Đáp án đúng: " + answer);
            System.out.println("Điểm hiện tại: " + diem);
            System.out.println("--------------------------");
            i++;
        }
        System.out.println("Tổng điểm: " + diem);
        examViewService.addHistoryExam(examId,userId,diem);
        examViewService.updateAccumulatePoint(userId);
        request.setAttribute("point",diem );
        request.setAttribute("listQuestion", examViewService.loadExamQuestion(examId));
        request.setAttribute("exam", examViewService.getExamId(examId));
        request.setAttribute("tong",(i-1) *10 );
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/exam_result.jsp");
        dispatcher.forward(request,response);
    }
}
