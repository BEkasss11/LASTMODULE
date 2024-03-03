
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="/vendor/header.jsp"%>
</head>
<body>
<%@include file="/vendor/head.jsp"%>
<div class="body">
    <form action="/register" method="post">
        <%
            if(request.getParameter("existEmail") != null){
        %>
        <div class="alert alert-danger" role="alert">
            This Email already exist! Try another one!
        </div>
        <%
        }
        else  if(request.getParameter("fullnameFail") != null){
        %>
        <div class="alert alert-danger" role="alert">
            Incorrect fullName
        </div>
        <%
        } else  if(request.getParameter("passwordFail") != null){
        %>
        <div class="alert alert-danger" role="alert">
            This is password  doesn't exist!
        </div>
        <%
            }
        %>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label" >Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" required>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="password" required>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword2" class="form-label">Repeat Password</label>
            <input type="password" class="form-control" id="exampleInputPassword2" name="repPassword" required>
        </div>
        <div class="mb-3">
            <label for="exampleInputName" class="form-label">FullName</label>
            <input type="text" class="form-control" id="exampleInputName" name="fullName" required>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>
</body>
<style>
    .body{
        padding: 0 20%;
        font-family: sans-serif;
    }
</style>
</html>
