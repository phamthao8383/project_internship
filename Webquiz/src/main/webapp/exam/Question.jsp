<!DOCTYPE html>
<html lang="en">
<head>
  <title>Doingggg</title>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<div class="jumbotron my-4">
  <form class="form" autocomplete="off">
    EXAM
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
    <input class="btn btn-info btn-lg"   type="submit" value="Submit">
  </form>
</div>

<br><br><br><br><br><br>
</html>