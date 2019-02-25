<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입</title>
</head>
<body>
회원가입 페이지
<form class="signup-form" action="/member" method="POST">
  <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}" />
  <div class="row">
    <div class="input-field col s12">
      <input id="user_name" name="uid" type="text" class="validate"/>
      <label for="user_name">Username</label>
    </div>
  </div>
  <div class="row">
    <div class="input-field col s12">
      <input id="email" name="uemail" type="email" class="validate"/>
      <label for="email">Email</label>
    </div>
  </div>
  <div class="row">
    <div class="input-field col s12">
      <input id="password" name="upw" type="password" class="validate"/>
      <label for="password">Password</label>
    </div>
  </div>
  <input class="signup-btn waves-effect waves-light btn" type="submit" value="가입하기" />
</form>
</body>
</html>

