package sevlets;

import classes.Comment;
import classes.DBManager;
import classes.News;
import classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/comment")
public class CommentServlets extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String comm = req.getParameter("comment");
         Long user = Long.valueOf(req.getParameter("user_id"));
         Long news = Long.valueOf(req.getParameter("news_id"));
        Comment comment = new Comment();
        comment.setComment(comm);

        News news1 = new News();
        news1.setId(news);

        User user1 = new User();
        user1.setId(user);
        comment.setUser(user1);
        comment.setNews(news1);

         if(DBManager.addComment(comment)) {
             resp.sendRedirect("/news");
         }
         else {
             resp.sendRedirect("/newsError");
         }



    }
}
