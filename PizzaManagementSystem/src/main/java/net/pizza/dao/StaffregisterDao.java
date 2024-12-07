package net.pizza.dao;


import net.pizza.model.Staffnewregister;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

public class StaffregisterDao {
	public static int newstaff(Staffnewregister staffnewregister) throws ClassNotFoundException {
	      String INSERT_USERS_SQL = "INSERT INTO users ( user_name, passkey, passkey1) VALUES (?, ?, ?)";
	      int result = 0;
	      
	      Class.forName("com.mysql.cj.jdbc.Driver");


      try {
          Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pizza_ordering_system?useSSL=false", "root", "root");
          PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL);
          
          ps.setString(1, staffnewregister.getUsername());
          ps.setString(2, staffnewregister.getPswrd());
          ps.setString(3, staffnewregister.getPswrd1());
          System.out.println(ps);
           result= ps.executeUpdate();
      } catch (SQLException e) {
          e.printStackTrace();
      }
      
			return result;
  }

}
