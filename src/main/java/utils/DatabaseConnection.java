package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public final class DatabaseConnection {

    private static final ResourceBundle CONFIG = ResourceBundle.getBundle("db");

    private DatabaseConnection() {
    }

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName(CONFIG.getString("driverName"));
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC driver configured in db.properties was not found", e);
        }

        return DriverManager.getConnection(
                setting("url", "DB_URL"),
                setting("user", "DB_USER"),
                setting("password", "DB_PASSWORD"));
    }

    private static String setting(String property, String environmentVariable) {
        String override = System.getenv(environmentVariable);
        return override != null ? override : CONFIG.getString(property);
    }
}
