package daoImpl;

import java.util.Date;

import entidades.Cliente;
import entidades.TipoUsuario;
import entidades.Usuario;

public class TestAgregarCliente {
    public static void main(String[] args) {
        // Crear el cliente con datos de ejemplo
    	TipoUsuario tipoUsuario= new TipoUsuario(1, "cliente");
        Cliente cliente = new Cliente();
        Usuario usuario = new Usuario(1,"juan","1234",true,tipoUsuario);
        
        // Configurar los valores del cliente (aquí reemplaza con datos de ejemplo)
        cliente.setUsuario(usuario); // Suponiendo que Usuario tiene un constructor que acepta un ID
        cliente.setDni("12345678");
        cliente.setCuil("20-12345678-3");
        cliente.setNombre("Juan");
        cliente.setApellido("Pérez");
        cliente.setEmail("juan.perez@example.com");
        cliente.setTelefono("123456789");
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
}