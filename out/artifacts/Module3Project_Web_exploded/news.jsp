<%@ page import="java.util.List" %>
<%@ page import="classes.News" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/header.jsp"%>
<body>
<%@include file="/vendor/head.jsp"%>
</body>
<div class="body">
    <div class="row">

        <%List<News> news = (List<News>) request.getAttribute("news");
        if(news != null){
            for(News n: news){
        %>
            <div class="col mt-2">
                <div class="card" style="width: 440px">
                    <div class="card-body">
                        <h5 class="card-title" ><%=n.getCategory().getName()%></h5>
                        <p class="text-secondary"><%=n.getTitle()%></p>
                        <p class="card-text"><%=n.getContent()%></p>
                        <p class="text-secondary"><%=n.getPost_date()%></p>
                    <a href="/detailsNews?id=<%=n.getId()%>"class="btn btn-primary">Read More</a>

                    </div>
                </div>
            </div>
        <%
            }
        }
        %>
        </div>
    </div>
        </body>
<style>
    .body{
        padding: 0 20%;
        font-family: sans-serif;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
