<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/13/2022
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header id="header">
    <div class="header__logo">
        <img width="90px" src="/icon/logoWeb.png">
    </div>
    <div class="header__admin">
        <a href="#" class="header__adminlink dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="${sessionScope.user.image}" class="header__imgadmin" data-bs-toggle="dropdown" aria-expanded="false">
            <p class="header__nameadmin">${sessionScope.user.name}</p>
        </a>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <li><a class="dropdown-item" href="/userServlet">Về trang chủ</a></li>
            <li><a class="dropdown-item" href="/userServlet?action=logout">Đăng xuất</a></li>
        </ul>
    </div>
</header>
