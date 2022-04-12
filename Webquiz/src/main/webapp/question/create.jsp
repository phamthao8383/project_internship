<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/1/2022
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Add new Question </h2>
<form action="/questions" method="post">
    <input type="hidden" name="action" value="create"/>
    <input type="hidden" name="question_id"/><br>
    <label>Description</label><br>
    <input type="text" name="description"/><br>
    <label>Answer1</label><br>
    <input type="text" name="answer1"/><br>
    <label>Answer2</label><br>
    <input type="text" name="answer2"/><br>
    <label>Answer3</label><br><br>
    <input type="text" name="answer3"/><br>
    <label>Answer4</label><br><br>
    <input type="text" name="answer4"/><br>
    <label>Correct Answer</label><br><br>
    <input type="text" name="correct_answer"/><br>
    <label>Subject</label><br>
    <select name="subject_id">
        <c:forEach var="subject" items="${listSubject}">
            <option value="${subject.getSubject_id()}">${subject.getSubject_name()}</option>
        </c:forEach>
    </select>
    <br>
    <br>
    <br>
    <input type="submit" value="Create" style="color:white;background: green"/>
    <input type="reset" value="Back" style="color:white;background: black"/>

</form>

</body>
</html>
