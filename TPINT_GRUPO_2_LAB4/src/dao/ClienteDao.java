package dao;

import java.util.ArrayList;

import entidades.Cliente;

public interface ClienteDao {

	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientes();
	public boolean modificarCliente(Cliente cliente);
	public boolean bajaCliente(int idCliente);
	public Cliente obtenerClientePorId(int idUsuario);
}
