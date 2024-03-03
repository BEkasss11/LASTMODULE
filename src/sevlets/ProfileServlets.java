package sevlets;

import classes.DBManager;
import classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/profile")
public class ProfileServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/profile.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullName");
        String password = req.getParameter("password");
        String repPassword = req.getParameter("repPassword");
        String role = req.getParameter("role");
        Long id = Long.valueOf(req.getParameter("id"));

        if (!password.equals(repPassword)) {
            resp.sendRedirect("/register?passwordFail");
            return;
        }

        User newUser = new User();
        newUser.setId(id);
        newUser.setEmail(email);
        newUser.setPassword(password);
        newUser.setFull_name(fullname);
        newUser.setRole(role);

        if (DBManager.updateUser(newUser)) {
            resp.sendRedirect("/profile");
        } else {
            resp.sendRedirect("/profile?updateFail");
        }

    }
}
