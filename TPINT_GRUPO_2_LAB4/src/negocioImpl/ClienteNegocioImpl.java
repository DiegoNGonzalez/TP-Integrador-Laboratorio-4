package negocioImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.ClienteDao;
import dao.CuentaDao;
import daoImpl.ClienteDaoImpl;
import daoImpl.CuentaDaoImpl;
import entidades.Cliente;
import entidades.Usuario;

import exceptions.ClienteNegocioException;
import exceptions.ClienteSPException;
import negocio.ClienteNegocio;

public class ClienteNegocioImpl implements ClienteNegocio {

	private ClienteDao clienteDao;

	public ClienteNegocioImpl() {
		this.clienteDao = new ClienteDaoImpl();
	}

	@Override
	public boolean agregarCliente(Cliente cliente) {
		if (cliente == null) {
			System.out.println("El cliente no puede ser nulo");
			return false;
		}

		try {
			verificarCliente(cliente);
		} catch (ClienteNegocioException e) {
			System.out.println("Error al verificar el cliente: " + e.getMessage());
			return false;
		}

		boolean resultado = clienteDao.agregarCliente(cliente);
		return resultado;
	}

	@Override
	public void ejecutarSPCrearUsuario(Usuario usuario, Cliente cliente) throws SQLException { 
		if (cliente == null || usuario == null) {
			System.out.println("Error en los datos proporcionados.");
		}
		try {
			verificarCliente(cliente);
		} catch (ClienteNegocioException e) {
			throw new ClienteNegocioException(e.getMessage());

		}
		// incluirlo en la condicion
		try {
		clienteDao.ejecutarSPCrearUsuario(usuario, cliente);
		}
		catch (SQLException e) {
			e.printStackTrace();
			//ClienteSPException exc1 = new ClienteSPException();
			throw e;
		}finally {
			
		}		
	}

	@Override
	public ArrayList<Cliente> listarClientesActivos() {
		ArrayList<Cliente> clientes = clienteDao.listarClientesActivos();

		if (clientes == null || clientes.isEmpty()) {
			System.out.println("No hay clientes activos.");
			return new ArrayList<>();
		}

		return clientes;
	}

	@Override
	public boolean modificarCliente(Cliente cliente) {
		if (cliente == null) {
			System.out.println("El cliente no puede ser nulo.");
			return false;
		}

		try {
			verificarCliente(cliente);
		} catch (ClienteNegocioException e) {
			System.out.println("Error al verificar el cliente: " + e.getMessage());
			return false;
		}

		boolean resultado = clienteDao.modificarCliente(cliente);
		return resultado;
	}

