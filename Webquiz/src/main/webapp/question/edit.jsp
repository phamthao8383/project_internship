<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Question</title>
</head>
<body>
<h2>Edit Question</h2>
<form action="/questions" method="post">
    <input type="hidden" name="action" value="edit"/>
    <input type="hidden" name="question_id" value="${question.question_id}"/><br>
    <label>Description</label><br>
    <input type="text" name="description" value="${question.description}"/><br>
    <label>Answer1</label><br>
    <input type="text" name="answer1" value="${question.answer1}"/><br>
    <label>Answer2</label><br>
    <input type="text" name="answer2" value="${question.answer2}"/><br>
    <label>Answer3</label><br>
    <input type="text" name="answer3" value="${question.answer3}"/><br>
    <label>Answer4</label><br>
    <input type="text" name="answer4" value="${question.answer4}"/><br>
    <label>Correct Answer</label><br>
    <input type="text" name="correct_answer" value="${question.correct_answer}"/><br>
    <label>Subject Name</label><br>
    <select name="subject_id">
        <c:forEach var="subject" items="${listSubject}">
            <c:choose>
                <c:when test="${subject.subject_id == question.getSubject().getSubject_id()}">
                    <option value="${subject.subject_id}" selected> ${subject.subject_name}</option>
                </c:when>
                <c:otherwise>
                    <option value="${subject.subject_id}">${subject.subject_name}</option>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </select>
    <input type="submit" value="Save" style="color:white;background: green"/>
    <input type="reset" value="Back" style="color:white;background: black"/>

</form>
</body>
</html>
