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
<h2>Add new Subject </h2>
<form action="/subjects" method="post">
    <input type="hidden" name="action" value="create"/>
    <input type="hidden" name="subject_id"/><br>
    <label>Subject Name</label><br>
    <input type="text" name="subject_name"/><br>
    <br>
    <input type="submit" value="Create" style="color:white;background: green"/>
    <input type="reset" value="Back" style="color:white;background: black"/>

</form>

</body>
</html>
