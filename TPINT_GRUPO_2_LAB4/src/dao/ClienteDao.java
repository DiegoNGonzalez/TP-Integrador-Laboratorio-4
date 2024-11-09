package dao;

import java.util.ArrayList;

import entidades.Cliente;

public interface ClienteDao {

	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientes();
	public void modificarCliente(int idCliente);
	public boolean bajaCliente(int idCliente);
}
