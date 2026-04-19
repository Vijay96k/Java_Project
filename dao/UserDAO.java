package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;
import model.User;

public class UserDAO {

  
    public void updateUser(int id, String name, String email, String password) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql = "UPDATE users SET name=?, email=?, password=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setInt(4, id);

        ps.executeUpdate();

        ps.close();
        con.close();
    }

    public ResultSet getAllUsers() throws Exception {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM users";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        return rs;
    }

    
    public User getUserById(int id) {
        User user = null;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));  
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}