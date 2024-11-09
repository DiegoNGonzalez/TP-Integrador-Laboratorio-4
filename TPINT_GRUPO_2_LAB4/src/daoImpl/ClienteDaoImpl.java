package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.ClienteDao;
import entidades.Cliente;
import entidades.Usuario;

public class ClienteDaoImpl implements ClienteDao{

	@Override
	public boolean agregarCliente(Cliente cliente) {
	    String query = "INSERT INTO clientes(idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad) "
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
	        statement.setInt(9, 1); 
	        statement.setDate(10, new java.sql.Date(cliente.getFechaNacimiento().getTime()));
	        statement.setString(11, cliente.getDireccion());
	        statement.setInt(12, 1); 
	        statement.setInt(13, 1); 

	        // Ejecuta la actualización y devuelve si al menos una fila fue afectada
	        int filas = statement.executeUpdate();
	        return filas > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public ArrayList<Cliente> listarClientes() {
	    String query = "SELECT idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad FROM clientes";
	    ArrayList<Cliente> listaClientes = new ArrayList<>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {
	            Cliente cliente = new Cliente();
	            Usuario usuario= new UsuarioDaoImpl().obtenerUnUsuario(resultSet.getInt("idUsuario"));
	            // Asignar valores del ResultSet al objeto Cliente
	            cliente.setUsuario(usuario); // Asumimos que Cliente tiene un método setUsuario
	            cliente.setDni(resultSet.getString("dni"));
	            cliente.setCuil(resultSet.getString("cuil"));
	            cliente.setNombre(resultSet.getString("nombre"));
	            cliente.setApellido(resultSet.getString("apellido"));
	            cliente.setEmail(resultSet.getString("email"));
	            cliente.setTelefono(resultSet.getString("telefono"));
	            cliente.setSexo(resultSet.getString("sexo").charAt(0)); // Asumimos que sexo es un char
	            //cliente.setIdNacionalidad(resultSet.getInt("idNacionalidad"));
	            cliente.setFechaNacimiento(resultSet.getDate("fechaNacimiento"));
	            cliente.setDireccion(resultSet.getString("direccion"));
	            //cliente.setIdProvincia(resultSet.getInt("idProvincia"));
	            //cliente.setIdLocalidad(resultSet.getInt("idLocalidad"));

	            // Agregar el cliente a la lista
	            listaClientes.add(cliente);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return listaClientes;
	}

	@Override
	public void modificarCliente(int idCliente) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean bajaCliente(int idCliente) {
		// TODO Auto-generated method stub
		return false;
	}

}
