package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.ClienteDao;
import entidades.Cliente;
import entidades.Localidad;
import entidades.Nacionalidad;
import entidades.Provincia;
import entidades.Usuario;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.NacionalidadNegocioImpl;
import negocioImpl.ProvinciaNegocioImpl;

public class ClienteDaoImpl implements ClienteDao{

	@Override
	public boolean agregarCliente(Cliente cliente) {
	    String query = "INSERT INTO clientes(idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idLocalidad, idProvincia) "
	                 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        // Asignación de parámetros
	        statement.setInt(1, cliente.getUsuario().getId());
	        statement.setString(2, cliente.getDni());
	        statement.setString(3, cliente.getCuil());
	        statement.setString(4, cliente.getNombre());
	        statement.setString(5, cliente.getApellido());
	        statement.setString(6, cliente.getEmail());
	        statement.setString(7, cliente.getTelefono());
	        statement.setString(8, String.valueOf(cliente.getSexo())); 
	        statement.setInt(9, cliente.getNacionalidad().getId()); 
	        statement.setDate(10, new java.sql.Date(cliente.getFechaNacimiento().getTime()));
	        statement.setString(11, cliente.getDireccion());
	        statement.setInt(12, cliente.getLocalidad().getId()); 
	        statement.setInt(13, cliente.getProvincia().getId()); 

	        // Ejecuta la actualización y devuelve si al menos una fila fue afectada
	        int filas = statement.executeUpdate();
	        return filas > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public ArrayList<Cliente> listarClientesActivos() {
	    String query = "SELECT idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad FROM clientes where estado=1";
	    ArrayList<Cliente> listaClientes = new ArrayList<>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {
	            Cliente cliente = new Cliente();
	            Usuario usuario= new UsuarioDaoImpl().obtenerUnUsuario(resultSet.getInt("idUsuario"));
	            Nacionalidad nacionalidad = new NacionalidadDaoImpl().obtenerNacionalidadPorId(resultSet.getInt("idNacionalidad"));
	            Localidad localidad = new LocalidadDaoImpl().obtenerLocalidadPorId(resultSet.getInt("idLocalidad"));
	            Provincia provincia = new ProvinciaDaoImpl().obtenerProvinciaPorId(resultSet.getInt("idProvincia"));
	            // Asignar valores del ResultSet al objeto Cliente
	            cliente.setUsuario(usuario); 
	            cliente.setDni(resultSet.getString("dni"));
	            cliente.setCuil(resultSet.getString("cuil"));
	            cliente.setNombre(resultSet.getString("nombre"));
	            cliente.setApellido(resultSet.getString("apellido"));
	            cliente.setEmail(resultSet.getString("email"));
	            cliente.setTelefono(resultSet.getString("telefono"));
	            cliente.setSexo(resultSet.getString("sexo").charAt(0));
	            cliente.setNacionalidad(nacionalidad);
	            cliente.setFechaNacimiento(resultSet.getDate("fechaNacimiento"));
	            cliente.setDireccion(resultSet.getString("direccion"));
	            cliente.setProvincia(provincia);
	            cliente.setLocalidad(localidad);

	            // Agregar el cliente a la lista
	            listaClientes.add(cliente);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return listaClientes;
	}

	@Override
	public boolean modificarCliente(Cliente cliente) {
	    String query = "UPDATE clientes SET nombre = ?, apellido = ?, email = ?, telefono = ?, direccion = ? WHERE idUsuario = ?";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        // Asignación de parámetros para actualizar los datos
	        statement.setString(1, cliente.getNombre());
	        statement.setString(2, cliente.getApellido());
	        statement.setString(3, cliente.getEmail());
	        statement.setString(4, cliente.getTelefono());
	        statement.setString(5, cliente.getDireccion());
	        statement.setInt(6, cliente.getUsuario().getId());
	        
	        // Ejecuta la actualización y verifica si fue exitosa
	        return statement.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public boolean bajaCliente(int idCliente) {
		String query = "UPDATE clientes SET estado = 0 WHERE idUsuario = ?";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        // Establecer el ID del cliente a inactivar
	        statement.setInt(1, idCliente);
	        
	        // Ejecuta la actualización y verifica si fue exitosa
	        return statement.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	@Override
	public Cliente obtenerClientePorId(int idUsuario) {
	    String query = "SELECT idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad "
	                 + "FROM clientes WHERE idUsuario = ?";
	    
	    Cliente cliente = null;
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        // Establecer el parámetro de consulta (ID de usuario)
	        statement.setInt(1, idUsuario);
	        
	        try (ResultSet resultSet = statement.executeQuery()) {
	            // Si se encuentra el cliente, se crea el objeto Cliente
	            if (resultSet.next()) {
	                cliente = new Cliente();
	                
	                // Obtener el Usuario relacionado al cliente
	                Usuario usuario = new UsuarioDaoImpl().obtenerUnUsuario(resultSet.getInt("idUsuario"));
	                
	                // Asignar los valores obtenidos del ResultSet al objeto Cliente
	                cliente.setUsuario(usuario);
	                cliente.setDni(resultSet.getString("dni"));
	                cliente.setCuil(resultSet.getString("cuil"));
	                cliente.setNombre(resultSet.getString("nombre"));
	                cliente.setApellido(resultSet.getString("apellido"));
	                cliente.setEmail(resultSet.getString("email"));
	                cliente.setTelefono(resultSet.getString("telefono"));
	                cliente.setSexo(resultSet.getString("sexo").charAt(0)); // Convertir a 'M' o 'F'
	                cliente.setFechaNacimiento(resultSet.getDate("fechaNacimiento"));
	                cliente.setDireccion(resultSet.getString("direccion"));
	                
	                NacionalidadDaoImpl nacionalidadDao = new NacionalidadDaoImpl();
	                LocalidadDaoImpl localidadDao = new LocalidadDaoImpl();
	                ProvinciaDaoImpl provinciaDao = new ProvinciaDaoImpl();

	                Nacionalidad nacionalidad = nacionalidadDao.obtenerNacionalidadPorId(resultSet.getInt("idNacionalidad"));
	                Localidad localidad = localidadDao.obtenerLocalidadPorId(resultSet.getInt("idLocalidad"));
	                Provincia provincia = provinciaDao.obtenerProvinciaPorId(resultSet.getInt("idProvincia"));

	                cliente.setNacionalidad(nacionalidad);
	                cliente.setLocalidad(localidad);
	                cliente.setProvincia(provincia);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return cliente;
	}

	

}
