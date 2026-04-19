package db;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {
      public static Connection getConnection() {

        Connection con = null;

        try {
            // Load driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create connection
            con = DriverManager.getConnection(  "jdbc:mysql://localhost:3306/userdb" ,  "root",  "");
                

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}