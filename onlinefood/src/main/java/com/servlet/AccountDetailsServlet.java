package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import com.connection.DbCon;
import com.dao.*;
import com.model.*;

@WebServlet("/account-details")
public class AccountDetailsServlet extends HttpServlet {
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
            User userDetails = userDao.getUserById(user.getId());
            if (userDetails != null) {
                request.setAttribute("userDetails", userDetails);
            }
        }
        request.getRequestDispatcher("account-details.jsp").forward(request, response);
    }
}
