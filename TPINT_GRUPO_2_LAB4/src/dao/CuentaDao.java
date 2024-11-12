package dao;
import java.util.ArrayList;


public interface CuentaDao {
	public boolean agregarCliente(Cuenta cliente);
	public ArrayList<Cliente> listarClientesActivos();
	public boolean modificarCliente(Cliente cliente);
	public boolean bajaCliente(int idCliente);
	
	
	public Cliente obtenerClientePorId(int idUsuario);
}