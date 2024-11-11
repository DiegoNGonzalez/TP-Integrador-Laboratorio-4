package test;

import java.util.ArrayList;
import java.util.Date;

import daoImpl.ClienteDaoImpl;
import entidades.Cliente;
import entidades.TipoUsuario;
import entidades.Usuario;

public class TestCliente {

	public void testAgregar() {
		// Crear el cliente con datos de ejemplo
		TipoUsuario tipoUsuario = new TipoUsuario(1, "cliente");
		Cliente cliente = new Cliente();
		Usuario usuario = new Usuario(1, "juan", "1234", true, tipoUsuario);

		// Configurar los valores del cliente (aquí reemplaza con datos de ejemplo)
		cliente.setUsuario(usuario); // Suponiendo que Usuario tiene un constructor que acepta un ID
		cliente.setDni("12345673");
		cliente.setCuil("20-12345639-3");
		cliente.setNombre("Juan23");
		cliente.setApellido("Pérez23");
		cliente.setEmail("juan.perez@example.com");
		cliente.setTelefono("123456719");
		cliente.setSexo('M'); // O 'F', depende del caso
		cliente.setFechaNacimiento(new Date()); // Fecha actual como ejemplo
		cliente.setDireccion("Calle Falsa 123");

		// Crear una instancia del objeto que contiene el método agregarCliente
		ClienteDaoImpl clienteDAO = new ClienteDaoImpl();

		// Llamar al método y verificar el resultado
		boolean resultado = clienteDAO.agregarCliente(cliente);

		if (resultado) {
			System.out.println("Cliente agregado exitosamente.");
		} else {
			System.out.println("Error al agregar el cliente.");
		}
	}

	public void testListar() {
		ClienteDaoImpl clienteDAO = new ClienteDaoImpl();

		ArrayList<Cliente> clientes = clienteDAO.listarClientesActivos();

		if (clientes != null && !clientes.isEmpty()) {
			System.out.println("Clientes encontrados:");
			for (Cliente cliente : clientes) {
				System.out.println("ID Usuario: " + cliente.getUsuario().getId());
				System.out.println("DNI: " + cliente.getDni());
				System.out.println("Nombre: " + cliente.getNombre());
				System.out.println("Apellido: " + cliente.getApellido());
				System.out.println("Email: " + cliente.getEmail());
				System.out.println("Telefono: " + cliente.getTelefono());
				System.out.println("Sexo: " + cliente.getSexo());
				System.out.println("Dirección: " + cliente.getDireccion());
				System.out.println("Fecha de Nacimiento: " + cliente.getFechaNacimiento());
				System.out.println("----------------------------");
			}
		} else {
			System.out.println("No se encontraron clientes o hubo un error.");
		}
	}

	public void testModificar() {
		// Crear el cliente con datos de ejemplo (mismo cliente agregado antes)
		TipoUsuario tipoUsuario = new TipoUsuario(1, "cliente");
		Cliente cliente = new Cliente();
		Usuario usuario = new Usuario(1, "juan", "1234", true, tipoUsuario);

		// Configurar los valores del cliente para la modificación
		cliente.setUsuario(usuario);
		cliente.setDni("12345673");
		cliente.setCuil("20-12345639-3");
		cliente.setNombre("Juan23Modificado");
		cliente.setApellido("Pérez23 Modificado");
		cliente.setEmail("juan.perez.modified@example.com");
		cliente.setTelefono("987654321");
		cliente.setSexo('M');
		cliente.setFechaNacimiento(new Date()); // Fecha actual como ejemplo
		cliente.setDireccion("Calle Modificada 456");

		// Crear una instancia del objeto que contiene el método modificarCliente
		ClienteDaoImpl clienteDAO = new ClienteDaoImpl();

		// Llamar al método y verificar el resultado
		boolean resultado = clienteDAO.modificarCliente(cliente);

		if (resultado) {
			System.out.println("Cliente modificado exitosamente.");
		} else {
			System.out.println("Error al modificar el cliente.");
		}

		// Verificar que los cambios se han reflejado correctamente
		Cliente clienteActualizado = clienteDAO.obtenerClientePorId(cliente.getUsuario().getId());
		if (clienteActualizado != null) {
			System.out.println(
					"Cliente actualizado: " + clienteActualizado.getNombre() + " " + clienteActualizado.getApellido());
		} else {
			System.out.println("No se encontró el cliente después de la modificación.");
		}
	}

	public void testBaja() {
		// Supón que el cliente con id 1 existe en la base de datos
		int idCliente = 1; // ID del cliente a dar de baja

		// Crear una instancia del objeto que contiene el método bajaCliente
		ClienteDaoImpl clienteDAO = new ClienteDaoImpl();

		// Llamar al método de baja lógica
		boolean resultado = clienteDAO.bajaCliente(idCliente);

		if (resultado) {
			System.out.println("Cliente dado de baja lógicamente.");
		} else {
			System.out.println("Error al dar de baja el cliente.");
		}

		// Verificar que el cliente ha sido dado de baja
		Cliente clienteBajado = clienteDAO.obtenerClientePorId(idCliente);
		if (clienteBajado != null && !clienteBajado.isEstado()) {
			System.out.println("El cliente está inactivo.");
		} else {
			System.out.println("El cliente no fue dado de baja correctamente.");
		}
	}

	public static void main(String[] args) {
		TestCliente testCliente = new TestCliente();
		// Llamar a testAgregar para agregar un cliente
		System.out.println("Ejecutando testAgregar...");
		testCliente.testAgregar();

		// Llamar a testListar para listar todos los clientes
		System.out.println("\nEjecutando testListar...");
		testCliente.testListar();
		// Llamar a testModificar para modificar un cliente
		System.out.println("\nEjecutando testModificar...");
		testCliente.testModificar();

		// Llamar a testBaja para dar de baja un cliente
		System.out.println("\nEjecutando testBaja...");
		testCliente.testBaja();
		// Llamar a testListar para listar todos los clientes
				System.out.println("\nEjecutando testListar...");
				testCliente.testListar();
	}
}
