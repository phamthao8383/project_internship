package controller;

import model.Question;
import repository.BaseRepository;
import service.ExamQuestionsService;
import service.impl.ExamQuestionsServiceImpl;
import util.HandleString;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ExamQuestionServlet", urlPatterns = "/admin/examQuestion")
public class ExamQuestionServlet extends HttpServlet {

    private ExamQuestionsService examQuestionsService = new ExamQuestionsServiceImpl();
    private HandleString handleString = new HandleString();
    private final int entryDisplay = BaseRepository.entryDisplay;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addQuestion":
                AddQuestionExam(request,response);
                break;
            case "deleteQuestion":
                DeleteQuestionExam(request,response);
                break;
//            case "pagingExamQuestion":
//                ExamQuestionList(request, response);
//                break;
            default:
                ExamQuestionList(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addQuestion":
                AddQuestionExam(request,response);
                break;
            default:
                ExamQuestionList(request, response);
                break;
        }
    }

    private void AddQuestionExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int examId = Integer.parseInt(request.getParameter("examId"));
        String[] Id_list = request.getParameterValues("question");
        for (String s : Id_list) {
            examQuestionsService.addQuestionExam(examId, Integer.parseInt(s));
        }
        ExamQuestionList(request,response);
    }

    private void DeleteQuestionExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int examId = Integer.parseInt(request.getParameter("examId"));
        String[] Id_list = request.getParameterValues("questionDel");
        for (String s : Id_list) {
            examQuestionsService.DeleteQuestionExam(examId, Integer.parseInt(s));
        }
        ExamQuestionList(request,response);
    }

    private void ExamQuestionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String index = request.getParameter("index");
        if(index == null){
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        int indexExamQuestionStart = ((indexPage - 1)*entryDisplay + 1);
        int examId = Integer.parseInt(request.getParameter("examId"));
        String examName = handleString.handleFont(request.getParameter("examName"));
        String subjectName = handleString.handleFont( request.getParameter("subjectName"));
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));


        List<Question> questionList = examQuestionsService.paginateExamQuestion(examId, indexPage);
        request.setAttribute("listQuestion",examQuestionsService.selectAllQuestionSj(subjectId,examId) );
        request.setAttribute("listExamQuestion",questionList );
        request.setAttribute("examName",examName );
        request.setAttribute("examId",examId );
        request.setAttribute("subjectId",subjectId);
        request.setAttribute("subjectName",subjectName);
        request.setAttribute("currentPage", indexPage);
        request.setAttribute("indexExamQuestionStart", indexExamQuestionStart);
        request.setAttribute("entryDisplay", entryDisplay);
        pagingExamQuestion(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/exam-view.jsp");
        dispatcher.forward(request, response);

    }

    private void pagingExamQuestion(HttpServletRequest request) throws ServletException, IOException{
        int examId = Integer.parseInt(request.getParameter("examId"));
        int totalExamQuestion = examQuestionsService.getTotalExamQuestion(examId);
        int maxPages = totalExamQuestion/entryDisplay;
        if (totalExamQuestion%entryDisplay != 0){
            maxPages++;
        }
        request.setAttribute("totalExamQuestion", totalExamQuestion);
        request.setAttribute("maxPages", maxPages);
    }
}
