package dao;

import java.util.ArrayList;

import entidades.Cliente;
import entidades.Usuario;

public interface ClienteDao {

	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientesActivos();
	public boolean modificarCliente(Cliente cliente);
	public boolean bajaCliente(int idCliente);
	public Cliente obtenerClientePorId(int idUsuario);
	public void ejecutarSPCrearUsuario(Usuario usuario, Cliente cliente);
}
