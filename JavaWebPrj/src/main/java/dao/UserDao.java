package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.UserModel;
import utils.DBConnection;

public class UserDao {
	public boolean validate(UserModel userModel) throws ClassNotFoundException {
		boolean status = false;
		String sql = "SELECT * FROM m_user WHERE username = ? and password = ? ";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userModel.getUsername());
			preparedStatement.setString(2, userModel.getPassword());
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public boolean issetUser(String userName) throws ClassNotFoundException {
		boolean status = false;
		String sql = "SELECT * from m_user where username = ?";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public int addUser(UserModel userModel) throws ClassNotFoundException {
		int result = 0;
		String sql = "INSERT INTO m_user(username, password, image_real_name, image_name, regist_date) VALUES (?, ?, ?, ?, ?);";
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userModel.getUsername());
			preparedStatement.setString(2, userModel.getPassword());
			preparedStatement.setString(3, userModel.getImage_real_name());
			preparedStatement.setString(4, userModel.getImage_name());
			preparedStatement.setString(5, userModel.getRegist_date());

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
