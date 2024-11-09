package daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.UsuarioDao;
import entidades.TipoUsuario;
import entidades.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {
	
	private String host = "jdbc:mysql://localhost:3306/bancodb?useSSL=false&serverTimezone=UTC";
	private String user = "root";
	private String pass = "root";
	private String dbName = "bancodb";
	
	
	public Usuario verificarCredenciales(String nombreUsuario, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Usuario usuario = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try (Connection con = DriverManager.getConnection(host, user, pass)) {
				String sql = "SELECT u.idUsuario, u.nombreUsuario, u.contrasenia, u.estadoUsuario, t.idTipoUsuario, t.tipoUsuario " +
			             "FROM usuarios u " +
			             "INNER JOIN tiposusuarios t ON u.tipoUsuario = t.idTipoUsuario " +
			             "WHERE u.nombreUsuario = ? AND u.contrasenia = ?";

				
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, nombreUsuario);
				stmt.setString(2, password);
				
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					usuario = new Usuario();
					usuario.setId(rs.getInt("idUsuario"));
					usuario.setNombreUsuario(rs.getString("nombreUsuario"));
					usuario.setPassword(rs.getString("contrasenia"));
					usuario.setActivo(rs.getBoolean("estadoUsuario"));
					
					TipoUsuario tipoUsuario = new TipoUsuario();
					tipoUsuario.setId(rs.getInt("idTipoUsuario"));
					tipoUsuario.setTipoUsuario(rs.getString("tipoUsuario"));
					usuario.setTipoUsuario(tipoUsuario);
				}
			}
		} catch (Exception e) {
			System.out.println("Error al verificar credenciales: " + e.getMessage());
		}
		return usuario;
	}
	
	public Usuario obtenerUnUsuario(int id) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Usuario usuario = new Usuario();
		Connection con = null;
		try{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("Select * from usuarios where Id = ?");
			miSentencia.setInt(1, id);
			ResultSet resultado = miSentencia.executeQuery();
			resultado.next();
			
			usuario.setId(resultado.getInt(1));
		    usuario.setNombreUsuario(resultado.getString(2));
		    usuario.setPassword(resultado.getString(3));
		    usuario.setActivo(resultado.getBoolean(4));
		    TipoUsuario tipoUsuario = new TipoUsuario();
		    tipoUsuario.setId(resultado.getInt(5));
		    tipoUsuario.setTipoUsuario(resultado.getString(6));
		    usuario.setTipoUsuario(tipoUsuario);
		    
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		finally
		{
		}
		return usuario;
	}

}
