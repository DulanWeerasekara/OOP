package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.connection.DbCon;
import com.dao.UserDao;
import com.model.User;

@WebServlet("/delete-user")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            userDao = new UserDao(DbCon.getConnection());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        if (user != null) {
            userDao.deleteUser(user.getId());
			// Logout the user and redirect to a success page or the login page
			request.getSession().invalidate();
			response.sendRedirect("login.jsp");
        } else {
            // Handle the case when user is null (not logged in)
            // Redirect to the login page or display an error message
            response.sendRedirect("login.jsp");
        }
    }
}
