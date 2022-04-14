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
<a href="/subjects?action=create">Add New Subject</a>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List Subject</h2></caption>
        <tr>
            <th>ID</th>
            <th>Subject Name</th>
        </tr>
        <c:forEach var="subject" items="${listSubject}">
            <tr>
                <td><c:out value="${subject.subject_id}"/></td>
                <td><c:out value="${subject.subject_name}"/></td>
                <td>
                    <a href="/subjects?action=edit&id=${subject.subject_id}">Edit</a>
                    <a href="/subjects?action=delete&id=${subject.subject_id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>