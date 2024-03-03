package sevlets;

import classes.DBManager;
import classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String full_name = req.getParameter("fullName");
        String password = req.getParameter("password");
        String repPassword  = req.getParameter("repPassword");

        if (!password.equals(repPassword)) {
            resp.sendRedirect("/register?passwordFail");
            return;
        }
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setPassword(password);
        newUser.setFull_name(full_name);

        if (DBManager.addUser(newUser)) {
            resp.sendRedirect("/login");
        } else {
            resp.sendRedirect("/register?registrationFail");
        }
    }
}
