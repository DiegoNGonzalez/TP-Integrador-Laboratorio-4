package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Cliente;
import entidades.Usuario;

public interface ClienteDao  {

	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientesActivos();
	public boolean modificarCliente(Cliente cliente);
	public boolean bajaCliente(int idCliente) throws SQLException;
	public Cliente obtenerClientePorId(int idUsuario);
	public void ejecutarSPCrearUsuario(Usuario usuario, Cliente cliente) throws SQLException;
	public ArrayList<Cliente> obtenerTodos();
}
