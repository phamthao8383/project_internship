package controller;

import model.ExamQuestion;
import model.Question;
import model.Subject;
import service.ExamViewService;
import service.SubjectService;
import service.impl.ExamViewServiceImpl;
import service.impl.SubjectServiceImpl;
import util.HandleString;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.*;

@WebServlet(name = "ExamViewServlet", urlPatterns = "/exam_list")
public class ExamViewServlet extends HttpServlet {
    ExamViewService examViewService = new ExamViewServiceImpl();
    private SubjectService subjectService = new SubjectServiceImpl();
    private HandleString handleString = new HandleString();
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
            case "goExamNew" :
                goExamNew(request, response);
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
            case "sa":
                searchExamList(request,response);
                break;
            default:
                examList(request, response);
                break;
        }
    }

    private void searchExamList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String str = request.getParameter("search");
        request.setAttribute("listExam", examViewService.examListSearch(str));
        request.setAttribute("list5Exam", examViewService.examListTop5());
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("listSubject", listSubject);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/DanhSachDe.jsp");
        dispatcher.forward(request,response);
    }

    private void examList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int id_sj = Integer.parseInt(request.getParameter("sj_id"));
        request.setAttribute("listExam", examViewService.examList(id_sj));
        for (ExamQuestion e:   examViewService.examList(id_sj)
             ) {
            System.out.println(e);
        }
        request.setAttribute("list5Exam", examViewService.examListTop5());
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("listSubject", listSubject);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/DanhSachDe.jsp");
        dispatcher.forward(request,response);
    }

    private void loadExamQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int examId = Integer.parseInt(request.getParameter("examId"));
        request.setAttribute("listQuestion", examViewService.loadExamQuestion(examId));
        request.setAttribute("exam",examViewService.getExamQuestionId(examId));
        request.setAttribute("examId",examId);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/exam-question.jsp");
        dispatcher.forward(request,response);
    }

    private void goExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String examIds = request.getParameter("examId");
        String userId = request.getParameter("userId");
        if (userId == "") {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/user/DangNhapDangKi.jsp");
            dispatcher.forward(request,response);
        } else {
            HttpSession session = request.getSession();
            if (session.getAttribute("timeStartS") == null) {
                int examId = Integer.parseInt(examIds);
                List<Question> questionList = examViewService.loadExamQuestion(examId);
                 Collections.shuffle(questionList);
                session.setAttribute("listQuestion",questionList);
                session.setAttribute("exam",examViewService.getExamId(examId));
                session.setAttribute("examQuestion",examViewService.getExamQuestionId(examId));
                session.setAttribute("examId",examId );
                Date date = new Date(System.currentTimeMillis());
                Time sqlTime = new Time(System.currentTimeMillis());
                String timeStart = String.valueOf(date) +" " + String.valueOf(sqlTime);
                session.setAttribute("timeStartS", timeStart);
                request.setAttribute("timeStart",timeStart );
            }
//                  Thiết lập giá trị trong session
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/start_exam.jsp");
            dispatcher.forward(request,response);
        }

    }
    private void goExamNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
//            Hủy session
        session.removeAttribute("timeStartS");
        session.removeAttribute("listQuestion");
        session.removeAttribute("exam");
        session.removeAttribute("examQuestion");
        session.removeAttribute("examId");

        String examIds = request.getParameter("examId");
        String userId = request.getParameter("userId");

        int examId = Integer.parseInt(examIds);
        List<Question> questionList = examViewService.loadExamQuestion(examId);
        Collections.shuffle(questionList);
        session.setAttribute("listQuestion",questionList);
        session.setAttribute("exam",examViewService.getExamId(examId));
        session.setAttribute("examQuestion",examViewService.getExamQuestionId(examId));
        session.setAttribute("examId",examId );
        Date date = new Date(System.currentTimeMillis());
        Time sqlTime = new Time(System.currentTimeMillis());
        String timeStart = String.valueOf(date) +" " + String.valueOf(sqlTime);
        session.setAttribute("timeStartS", timeStart);
        request.setAttribute("timeStart",timeStart );
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/start_exam.jsp");
        dispatcher.forward(request,response);


    }
    private void examSummit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
//            Hủy session
        List<Question> questionList = (List<Question>) session.getAttribute("listQuestion");
        session.removeAttribute("timeStartS");
        session.removeAttribute("listQuestion");
        session.removeAttribute("exam");
        session.removeAttribute("examQuestion");
        session.removeAttribute("examId");

        int userId = Integer.parseInt(request.getParameter("userId"));
        int examId = Integer.parseInt(request.getParameter("examId"));
        String timeStart = request.getParameter("timeStart");
        Date date = new Date(System.currentTimeMillis());
        Time sqlTime = new Time(System.currentTimeMillis());
        String timeEnd = String.valueOf(date) +" " + String.valueOf(sqlTime);

        int diem = 0;
        int i = 1;
        List questionMyCheck = new ArrayList();
//        List<Question> questionList = new ArrayList<>();
        while (request.getParameter("question"+i) != null) {
            String answer = request.getParameter("answerQuestion"+i);
            answer = handleString.handleFont(answer);
            String question = request.getParameter("question"+i);
            question = handleString.handleFont(question);
            if(answer.equals((question))) {
                diem = diem +1;
            }
            questionMyCheck.add(question);

            i++;
        }
        System.out.println("Tổng điểm: " + diem);
        examViewService.addHistoryExam(examId,userId,diem * 10, timeStart,timeEnd);
        examViewService.updateAccumulatePoint(userId);
//        questionMyCheck.forEach(n -> System.out.println(n));
        request.setAttribute("questionMyCheck",questionMyCheck );
        request.setAttribute("point",diem );
        request.setAttribute("listQuestion", questionList);
        request.setAttribute("timeStart", timeStart);
        request.setAttribute("timeEnd", timeEnd);
        request.setAttribute("examQuestion",examViewService.getExamQuestionId(examId));
        request.setAttribute("exam", examViewService.getExamId(examId));
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam/exam_result.jsp");
        dispatcher.forward(request,response);
    }
}
