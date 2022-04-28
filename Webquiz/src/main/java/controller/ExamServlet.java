package controller;

import model.Exam;
import model.Member;
import model.Question;
import model.Subject;
import repository.BaseRepository;
import service.ExamService;
import service.QuestionService;
import service.SubjectService;
import service.impl.ExamServiceImpl;
import service.impl.QuestionServiceImpl;
import service.impl.SubjectServiceImpl;
import util.HandleString;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ExamServlet", urlPatterns = "/admin/exams")
public class ExamServlet extends HttpServlet {
    private ExamService examService = new ExamServiceImpl();
    private SubjectService subjectService = new SubjectServiceImpl();
    private HandleString handleString = new HandleString();
    private final int entryDisplay = BaseRepository.entryDisplay;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                showFormCreate(request, response);
//                response.sendRedirect("admin/");
                break;
            }
            case "edit": {
                editExam(request, response);
                break;
            }
//            case "delete": {
//                deleteExam(request, response);
//                break;
//            }
            case "search": {
                //   searchQuestion(request, response);
            }
            default:
                examList(request, response);
                break;
        }

    }
    private void deleteExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int exam_id = Integer.parseInt(request.getParameter("idExa"));
        System.out.println(exam_id);
        examService.deleteExam(exam_id);
        examList(request, response);

    }
    private void editExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int exam_id = Integer.parseInt(request.getParameter("id"));
        Exam exam = examService.selectExam(exam_id);
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("exam", exam);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("/admin/exam-list.jsp").forward(request, response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> subjects = subjectService.selectAllSubject();
        request.setAttribute("listSubject", subjects);
        request.getRequestDispatcher("/admin/exam-list.jsp").forward(request, response);
    }

    private void examList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String index = request.getParameter("index");
        if(index == null){
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        int indexExamStart = ((indexPage - 1)*entryDisplay + 1);

        List<Exam> listExam = examService.paginateExam(indexPage);
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("listExam", listExam);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("currentPage", indexPage);
        request.setAttribute("indexExamStart", indexExamStart);
        request.setAttribute("entryDisplay", entryDisplay);
        pagingExam(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/exam-list.jsp");
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
                createExam(request, response);
                break;
            }
            case "edit": {
                updateExam(request, response);
                break;
            }
            case "delete": {
                  deleteExam(request, response);
                break;
            }
        }

    }
    private void updateExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int exam_id = Integer.parseInt(request.getParameter("exam_id"));
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
        String allowed_time = request.getParameter("allowed_time");
        String exam_name = handleString.handleFont(request.getParameter("exam_name"));
//        String subject_name = request.getParameter("subject_name");
        Exam exam = new Exam(exam_id, new Subject(subject_id), allowed_time, exam_name );
        examService.updateExam(exam);
        examList(request, response);
    }

    private void createExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //  int exam_id= Integer.parseInt(request.getParameter("exam_id"));
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
        System.out.println(subject_id);
        String allowed_time = request.getParameter("allowed_time");
        String exam_name = handleString.handleFont(request.getParameter("exam_name"));
        System.out.println(exam_name);
        Exam exam = new Exam(1,new Subject(subject_id),allowed_time, exam_name);
        System.out.println(exam);
        examService.insertExam(exam);
        response.sendRedirect("/admin/exams");

    }

    private void pagingExam(HttpServletRequest request) throws ServletException, IOException{
        int totalExam = examService.getTotalExam();
        int maxPages = totalExam/entryDisplay;
        if (totalExam%entryDisplay != 0){
            maxPages++;
        }
        request.setAttribute("totalExam", totalExam);
        request.setAttribute("maxPages", maxPages);
    }
}
