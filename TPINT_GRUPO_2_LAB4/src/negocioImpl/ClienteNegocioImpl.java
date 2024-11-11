package negocioImpl;

import java.util.ArrayList;

import dao.ClienteDao;
import daoImpl.ClienteDaoImpl;
import entidades.Cliente;
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

		if(!verificarCliente(cliente)) {
			return false;
		}
		
		boolean resultado= clienteDao.modificarCliente(cliente);

	    // Si todas las validaciones pasan, proceder a agregar el cliente
	    
	    return resultado;
	}

	@Override
	public ArrayList<Cliente> listarClientesActivos() {
		// Llamamos al método de la capa de datos para listar los clientes activos
		ArrayList<Cliente> clientes = clienteDao.listarClientesActivos();

		if (clientes == null || clientes.isEmpty()) {
			System.out.println("No hay clientes activos.");
			return new ArrayList<>();
		}

		return clientes;
	}

	@Override
	public boolean modificarCliente(Cliente cliente) {
		if (cliente == null || cliente.getUsuario() == null) {
			System.out.println("El cliente o el usuario no pueden ser nulos.");
			return false;
		}

		if(!verificarCliente(cliente)) {
			return false;
		}

		boolean resultado= clienteDao.modificarCliente(cliente);
		// Llamamos al método de la capa de datos para modificar el cliente
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
	public Cliente obtenerClientePorId(int idUsuario) {
		if (idUsuario <= 0) {
			System.out.println("El ID de usuario no es válido.");
			return null;
		}

		// Llamamos al método de la capa de datos para obtener el cliente por ID
		return clienteDao.obtenerClientePorId(idUsuario);
	}

	@Override
	public boolean verificarCliente(Cliente cliente) {
	    // Validación de campos vacíos
	    if (cliente.getNombre() == null || cliente.getNombre().trim().isEmpty()) {
	        System.out.println("El nombre es obligatorio.");
	        return false;
	    }
	    if (cliente.getApellido() == null || cliente.getApellido().trim().isEmpty()) {
	        System.out.println("El apellido es obligatorio.");
	        return false;
	    }
	    if (cliente.getDni() == null || cliente.getDni().trim().isEmpty()) {
	        System.out.println("El DNI es obligatorio.");
	        return false;
	    }
	    if (cliente.getCuil() == null || cliente.getCuil().trim().isEmpty()) {
	        System.out.println("El CUIL es obligatorio.");
	        return false;
	    }
	    /*if (cliente.getSexo() == null || cliente.getSexo().trim().isEmpty()) {
	        System.out.println("El sexo es obligatorio.");
	        return false;
	    }
	    if (cliente.getNacionalidad() == null || cliente.getNacionalidad().trim().isEmpty()) {
	        System.out.println("La nacionalidad es obligatoria.");
	        return false;
	    }*/
	    if (cliente.getFechaNacimiento() == null) {
	        System.out.println("La fecha de nacimiento es obligatoria.");
	        return false;
	    }
	    if (cliente.getDireccion() == null || cliente.getDireccion().trim().isEmpty()) {
	        System.out.println("La dirección es obligatoria.");
	        return false;
	    }
	    /*if (cliente.getLocalidad() == null || cliente.getLocalidad().trim().isEmpty()) {
	        System.out.println("La localidad es obligatoria.");
	        return false;
	    }
	    if (cliente.getProvincia() == null || cliente.getProvincia().trim().isEmpty()) {
	        System.out.println("La provincia es obligatoria.");
	        return false;
	    }*/
	    if (cliente.getEmail() == null || cliente.getEmail().trim().isEmpty()) {
	        System.out.println("El email es obligatorio.");
	        return false;
	    }
	    if (cliente.getTelefono() == null || cliente.getTelefono().trim().isEmpty()) {
	        System.out.println("El teléfono es obligatorio.");
	        return false;
	    }
	    /*if (cliente.getUsuario() == null || cliente.getUsuario().trim().isEmpty()) {
	        System.out.println("El nombre de usuario es obligatorio.");
	        return false;
	    }
	    if (cliente.getContrasena() == null || cliente.getContrasena().trim().isEmpty()) {
	        System.out.println("La contraseña es obligatoria.");
	        return false;
	    }*/

	    // Validación de formato de email
	    String emailPattern = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
	    if (!cliente.getEmail().matches(emailPattern)) {
	        System.out.println("El email ingresado no es válido.");
	        return false;
	    }

	    // Validación de formato de DNI (7 o 8 dígitos)
	    String dniPattern = "^[0-9]{7,8}$";
	    if (!cliente.getDni().matches(dniPattern)) {
	        System.out.println("El DNI debe tener entre 7 y 8 dígitos.");
	        return false;
	    }

	    // Validación de formato de CUIL (11 dígitos)
	    String cuilPattern = "^[0-9]{11}$";
	    if (!cliente.getCuil().matches(cuilPattern)) {
	        System.out.println("El CUIL debe tener 11 dígitos.");
	        return false;
	    }

	    // Si todas las validaciones pasan, devolver true
	    return true;
	}
}
