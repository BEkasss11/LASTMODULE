<%@ page import="classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
</head>
<body>
    <div class="body">
       <% User user = (User) request.getSession().getAttribute("current");%>
        <div class="head">
            <div class="BL">POST PORTAL</div>
                <div class="cat">
                    <a href="/news"><div>News</div></a>
                <%
                    if(user != null && user.getRole().equals("1")){
                %>

                    <a href="/addNews"><div>Add News</div></a>

                <%
                    }else if(user == null) {
                %>
                    <a href="/login"><div>Sign In</div></a>
                    <a href="/register"><div>Register</div></a>
                <%
                    }else  if(user != null){
                %>
                    <a href="/logout"><div>Logout</div></a>
                <%
                    }
                %>

            </div>
        </div>
    </div>
</body>
<style>
    .body{
        padding: 0 20%;
        font-family: sans-serif;
    }
    .head{
        display: flex;
        padding: 15px 0;
        border-bottom: 1px solid #cccccc;
    }
    .BL{
        font-size: 22px;
        font-weight: bolder;
        width: 70%;
    }
    .cat{
        font-size: 15px;
        width:80%;
        display: flex;
        justify-content: space-between;
    }
</style>
</html>
