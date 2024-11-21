package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Statement;

import dao.ClienteDao;
import dao.CuentaDao;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.Localidad;
import entidades.Nacionalidad;
import entidades.Provincia;
import entidades.Usuario;
import exceptions.ClienteSPException;

public class ClienteDaoImpl implements ClienteDao{

	@Override
	public boolean agregarCliente(Cliente cliente) {
	    String query = "INSERT INTO clientes(idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idLocalidad, idProvincia) "
	                 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        // Asignaci�n de par�metros
	        statement.setInt(1, cliente.getUsuario().getId());
	        statement.setString(2, cliente.getDni());
	        statement.setString(3, cliente.getCuil());
	        statement.setString(4, cliente.getNombre());
	        statement.setString(5, cliente.getApellido());
	        statement.setString(6, cliente.getEmail());
	        statement.setString(7, cliente.getTelefono());
	        statement.setString(8, String.valueOf(cliente.getSexo())); 
	        statement.setInt(9, cliente.getNacionalidad().getId()); 
	        statement.setDate(10, new java.sql.Date(cliente.getFechaNacimiento().getTime()));
	        statement.setString(11, cliente.getDireccion());
	        statement.setInt(12, cliente.getLocalidad().getId()); 
	        statement.setInt(13, cliente.getProvincia().getId()); 

	        // Ejecuta la actualizaci�n y devuelve si al menos una fila fue afectada
	        int filas = statement.executeUpdate();
	        return filas > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public ArrayList<Cliente> listarClientesActivos() {
		String query = "SELECT idUsuario, idCliente , dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad FROM clientes where estado=1";	    ArrayList<Cliente> listaClientes = new ArrayList<>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {
	            Cliente cliente = new Cliente();
	            Usuario usuario= new UsuarioDaoImpl().obtenerUnUsuario(resultSet.getInt("idUsuario"));
	            Nacionalidad nacionalidad = new NacionalidadDaoImpl().obtenerNacionalidadPorId(resultSet.getInt("idNacionalidad"));
	            Localidad localidad = new LocalidadDaoImpl().obtenerLocalidadPorId(resultSet.getInt("idLocalidad"));
	            Provincia provincia = new ProvinciaDaoImpl().obtenerProvinciaPorId(resultSet.getInt("idProvincia"));
	            // Asignar valores del ResultSet al objeto Cliente
	            cliente.setUsuario(usuario); 
	            cliente.setIdCliente(resultSet.getInt("idCliente"));
	            cliente.setDni(resultSet.getString("dni"));
	            cliente.setCuil(resultSet.getString("cuil"));
	            cliente.setNombre(resultSet.getString("nombre"));
	            cliente.setApellido(resultSet.getString("apellido"));
	            cliente.setEmail(resultSet.getString("email"));
	            cliente.setTelefono(resultSet.getString("telefono"));
	            cliente.setSexo(resultSet.getString("sexo").charAt(0));
	            cliente.setNacionalidad(nacionalidad);
	            cliente.setFechaNacimiento(resultSet.getDate("fechaNacimiento"));
	            cliente.setDireccion(resultSet.getString("direccion"));
	            cliente.setProvincia(provincia);
	            cliente.setLocalidad(localidad);

	            // Agregar el cliente a la lista
	            listaClientes.add(cliente);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return listaClientes;
	}

	@Override
	public boolean modificarCliente(Cliente cliente) {
		 String query = "UPDATE clientes SET nombre = ?, apellido = ?, email = ?, telefono = ?, direccion = ? , dni=?, cuil=? WHERE idCliente = ?";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        // Asignaci�n de par�metros para actualizar los datos
	        statement.setString(1, cliente.getNombre());
	        statement.setString(2, cliente.getApellido());
	        statement.setString(3, cliente.getEmail());
	        statement.setString(4, cliente.getTelefono());
	        statement.setString(5, cliente.getDireccion());
	        statement.setString(6, cliente.getDni());
	        statement.setString(7, cliente.getCuil());
	        statement.setInt(8, cliente.getIdCliente());
	        
	        // Ejecuta la actualizaci�n y verifica si fue exitosa
	        return statement.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public boolean bajaCliente(int idCliente)throws SQLException	 {
		String query = "CALL spBajaLogicaCliente(?)";

	    try (Connection conexion = Conexion.getConnection();
	         CallableStatement cst = conexion.prepareCall(query)) {

	        cst.setInt(1, idCliente);
	        cst.execute();
	        return true;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	@Override
	public Cliente obtenerClientePorId(int idCliente) {
	    String query = "SELECT idCliente, idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad "
	                 + "FROM clientes WHERE idCliente = ?";

	    Cliente cliente = null;

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        // Establecer ID de Cliente
	        statement.setInt(1, idCliente);

	        try (ResultSet resultSet = statement.executeQuery()) {
	        	
	            if (resultSet.next()) {
	                cliente = new Cliente();

	                // Obtener el Usuario relacionado al cliente
	                Usuario usuario = new UsuarioDaoImpl().obtenerUnUsuario(resultSet.getInt("idUsuario"));

	                cliente.setUsuario(usuario);
	                cliente.setIdCliente(Integer.parseInt(resultSet.getString("idCliente")));
	                cliente.setDni(resultSet.getString("dni"));
	                cliente.setCuil(resultSet.getString("cuil"));
	                cliente.setNombre(resultSet.getString("nombre"));
	                cliente.setApellido(resultSet.getString("apellido"));
	                cliente.setEmail(resultSet.getString("email"));
	                cliente.setTelefono(resultSet.getString("telefono"));
	                cliente.setSexo(resultSet.getString("sexo").charAt(0)); // Convertir a 'M' o 'F'
	                cliente.setFechaNacimiento(resultSet.getDate("fechaNacimiento"));
	                cliente.setDireccion(resultSet.getString("direccion"));

	                NacionalidadDaoImpl nacionalidadDao = new NacionalidadDaoImpl();
	                LocalidadDaoImpl localidadDao = new LocalidadDaoImpl();
	                ProvinciaDaoImpl provinciaDao = new ProvinciaDaoImpl();

	                Nacionalidad nacionalidad = nacionalidadDao.obtenerNacionalidadPorId(resultSet.getInt("idNacionalidad"));
	                Localidad localidad = localidadDao.obtenerLocalidadPorId(resultSet.getInt("idLocalidad"));
	                Provincia provincia = provinciaDao.obtenerProvinciaPorId(resultSet.getInt("idProvincia"));

	                cliente.setNacionalidad(nacionalidad);
	                cliente.setLocalidad(localidad);
	                cliente.setProvincia(provincia);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return cliente;
	}
			

	public void ejecutarSPCrearUsuario(Usuario usuario, Cliente cliente) throws SQLException
	{
		  try
		  {
			 Connection conexion = Conexion.getConnection();
			 CallableStatement cst = conexion.prepareCall("CALL spAgregarCliente"
			 		+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");			 
		 			 
			 cst.setString(1, cliente.getDni());
			 cst.setString(2, cliente.getCuil());
			 cst.setString(3, cliente.getNombre());
			 cst.setString(4, cliente.getApellido());
			 cst.setString(5, cliente.getEmail());
			 cst.setString(6, cliente.getTelefono());
			 cst.setString(7, String.valueOf(cliente.getSexo())); 
			 cst.setInt(8, cliente.getNacionalidad().getId());
			 cst.setDate(9, new java.sql.Date(cliente.getFechaNacimiento().getTime()));	
			 cst.setString(10, cliente.getDireccion());
			 cst.setInt(11, cliente.getProvincia().getId());
			 cst.setInt(12, cliente.getLocalidad().getId());
			 cst.setString(13, usuario.getNombreUsuario());
			 cst.setString(14, usuario.getPassword());
			 //cst.setInt(15, usuario.getTipoUsuario().getId());
			 cst.setInt(15, 2);
			  			 
			 cst.execute();
			 conexion.close();
		  }
		  catch (SQLException e) {
			  e.printStackTrace();	
			  //ClienteSPException exc1 = new ClienteSPException();
			  throw e;
		  }
		  finally {
			  
		  }			
	}

	@Override
	public ArrayList<Cliente> obtenerTodos() {
        ArrayList<Cliente> listaClientes = new ArrayList<>();
        String query = "SELECT idCliente, nombre, apellido FROM clientes";
        CuentaDao cuentaDao = new CuentaDaoImpl();
        
        try (Connection conexion = Conexion.getConnection();
             PreparedStatement statement = conexion.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdCliente(resultSet.getInt("idCliente"));
                cliente.setNombre(resultSet.getString("nombre"));
                cliente.setApellido(resultSet.getString("apellido"));

                // obtenemos las cuentas asociadas a este cliente
                ArrayList<Cuenta> cuentas = cuentaDao.obtenerCuentasPorCliente(cliente.getIdCliente());
                cliente.setCuentas(cuentas);  // asignamos las cuentas al cliente

                listaClientes.add(cliente);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaClientes;
    }

	@Override
	public Cliente obtenerClientePorIdUsuario(int idUsuario) {
		String query = "SELECT idCliente, idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad "
                + "FROM clientes WHERE idUsuario = ? and estado = 1";

   Cliente cliente = null;

   try (Connection conexion = Conexion.getConnection();
        PreparedStatement statement = conexion.prepareStatement(query)) {

       statement.setInt(1, idUsuario);

       try (ResultSet resultSet = statement.executeQuery()) {
       	
           if (resultSet.next()) {
               cliente = new Cliente();

               CuentaDaoImpl negocioCuenta = new CuentaDaoImpl();
               // Obtener el Usuario relacionado al cliente
               Usuario usuario = new UsuarioDaoImpl().obtenerUnUsuario(resultSet.getInt("idUsuario"));

               cliente.setUsuario(usuario);
               cliente.setIdCliente(Integer.parseInt(resultSet.getString("idCliente")));
               cliente.setDni(resultSet.getString("dni"));
               cliente.setCuil(resultSet.getString("cuil"));
               cliente.setNombre(resultSet.getString("nombre"));
               cliente.setApellido(resultSet.getString("apellido"));
               cliente.setEmail(resultSet.getString("email"));
               cliente.setTelefono(resultSet.getString("telefono"));
               cliente.setSexo(resultSet.getString("sexo").charAt(0)); // Convertir a 'M' o 'F'
               cliente.setFechaNacimiento(resultSet.getDate("fechaNacimiento"));
               cliente.setDireccion(resultSet.getString("direccion"));
               cliente.setCuentas(negocioCuenta.obtenerCuentasPorCliente(Integer.parseInt(resultSet.getString("idCliente"))));

               NacionalidadDaoImpl nacionalidadDao = new NacionalidadDaoImpl();
               LocalidadDaoImpl localidadDao = new LocalidadDaoImpl();
               ProvinciaDaoImpl provinciaDao = new ProvinciaDaoImpl();

               Nacionalidad nacionalidad = nacionalidadDao.obtenerNacionalidadPorId(resultSet.getInt("idNacionalidad"));
               Localidad localidad = localidadDao.obtenerLocalidadPorId(resultSet.getInt("idLocalidad"));
               Provincia provincia = provinciaDao.obtenerProvinciaPorId(resultSet.getInt("idProvincia"));

               cliente.setNacionalidad(nacionalidad);
               cliente.setLocalidad(localidad);
               cliente.setProvincia(provincia);
           }
       }
   } catch (Exception e) {
       e.printStackTrace();
   }

   return cliente;
	}

	@Override
	public ArrayList<String> recuperarContrasenia(String dni, String email, String pregunta, long respuesta) {
		String query="select u.idUsuario, u.nombreUsuario from usuarios u inner join clientes c on u.idUsuario= c.idUsuario inner join cuentas cta on c.idCliente=cta.idcliente where dni=? and c.email=? and "+ (pregunta.equals("cbu")?"cta.cbu=?":"cta.numeroCuenta=")+";";
		String nombreUsuario;
		String contrasenia="recuperar123";
		int idUsuario;
		boolean recuperar=false;
		ArrayList<String> datos=null;
		try (Connection conexion = Conexion.getConnection();
		        PreparedStatement statement = conexion.prepareStatement(query)) {
			statement.setString(1, dni);
			statement.setString(2, email);
			statement.setLong(3, respuesta);
			
			try(ResultSet resultSet=statement.executeQuery()) {
				if(resultSet.next()) {
					nombreUsuario=resultSet.getNString("nombreUsuario");
					idUsuario=resultSet.getInt("idUsuario");
					recuperar=actualizarContrasenia(idUsuario, contrasenia);
					if(recuperar) {
						datos= new ArrayList<String>();
						datos.add(nombreUsuario);
						datos.add(contrasenia);
					}
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return datos;
		
	}

	@Override
	public boolean actualizarContrasenia(int idUsuario,String contrasenia) {
		boolean actualizada=false;
		String query="update usuarios set contrasenia=? where idUsuario=?";
		
		try (Connection conexion = Conexion.getConnection();
		        PreparedStatement statement = conexion.prepareStatement(query)){
			statement.setString(1, contrasenia);
			statement.setInt(2, idUsuario);
			
			int filasAfectadas=statement.executeUpdate();
			if (filasAfectadas > 0) {
                actualizada = true;  // Contrase�a actualizada correctamente
            }

			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return actualizada;
	}

}
