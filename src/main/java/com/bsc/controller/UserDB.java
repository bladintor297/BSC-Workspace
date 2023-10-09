package com.bsc.controller;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bsc.beans.Users;
import com.bsc.model.DBConnection;

public class UserDB {

    public int insertUser(Users rb) {
        int generatedUserID = -1; // Initialize to a default value
        DBConnection db = new DBConnection();
        Connection con = db.getCon();
        try {
            Statement stat = con.createStatement();
            int rowsAffected = stat.executeUpdate("insert into users(name,email,password) values('" + rb.getName() + "','" + rb.getEmail()
                    + "','" + rb.getPassword() + "')", Statement.RETURN_GENERATED_KEYS);

            if (rowsAffected == 1) {
                ResultSet generatedKeys = stat.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedUserID = generatedKeys.getInt(1); // Get the generated ID
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return generatedUserID;
    }
}
