package com.dao;

import java.io.Console;
import java.sql.*;

import com.model.*;

public class UserDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new User();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
	public void createUser(String name, String email, String password) {
	    try {
	        query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
	        pst = this.con.prepareStatement(query);
	        pst.setString(1, name);
	        pst.setString(2, email);
	        pst.setString(3, password);
	        pst.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println(e.getMessage());
	    }
	}
    public User getUserById(int userId) {
        User user = null;
        try {
            query = "SELECT * FROM users WHERE id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, userId);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
    public void editUser(int userId, String newName, String newEmail,String newPassword) {
        try {
            query = "UPDATE users SET name=? ,email=?, password=? WHERE id=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, newName);
            pst.setString(2, newEmail);
            pst.setInt(4, userId);
            pst.setString(3, newPassword);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void deleteUser(int id) {
        try {
            String query = "DELETE FROM users WHERE id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    
}
