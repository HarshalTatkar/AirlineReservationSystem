package com.airline.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // Java DB (Derby) default connection details
    private static final String URL = "jdbc:derby://localhost:1527/airline_db";
    private static final String USERNAME = "app"; // Default NetBeans JavaDB user
    private static final String PASSWORD = "app"; // Default NetBeans JavaDB password

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load the Java DB driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Java DB Driver not found: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
        }
        return conn;
    }
}
