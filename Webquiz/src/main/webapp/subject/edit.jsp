<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Question</title>
</head>
<body>
<h2>Edit Question</h2>
<form action="/subjects" method="post">
    <input type="hidden" name="action" value="edit"/>
    <input type="hidden" name="subject_id" value="${subject.subject_id}"/><br>
    <label>Subject Name</label><br>
    <input type="text" name="subject_name" value="${subject.subject_name}"/><br>

    <input type="submit" value="Save" style="color:white;background: green"/>
    <input type="reset" value="Back" style="color:white;background: black"/>

</form>
</body>
</html>
