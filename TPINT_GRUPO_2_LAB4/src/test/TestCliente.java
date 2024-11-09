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
		cliente.setDni("12345679");
		cliente.setCuil("20-12345679-3");
		cliente.setNombre("Juan2");
		cliente.setApellido("Pérez2");
		cliente.setEmail("juan.perez@example.com");
		cliente.setTelefono("123456739");
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

		ArrayList<Cliente> clientes = clienteDAO.listarClientes();

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
public static void main(String[] args) {
		TestCliente testCliente=new TestCliente();
		// Llamar a testAgregar para agregar un cliente
        System.out.println("Ejecutando testAgregar...");
        testCliente.testAgregar();

        // Llamar a testListar para listar todos los clientes
        System.out.println("\nEjecutando testListar...");
        testCliente.testListar();
	}
}
