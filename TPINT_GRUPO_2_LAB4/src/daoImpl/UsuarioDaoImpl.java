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
        String query = "SELECT idUsuario, nombreUsuario, contrasenia, estadoUsuario, tipoUsuario FROM usuarios WHERE idUsuario = ?";
        Usuario usuario = null;

        try (Connection conexion = Conexion.getConnection();
             PreparedStatement statement = conexion.prepareStatement(query)) {

            // Establecer el parámetro de la consulta
            statement.setInt(1, id);

            // Ejecutar la consulta
            try (ResultSet resultSet = statement.executeQuery()) {
                // Verificar si hay un resultado
                if (resultSet.next()) {
                    usuario = new Usuario();
                    
                    // Configurar los datos del usuario con los valores de la base de datos
                    usuario.setId(resultSet.getInt("idUsuario"));
                    usuario.setNombreUsuario(resultSet.getString("nombreUsuario"));
                    usuario.setPassword(resultSet.getString("contrasenia"));
                    usuario.setActivo(resultSet.getBoolean("estadoUsuario"));

                    // Asignar el tipo de usuario
                    TipoUsuario tipoUsuario = new TipoUsuario();
                    tipoUsuario.setId(resultSet.getInt("tipoUsuario"));
                    usuario.setTipoUsuario(tipoUsuario);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Retorna el usuario, será null si no se encontró
        return usuario;
    }

}
