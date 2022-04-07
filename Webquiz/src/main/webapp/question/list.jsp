<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<body>
<center>

<%--    <form method="get" action="/questions">--%>
<%--        <input type="hidden" name="action" value="search">--%>
<%--        <input type="text" name="name">--%>
<%--        <button type="submit">Search</button>--%>
<%--    </form>--%>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List Question</h2></caption>
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>answer1</th>
            <th>answer2</th>
            <th>answer3</th>
            <th>answer4</th>
            <th>correct_answer</th>
            <th>Subject Name</th>
        </tr>
        <c:forEach var="question" items="${listQuestion}">
            <tr>
                <td><c:out value="${question.question_id}"/></td>
                <td><c:out value="${question.description}"/></td>
                <td><c:out value="${question.answer1}"/></td>
                <td><c:out value="${question.answer2}"/></td>
                <td><c:out value="${question.answer3}"/></td>
                <td><c:out value="${question.answer4}"/></td>
                <td><c:out value="${question.correct_answer}"/></td>
                <td><c:out value="${question.getSubject().getSubject_name()}"/></td>

            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>