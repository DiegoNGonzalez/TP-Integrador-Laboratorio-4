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
		// Validación de campos vacíos y de formato de nombre y apellido
		if (cliente.getNombre() == null || cliente.getNombre().trim().isEmpty()) {
			throw new ClienteNegocioException("El nombre es obligatorio.");
		}
		// Validación de que el nombre solo contenga letras
		if (!cliente.getNombre().matches("^[a-zA-ZáéíóúÁÉÍÓÚñÑ\\s]+$")) {
			throw new ClienteNegocioException("El nombre solo puede contener letras.");
		}

		if (cliente.getApellido() == null || cliente.getApellido().trim().isEmpty()) {
			throw new ClienteNegocioException("El apellido es obligatorio.");
		}
		// Validación de que el apellido solo contenga letras
		if (!cliente.getApellido().matches("^[a-zA-ZáéíóúÁÉÍÓÚñÑ\\s]+$")) {
			throw new ClienteNegocioException("El apellido solo puede contener letras.");
		}

		if (cliente.getDni() == null || cliente.getDni().trim().isEmpty()) {
			throw new ClienteNegocioException("El DNI es obligatorio.");
		}
		// Validación de formato de DNI (solo números y 7 u 8 dígitos)
		if (!cliente.getDni().matches("^[0-9]{7,8}$")) {
			throw new ClienteNegocioException("El DNI debe tener entre 7 y 8 dígitos.");
		}

		if (cliente.getCuil() == null || cliente.getCuil().trim().isEmpty()) {
			throw new ClienteNegocioException("El CUIL es obligatorio.");
		}
		// Validación de formato de CUIL (solo números y formato XX-XXXXXXXX-X)
		if (!cliente.getCuil().matches("^[0-9]{2}-[0-9]{8}-[0-9]{1}$")) {
			throw new ClienteNegocioException("El CUIL debe tener 11 dígitos en el formato XX-XXXXXXXX-X.");
		}

		if (cliente.getFechaNacimiento() == null) {
			throw new ClienteNegocioException("La fecha de nacimiento es obligatoria.");
		}

		if (cliente.getDireccion() == null || cliente.getDireccion().trim().isEmpty()) {
			throw new ClienteNegocioException("La dirección es obligatoria.");
		}

		if (cliente.getEmail() == null || cliente.getEmail().trim().isEmpty()) {
			throw new ClienteNegocioException("El email es obligatorio.");
		}
		// Validación de formato de email
		if (!cliente.getEmail().matches("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
			throw new ClienteNegocioException("El email ingresado no es válido.");
		}

		if (cliente.getTelefono() == null || cliente.getTelefono().trim().isEmpty()) {
			throw new ClienteNegocioException("El teléfono es obligatorio.");
		}
		// Validación de que el teléfono solo contenga números
		if (!cliente.getTelefono().matches("^[0-9]+$")) {
			throw new ClienteNegocioException("El teléfono solo puede contener números.");
		}

//		if (cliente.getUsuario().getNombreUsuario() == null || cliente.getUsuario().getNombreUsuario().trim().isEmpty()) {
//			throw new ClienteNegocioException("El nombre de usuario es obligatorio.");
//		}
//
//		if (cliente.getUsuario().getPassword() == null || cliente.getUsuario().getPassword().trim().isEmpty()) {
//			throw new ClienteNegocioException("La contraseña es obligatoria.");
//		}
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
