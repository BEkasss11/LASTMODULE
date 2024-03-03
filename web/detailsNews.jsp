<%@ page import="java.util.List" %>
<%@ page import="classes.Category" %>
<%@ page import="classes.News" %>
<%@ page import="classes.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/header.jsp"%>
<body>
<%@include file="/vendor/head.jsp"%>
<div class="body">
    <div class="container">
        <% if(request.getParameter("error") != null){
        %>
        <div class="alert alert-danger">Updated failed</div>
        <%
        }
        %>

    </div>
    <div class="container mt-3">
        <%News news = (News) request.getAttribute("news");
         if(news != null){
           if(user.getRole().equals("1")){

          %>
        <form action="/update" method="post">
            <div class="row mt-3">
                <div class="col-9">
                    <input type="hidden" value="<%=news.getId()%>" name="id">
                    <label class="form-label">Title</label>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-9">
                    <input type="text" class="form-control" name="title" required value="<%=news.getTitle()%>">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-9">
                    <label class="form-label">Content</label>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-9">
                    <textarea name="content" class="form-control" style="height: 250px" aria-required="true" ><%=news.getContent()%></textarea>
                </div>
            </div>

                 <div style="">
                    <label class="form-label">Category</label>
                    <select name="cat" class="form-select">
                        <%List<Category> categories = (List<Category>) request.getSession().getAttribute("cat");
                            if(categories != null){
                                for(Category c: categories){
                        %>

                        <option value="<%=c.getId()%>"><%=c.getName()%></option>
                        <%
                                }
                            }

                        %>
                    </select>
                 </div>

            <div class="row mt-3">
                <div class="col-9">
                    <button class="btn btn-success" type="submit">Update News</button>
                </div>
            </div>
        </form>

        <form action="/delete" method="post">
            <div class="row mt-3">
                <div class="col-9">
                    <input type="hidden" value="<%=news.getId()%>" name="id">
                    <button class="btn btn-danger" type="submit">Delete News</button>
                </div>
            </div>

        </form>

        <%
            }
             else  {
        %>
        <div class="col mt-2">
            <div class="card" style="width: 440px">
                <div class="card-body">
                    <p class="text-secondary"><%=news.getPost_date()%></p>
                    <p class="card-text"><%=news.getContent()%></p>
                    <p class="text-secondary"><%=news.getCategory().getName()%></p>
                </div>
            </div>
        </div>

        <div class="col-4 mt-2">
            <%List<Comment> comments = (List<Comment>) request.getAttribute("comments");
             if(comments!=null){
                 for(Comment c:comments){
             %>
                <div class="card" style="width: 440px">
                    <div class="card-body">

                        <p class="card-text"><%=c.getPost_date()%></p>
                        <p class="card-title"><%=c.getComment()%></p>
                        <p class="text-secondary"><%=c.getUser().getEmail()%></p>

                    </div>
                </div>
            </div>
                <%
                     }
                 }
                %>
        </div>


        <div class="row mt-3">
            <div class="row">
                <div class="col-12">

                    <form action="/comment" method="post">
                        <div class="row mt-3">
                            <div class="col-9">
                                <label class="form-label">Comment</label>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-9">
                                <input type="text" class="form-control" name="comment" >
                            </div>
                        </div>

                        <div class="row mt-3">
                            <input type="hidden" class="form-control" name="user_id" value="<%=user.getId()%>">
                            <input type="hidden" class="form-control" name="news_id" value="<%=news.getId()%>">
                        </div>
                        <div class="row mt-3">
                            <div class="col-9">
                                <button class="btn btn-success" type="submit">Leave a Comment</button>
                            </div>
                        </div>



                    </form>



                </div>
            </div>
        </div>




        <%

            }
            }
        %>

    </div>
</div>

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
