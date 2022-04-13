<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/04/2022
  Time: 2:50 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result test</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="bootstrap-5.1.3/css/bootstrap.css">
    <script src="https://kit.fontawesome.com/1ab7d1b3e8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<body>
<div class="container px-4">
    <div class="row gx-5">
        <div class="col">
            <div class="p-3 border">
                <h2>
                    Kết quả bài thi trắc nghiệm
                </h2>
                <h4>
                    Tên bài trắc nghiệm
                </h4>
                <h4>
                    Đề số: ...
                </h4>
            </div>
        </div>
        <div class="col">
            <div class="p-3 border">
                <h2>
                    Kết quả: 3/10
                </h2>
                <h3>
                    Thời gian
                </h3>
            </div>
        </div>
    </div>
</div>
<div class="jumbotron my-4">
    <form class="form" autocomplete="off">
        <h1 style="text-align: center;">Name Exam</h1>
        Total question: 3
        <div class="form">
            <h3 class="text-info">1/[01] Question </h3>
            <input type="hidden" >
            <div class="form-check mx-4">
                <input class="form-check-input" type="radio" name="{{ forloop.counter }}" id="{{q.option1}}" value="Option1">
                <label class="form-check-label" for="{{q.option1}}">
                    Answer 1
                </label>
            </div>
            <div class="form-check mx-4">
                <input class="form-check-input" type="radio" name="{{ forloop.counter }}" id="{{q.option2}}" value="Option2">
                <label class="form-check-label" for="{{q.option2}}">
                    Answer 2
                </label>
            </div>
            <div class="form-check mx-4">
                <input class="form-check-input" type="radio" name="{{ forloop.counter }}" id="{{q.option3}}" value="Option3">
                <label class="form-check-label" for="{{q.option3}}">
                    Answer 3
                </label>
            </div>
            <div class="form-check mx-4">
                <input class="form-check-input" type="radio" name="{{ forloop.counter }}" id="{{q.option4}}" value="Option4">
                <label class="form-check-label" for="{{q.option4}}">
                    Answer 4
                </label>
            </div>
        </div>
        <div class="form">
            <h3 class="text-info">2/[02] Question </h3>
            <input type="hidden" >
            <div class="form-check mx-4">
                <input class="form-check-input" type="radio" name="a1" id="a1" value="Option1">
                <label class="form-check-label" for="a1">
                    Answer 1
                </label>
            </div>
            <div class="form-check mx-4">
                <input class="form-check-input" type="radio" name="a1" id="a2" value="Option2">
                <label class="form-check-label" for="a2">
                    Answer 2
                </label>
            </div>
            <div class="form-check mx-4">
                <input class="form-check-input" type="radio" name="a1" id="a3" value="Option3">
                <label class="form-check-label" for="a3">
                    Answer 3
                </label>
            </div>
            <div class="form-check mx-4">
                <input class="form-check-input" type="radio" name="a1" id="a4" value="Option4">
                <label class="form-check-label" for="a4">
                    Answer 4
                </label>
            </div>
        </div>
        <input class="btn btn-info btn-lg"   type="submit" value="Các Bài Khác">
    </form>
</div>

</body>
</html>
