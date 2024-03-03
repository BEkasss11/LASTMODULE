<%@ page import="java.util.List" %>
<%@ page import="classes.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/header.jsp"%>
<body>
<%@include file="/vendor/head.jsp"%>
<div class="body">
    <div class="container mt-3">

        <h3 style="margin-left: 20%">Here you can add News!</h3>
        <form action="/addNews" method="post">
            <div class="row mt-3">
                <div class="col-9">
                    <label class="form-label">Title</label>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-9">
                    <input type="text" class="form-control" name="title" required>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-9">
                    <label class="form-label">Content</label>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-9">
                    <textarea name="content" class="form-control" style="height: 250px" aria-required="true"></textarea>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-9">
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
            </div>

            <div class="row mt-3">
                <div class="col-9">
                    <button class="btn btn-success" type="submit">ADD BLOG</button>
                </div>
            </div>
        </form>
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
