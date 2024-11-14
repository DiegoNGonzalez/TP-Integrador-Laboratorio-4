package negocio;

import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Cliente;
import entidades.Usuario;

public interface ClienteNegocio {
	public boolean agregarCliente(Cliente cliente);
	public ArrayList<Cliente> listarClientesActivos();
	public boolean modificarCliente(Cliente cliente);
	public boolean bajaCliente(int idCliente);
	public Cliente obtenerClientePorId(int idUsuario);
	public void verificarCliente(Cliente cliente);
	
	public ArrayList<Cliente> obtenerTodosLosClientesConCuentas();
	public void ejecutarSPCrearUsuario(Usuario usuario, Cliente cliente) throws SQLException;
}
