package negocio;

import java.util.ArrayList;

import entidades.Cliente;
import entidades.Usuario;

public interface ClienteNegocio {
	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientesActivos();
	public boolean modificarCliente(Cliente cliente);
	public boolean bajaCliente(int idCliente);
	public Cliente obtenerClientePorId(int idUsuario);
	public boolean verificarCliente(Cliente cliente);
	public void ejecutarSPCrearUsuario(Usuario usuario, Cliente cliente);
}
