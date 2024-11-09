package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import java.sql.PreparedStatement;

import dao.ClienteDao;
import entidades.Cliente;

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
		// TODO Auto-generated method stub
		return null;
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
