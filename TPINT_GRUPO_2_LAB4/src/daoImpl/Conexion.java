package daoImpl;

import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;

public class Conexion {

	private static String host = "jdbc:mysql://localhost:3306/bancodb?useSSL=false&serverTimezone=UTC";
	private static String user = "root";
	private static String pass = "root";
	private static String dbName = "bancodb";

	
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(host +dbName,user,pass);
	}
}