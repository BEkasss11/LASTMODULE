
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="/vendor/header.jsp"%>
</head>
<body>
   <%@include file="/vendor/head.jsp"%>
   <div class="body">
   <form action="/login" method="post">
       <%
           if(request.getParameter("ErrorPassword") != null){
       %>
       <div class="alert alert-danger" role="alert">
           Incorrect password
       </div>
       <%
           }
           else  if(request.getParameter("ErrorEmail") != null){
       %>
       <div class="alert alert-danger" role="alert">
           Incorrect email
       </div>
       <%
       } else  if(request.getParameter("ERROR") != null){
       %>
       <div class="alert alert-danger" role="alert">
           This is user doesn't exist!
       </div>
       <%
           }
       %>
       <div class="mb-3">
           <label for="exampleInputEmail1" class="form-label">Email address</label>
           <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
       </div>
       <div class="mb-3">
           <label for="exampleInputPassword1" class="form-label">Password</label>
           <input type="password" class="form-control" id="exampleInputPassword1" name="password">
       </div>
       <button type="submit" class="btn btn-primary">Login</button>
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
