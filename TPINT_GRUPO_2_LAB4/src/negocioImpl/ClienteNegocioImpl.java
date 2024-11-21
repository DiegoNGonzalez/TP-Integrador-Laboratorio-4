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

//	@Override
//	public boolean agregarCliente(Cliente cliente) {
//		if (cliente == null) {
//			System.out.println("El cliente no puede ser nulo");
//			return false;
//		}
//
//		try {
//			verificarCliente(cliente);
//		} catch (ClienteNegocioException e) {
//			System.out.println("Error al verificar el cliente: " + e.getMessage());
//			return false;
//		}
//
//		boolean resultado = clienteDao.agregarCliente(cliente);
//		return resultado;
//	}

	@Override
	public void ejecutarSPCrearUsuario(Usuario usuario, Cliente cliente) throws SQLException { 
		if (cliente == null || usuario == null) {
			System.out.println("Error en los datos proporcionados.");
		}
		try {
			verificarCliente(cliente, usuario);
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
		Usuario usuario= cliente.getUsuario();

		try {
			verificarCliente(cliente,usuario);
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
	        System.out.println("El ID del cliente no es vï¿½lido.");
	        return false;
	    }

	    try {
	        // Llamada al mï¿½todo en el DAO que ejecuta el procedimiento almacenado para la baja lï¿½gica
	        boolean resultado = clienteDao.bajaCliente(idCliente);
	        
	        if (!resultado) {
	            System.out.println("No se pudo realizar la baja lï¿½gica del cliente.");
	            return false;
	        }
	        
	        System.out.println("Baja lÃ³gica del cliente realizada correctamente.");
	        return true;

	    } catch (SQLException e) {
	        // Registro y manejo de la excepciï¿½n SQL si falla el procedimiento almacenado
	        System.out.println("Error al realizar la baja lï¿½gica del cliente: " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }
	}


	@Override
	public Cliente obtenerClientePorId(int idCliente) {
		if (idCliente <= 0) {
			System.out.println("El ID de cliente no es valido.");
			return null;
		}

		
		return clienteDao.obtenerClientePorId(idCliente);
	}
	

	public Cliente obtenerClientePorIdUsuario(int idUsuario) {
		if (idUsuario <= 0) {
			System.out.println("El ID del usuario no es valido.");
			return null;
		}

		return clienteDao.obtenerClientePorIdUsuario(idUsuario);
	}

	@Override
	public void verificarCliente(Cliente cliente, Usuario usuario) throws ClienteNegocioException {
		// ValidaciÃ³n de campos vacÃ­os y de formato de nombre y apellido
		if (cliente.getNombre() == null || cliente.getNombre().trim().isEmpty()) {
		    throw new ClienteNegocioException("El nombre es obligatorio.");
		}
		// ValidaciÃ³n de que el nombre solo contenga letras, incluyendo letras con acentos y la Ã±
		if (!cliente.getNombre().matches("^[a-zA-ZáéíóúÁÉÍÓÚñÑ\\s]+$")) {
		    throw new ClienteNegocioException("El nombre solo puede contener letras.");
		}

		if (cliente.getApellido() == null || cliente.getApellido().trim().isEmpty()) {
		    throw new ClienteNegocioException("El apellido es obligatorio.");
		}
		// ValidaciÃ³n de que el apellido solo contenga letras, incluyendo letras con acentos y la Ã±
		if (!cliente.getApellido().matches("^[a-zA-ZáéíóúÁÉÍÓÚñÑ\\s]+$")) {
		    throw new ClienteNegocioException("El apellido solo puede contener letras.");
		}

		if (cliente.getDni() == null || cliente.getDni().trim().isEmpty()) {
		    throw new ClienteNegocioException("El DNI es obligatorio.");
		}
		// ValidaciÃ³n de formato de DNI (solo nÃºmeros y 7 u 8 dÃ­gitos)
		if (!cliente.getDni().matches("^[0-9]{7,8}$")) {
		    throw new ClienteNegocioException("El DNI debe tener entre 7 y 8 dÃ­gitos.");
		}

		if (cliente.getCuil() == null || cliente.getCuil().trim().isEmpty()) {
		    throw new ClienteNegocioException("El CUIL es obligatorio.");
		}
		// ValidaciÃ³n de formato de CUIL (solo nÃºmeros y formato XX-XXXXXXXX-X)
		if (!cliente.getCuil().matches("^[0-9]{2}-[0-9]{8}-[0-9]{1}$")) {
		    throw new ClienteNegocioException("El CUIL debe tener 11 dÃ­gitos en el formato XX-XXXXXXXX-X.");
		}

		if (cliente.getFechaNacimiento() == null) {
		    throw new ClienteNegocioException("La fecha de nacimiento es obligatoria.");
		}

		if (cliente.getDireccion() == null || cliente.getDireccion().trim().isEmpty()) {
		    throw new ClienteNegocioException("La direcciÃ³n es obligatoria.");
		}

		if (cliente.getEmail() == null || cliente.getEmail().trim().isEmpty()) {
		    throw new ClienteNegocioException("El email es obligatorio.");
		}
		// ValidaciÃ³n de formato de email
		if (!cliente.getEmail().matches("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
		    throw new ClienteNegocioException("El email ingresado no es vÃ¡lido.");
		}

		if (cliente.getTelefono() == null || cliente.getTelefono().trim().isEmpty()) {
		    throw new ClienteNegocioException("El telÃ©fono es obligatorio.");
		}
		// ValidaciÃ³n de que el telÃ©fono solo contenga nÃºmeros
		if (!cliente.getTelefono().matches("^[0-9]+$")) {
		    throw new ClienteNegocioException("El telÃ©fono solo puede contener nÃºmeros.");
		}


		if (usuario.getNombreUsuario() == null || usuario.getNombreUsuario().trim().isEmpty()) {
			throw new ClienteNegocioException("El nombre de usuario es obligatorio.");
		}

		if (usuario.getPassword() == null || usuario.getPassword().trim().isEmpty()) {
			throw new ClienteNegocioException("La contraseï¿½a es obligatoria.");
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

	@Override
	public ArrayList<String> recuperarContrasenia(String dni, String email, String pregunta, long respuesta) {
		ArrayList<String> datos= clienteDao.recuperarContrasenia(dni, email, pregunta, respuesta);
		if (datos == null || datos.isEmpty()) {
			System.out.println("No se pudieron corroborar los datos.");
			return new ArrayList<>();
		}

		return datos;
	}
}
