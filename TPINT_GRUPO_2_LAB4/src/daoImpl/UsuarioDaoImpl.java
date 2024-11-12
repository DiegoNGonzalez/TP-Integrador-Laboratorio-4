package daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import dao.UsuarioDao;
import entidades.TipoUsuario;
import entidades.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {
	
	public Usuario verificarCredenciales(String nombreUsuario, String password) {
		
		String sql = "SELECT u.idUsuario, u.nombreUsuario, u.contrasenia, u.estadoUsuario, t.idTipoUsuario, t.tipoUsuario " +
                     "FROM usuarios u " +
                     "INNER JOIN tiposusuarios t ON u.tipoUsuario = t.idTipoUsuario " +
                     "WHERE u.nombreUsuario = ? AND u.contrasenia = ?";

        Usuario usuario = null;
        
        try (Connection con = Conexion.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            
            stmt.setString(1, nombreUsuario);
            stmt.setString(2, password);
            
            try (ResultSet rs = stmt.executeQuery()) {
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

	@Override
	public boolean agregarUsuario(Usuario usuario) {
        String query = "INSERT INTO usuarios(nombreUsuario, contrasenia, tipoUsuario, estadoUsuario) VALUES (?, ?, ?, ?)";
        
        try (Connection conexion = Conexion.getConnection();
             PreparedStatement statement = conexion.prepareStatement(query)) {
             
            // Establecer los valores de los parámetros
            statement.setString(1, usuario.getNombreUsuario());
            statement.setString(2, usuario.getPassword());
            statement.setInt(3, usuario.getTipoUsuario().getId());
            statement.setBoolean(4, usuario.isActivo());

            // Ejecutar la inserción y verificar el número de filas afectadas
            int filasAfectadas = statement.executeUpdate();
            return filasAfectadas > 0; // si la inserción fue exitosa

        } catch (Exception e) {
            e.printStackTrace();
            return false; //si ocurrió algún error
        }
    }
	
	public Usuario buscarUsuario(String nombreUsuario) {
	    String query = "SELECT * FROM usuarios WHERE nombreUsuario = ?";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        statement.setString(1, nombreUsuario);
	        
	        // Ejecutar la consulta
	        ResultSet resultado = statement.executeQuery();
	        
	        // Si existe un resultado, crear y devolver el objeto Usuario
	        if (resultado.next()) {
	            Usuario usuario = new Usuario();
	            usuario.setId(resultado.getInt("idUsuario"));
	            usuario.setNombreUsuario(resultado.getString("nombreUsuario"));
	            usuario.setPassword(resultado.getString("contrasenia"));
	            TipoUsuario tipoUsuario = new TipoUsuario();
	            tipoUsuario.setId(resultado.getInt("tipoUsuarioId"));
	            tipoUsuario.setTipoUsuario(resultado.getString("tipoUsuarioNombre"));
	            usuario.setTipoUsuario(tipoUsuario);
	            usuario.setActivo(resultado.getBoolean("estadoUsuario"));
	            return usuario;
	        } else {
	            return null; // si no se encontró el usuario
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	public boolean eliminarUsuarioLogico(int idUsuario) {
	    String query = "UPDATE usuarios SET estadoUsuario = false WHERE idUsuario = ?";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        statement.setInt(1, idUsuario);
	        
	        // Elimina el usuario y verifica el número de filas afectadas
	        int filasAfectadas = statement.executeUpdate();
	        return filasAfectadas > 0; // si la actualización fue exitosa
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	public int agregarUsuario2(Usuario usuario) {
	    int generatedId = -1;
	    String query = "INSERT INTO usuarios (nombreUsuario, contrasenia, tipoUsuario, estadoUsuario) VALUES (?, ?, ?, ?);";

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

	        statement.setString(1, usuario.getNombreUsuario());
	        statement.setString(2, usuario.getPassword());
	        statement.setInt(3, usuario.getTipoUsuario().getId());
	        statement.setBoolean(4, usuario.isActivo());

	        int rowsAffected = statement.executeUpdate();

	        if (rowsAffected > 0) {
	            ResultSet generatedKeys = statement.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                generatedId = generatedKeys.getInt(1);
	                usuario.setId(generatedId); // Asigna el ID al objeto usuario
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return generatedId;
	}


}