	@Override
	public boolean bajaCliente(int idCliente) throws SQLException {
	    if (idCliente <= 0) {
	        System.out.println("El ID del cliente no es válido.");
	        return false;
	    }

	    try {
	        // Llamada al método en el DAO que ejecuta el procedimiento almacenado para la baja lógica
	        boolean resultado = clienteDao.bajaCliente(idCliente);
	        
	        if (!resultado) {
	            System.out.println("No se pudo realizar la baja lógica del cliente.");
	            return false;
	        }
	        
	        System.out.println("Baja lógica del cliente realizada correctamente.");
	        return true;

	    } catch (SQLException e) {
	        // Registro y manejo de la excepción SQL si falla el procedimiento almacenado
	        System.out.println("Error al realizar la baja lógica del cliente: " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }
	}


	@Override
	public Cliente obtenerClientePorId(int idCliente) {
		if (idCliente <= 0) {
			System.out.println("El ID de cliente no es vÃ¡lido.");
			return null;
		}

		
		return clienteDao.obtenerClientePorId(idCliente);
	}

	@Override
	public void verificarCliente(Cliente cliente) throws ClienteNegocioException {
		// Validación de campos vacíos
		if (cliente.getNombre() == null || cliente.getNombre().trim().isEmpty()) {
			String mensaje = "El nombre es obligatorio.";
			throw new ClienteNegocioException(mensaje);
		}
		if (cliente.getApellido() == null || cliente.getApellido().trim().isEmpty()) {
			String mensaje = "El apellido es obligatorio.";
			throw new ClienteNegocioException(mensaje);
		}
		if (cliente.getDni() == null || cliente.getDni().trim().isEmpty()) {
			String mensaje = "El DNI es obligatorio.";
			throw new ClienteNegocioException(mensaje);
		}
		if (cliente.getCuil() == null || cliente.getCuil().trim().isEmpty()) {
			String mensaje = "El CUIL es obligatorio.";
			throw new ClienteNegocioException(mensaje);
		}
		/*
		 * if (cliente.getSexo() == null || cliente.getSexo().trim().isEmpty()) {
		 * System.out.println("El sexo es obligatorio."); return false; } if
		 * (cliente.getNacionalidad() == null ||
		 * cliente.getNacionalidad().trim().isEmpty()) {
		 * System.out.println("La nacionalidad es obligatoria."); return false; }
		 */
		if (cliente.getFechaNacimiento() == null) {
			String mensaje = "La fecha de nacimiento es obligatoria.";
			throw new ClienteNegocioException(mensaje);
		}
		if (cliente.getDireccion() == null || cliente.getDireccion().trim().isEmpty()) {
			String mensaje = "La direccion es obligatoria.";
			throw new ClienteNegocioException(mensaje);
		}
		/*
		 * if (cliente.getLocalidad() == null ||
		 * cliente.getLocalidad().trim().isEmpty()) {
		 * System.out.println("La localidad es obligatoria."); return false; } if
		 * (cliente.getProvincia() == null || cliente.getProvincia().trim().isEmpty()) {
		 * System.out.println("La provincia es obligatoria."); return false; }
		 */
		if (cliente.getEmail() == null || cliente.getEmail().trim().isEmpty()) {
			String mensaje = "El email es obligatorio.";
			throw new ClienteNegocioException(mensaje);
		}
		if (cliente.getTelefono() == null || cliente.getTelefono().trim().isEmpty()) {
			String mensaje = "El telÃ©fono es obligatorio.";
			throw new ClienteNegocioException(mensaje);
		}
		
		 if (cliente.getUsuario().getNombreUsuario() == null || cliente.getUsuario().getNombreUsuario().trim().isEmpty()) {
			String mensaje = "El nombre de usuario es obligatorio.";
			throw new ClienteNegocioException(mensaje);
		}
		 if (cliente.getUsuario().getPassword() == null ||
		 cliente.getUsuario().getPassword().trim().isEmpty()) {
			String mensaje = "La contraseña es obligatoria.";
			throw new ClienteNegocioException(mensaje);
		}
		

		// Validación de formato de email
		String emailPattern = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";

		if (!cliente.getEmail().matches(emailPattern)) {
			String mensaje = "El email ingresado no es valido.";
			throw new ClienteNegocioException(mensaje);
		}

		// Validación de formato de DNI (7 o 8 digitos)
		String dniPattern = "^[0-9]{7,8}$";
		if (!cliente.getDni().matches(dniPattern)) {
			String mensaje = "El DNI debe tener entre 7 y 8 digitos.";
			throw new ClienteNegocioException(mensaje);
		}

		// Validación de formato de CUIL (11 digitos)
		String cuilPattern = "^[0-9]{2}-[0-9]{8}-[0-9]{1}$";
		if (!cliente.getCuil().matches(cuilPattern)) {
			String mensaje = "El CUIL debe tener 11 digitos.";
			throw new ClienteNegocioException(mensaje);

		}

	}

	public ArrayList<Cliente> obtenerTodosLosClientesConCuentas() {
		// Carga cada cliente y sus cuentas desde el dao de cuenta
		CuentaDao cuentaDao = new CuentaDaoImpl();

		ArrayList<Cliente> clientes = clienteDao.obtenerTodos();
		for (Cliente cliente : clientes) {
			cliente.setCuentas(cuentaDao.obtenerCuentasPorCliente(cliente.getIdCliente()));
		}
		return clientes;
	}
}
