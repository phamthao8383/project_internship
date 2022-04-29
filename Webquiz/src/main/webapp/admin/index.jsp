
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${sessionScope.account.idRole != 1}">
    <%--    ${pageContext.request.contextPath} --%>
    <jsp:include page="/view/error403.jsp"/>
</c:if>
<c:if test="${sessionScope.account.idRole == 1}">
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/admin/view/head.jsp"/>
    <title>Câu đố thông minh</title>
</head>
<body>

    <jsp:include page="/admin/view/header.jsp"/>
    <div class="main" >
        <div class="container-fluid">
            <div class="row">
                    <jsp:include page="/admin/view/left_navbar.jsp"/>
            </div>
        </div>
    </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</html>
</c:if>