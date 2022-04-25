package controller;

import model.Question;
import model.Subject;
import repository.QuestionRepository;
import service.QuestionService;
import service.SubjectService;
import service.impl.QuestionServiceImpl;
import service.impl.SubjectServiceImpl;
import util.HandleString;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuestionServlet", urlPatterns = "/admin/questions")
public class QuestionServlet extends HttpServlet {
    private QuestionService questionService = new QuestionServiceImpl();
    private SubjectService subjectService = new SubjectServiceImpl();
    private HandleString handleString = new HandleString();
    private final int entryDisplay = QuestionRepository.entryDisplay;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                showFormCreate(request, response);
//                response.sendRedirect("admin/question-bank.jsp");
                break;
            }
            case "edit": {
                editQuestion(request, response);
                break;
            }
//            case "delete": {
//                deleteQuestion(request, response);
//                break;
//            }
            case "search": {
                searchQuestion(request, response);
                break;
            }
            case "export":{
                exportExcel(request,response);
                break;
            }
            default:
                questionList(request, response);
                break;
        }

    }

    private void searchQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description=request.getParameter("description");
        List<Question>questions=questionService.findAllByDescription(description);
        request.setAttribute("listQuestion",questions);
        request.getRequestDispatcher("/admin/question-bank.jsp").forward(request,response);
    }

    private void exportExcel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Question> questions = questionService.selectAllQuestion();
        questionService.exportCSV(questions);
        questionList(request, response);
    }

//    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int question_id=Integer.parseInt(request.getParameter("question_id"));
//        Question question=questionService.selectQuestion(question_id);
//          request.setAttribute("listQuestion",question);
//         response.sendRedirect("question/delete.jsp");
//
//    }


    private void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int question_id = Integer.parseInt(request.getParameter("idQues"));
        System.out.println(question_id);
        questionService.deleteQuestion(question_id);
        questionList(request, response);
//        response.sendRedirect("/questions");
    }
    private void editQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int question_id = Integer.parseInt(request.getParameter("id"));
        Question question = questionService.selectQuestion(question_id);
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("question", question);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("admin/question-bank.jsp").forward(request, response);
    }
    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> subjects = subjectService.selectAllSubject();
        request.setAttribute("listSubject", subjects);
        request.getRequestDispatcher("admin/question-bank.jsp").forward(request, response);
    }

    // Danh sach cau hoi + Phan trang
    private void questionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String index = request.getParameter("index");
        if (index == null){
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        int indexQuestionStart = ((indexPage - 1)*entryDisplay + 1);
        request.setAttribute("currentPage", indexPage);
        request.setAttribute("indexQuestionStart", indexQuestionStart);
        request.setAttribute("entryDisplay", entryDisplay);
        List<Question> listQuestion = questionService.paginateQuestion(indexPage);
        request.setAttribute("listQuestion", listQuestion);
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("listSubject", listSubject);
        pagingQuestion(request, response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/question-bank.jsp");
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
                deleteQuestion(request, response);
                break;
            }
        }
    }
    private void updateQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int question_id = Integer.parseInt(request.getParameter("question_id"));
        String description = request.getParameter("description");
        description= handleString.handleFont(description);
        String answer1 = request.getParameter("answer1");
        answer1= handleString.handleFont(answer1);
        String answer2 = request.getParameter("answer2");
        answer2= handleString.handleFont(answer2);
        String answer3 = request.getParameter("answer3");
        answer3= handleString.handleFont(answer3);
        String answer4 = request.getParameter("answer4");
        answer4= handleString.handleFont(answer4);
        String correct_answer = request.getParameter("correct_answer");
        correct_answer= handleString.handleFont(correct_answer);
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
//        String subject_name = request.getParameter("subject_name");

        Question question = new Question(question_id, description, answer1, answer2, answer3, answer4, correct_answer, new Subject(subject_id));
        questionService.updateQuestion(question);
        questionList(request, response);
    }

    private void createQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //  int question_id= Integer.parseInt(request.getParameter("question_id"));
        String description = request.getParameter("description");
        description= handleString.handleFont(description);
        String answer1 = request.getParameter("answer1");
        answer1= handleString.handleFont(answer1);
        String answer2 = request.getParameter("answer2");
        answer2= handleString.handleFont(answer2);
        String answer3 = request.getParameter("answer3");
        answer3= handleString.handleFont(answer3);
        String answer4 = request.getParameter("answer4");
        answer4= handleString.handleFont(answer4);
        String correct_answer = request.getParameter("correct_answer");
        correct_answer= handleString.handleFont(correct_answer);
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
        Question question = new Question(description, answer1, answer2, answer3, answer4, correct_answer, new Subject(subject_id));
        questionService.insertQuestion(question);
//        response.sendRedirect("/questions");
        questionList(request, response);

    }

    private void pagingQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int totalQuestion = questionService.getTotalQuestion();
        System.out.println(totalQuestion);
        int maxPages = (totalQuestion/entryDisplay);
        if (totalQuestion % entryDisplay != 0){
            maxPages++;
        }
        request.setAttribute("totalQuestion", totalQuestion);
        request.setAttribute("maxPages", maxPages);
    }
}
