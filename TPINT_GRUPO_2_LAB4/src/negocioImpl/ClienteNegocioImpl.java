package negocioImpl;

import java.util.ArrayList;

import dao.ClienteDao;
import dao.CuentaDao;
import daoImpl.ClienteDaoImpl;
import daoImpl.CuentaDaoImpl;
import entidades.Cliente;
import entidades.Usuario;

import exceptions.ClienteNegocioException;
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
	public void ejecutarSPCrearUsuario(Usuario usuario, Cliente cliente) {
		if (cliente == null || usuario == null) {
			System.out.println("Error en los datos proporcionados.");

		}
		try {
			verificarCliente(cliente);
		} catch (ClienteNegocioException e) {
			throw new ClienteNegocioException(e.getMessage());

		}
		// incluirlo en la condicion
		clienteDao.ejecutarSPCrearUsuario(usuario, cliente);
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
	public boolean bajaCliente(int idCliente) {
		if (idCliente <= 0) {
			System.out.println("El ID del cliente no es válido.");
			return false;
		}

		// Llamamos al método de la capa de datos para dar de baja el cliente
		return clienteDao.bajaCliente(idCliente);
	}

	@Override
	public Cliente obtenerClientePorId(int idCliente) {
		if (idCliente <= 0) {
			System.out.println("El ID de cliente no es válido.");
			return null;
		}

		// Llamamos al método de la capa de datos para obtener el cliente por ID
		return clienteDao.obtenerClientePorId(idCliente);
	}

	@Override
	public void verificarCliente(Cliente cliente) {
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
			String mensaje = "La dirección es obligatoria.";
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
			String mensaje = "El teléfono es obligatorio.";
			throw new ClienteNegocioException(mensaje);
		}
		/*
		 * if (cliente.getUsuario() == null || cliente.getUsuario().trim().isEmpty()) {
		 * System.out.println("El nombre de usuario es obligatorio."); return false; }
		 * if (cliente.getContrasena() == null ||
		 * cliente.getContrasena().trim().isEmpty()) {
		 * System.out.println("La contraseña es obligatoria."); return false; }
		 */

		// Validación de formato de email
		String emailPattern = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";

		if (!cliente.getEmail().matches(emailPattern)) {
			String mensaje = "El email ingresado no es válido.";
			throw new ClienteNegocioException(mensaje);
		}

		// Validación de formato de DNI (7 o 8 dígitos)
		String dniPattern = "^[0-9]{7,8}$";
		if (!cliente.getDni().matches(dniPattern)) {
			String mensaje = "El DNI debe tener entre 7 y 8 dígitos.";
			throw new ClienteNegocioException(mensaje);
		}

		// Validación de formato de CUIL (11 dígitos)
		String cuilPattern = "^[0-9]{11}$";
		if (!cliente.getCuil().matches(cuilPattern)) {
			String mensaje = "El CUIL debe tener 11 dígitos.";
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
