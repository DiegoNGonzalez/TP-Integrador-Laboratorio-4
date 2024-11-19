package daoImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.PrestamoDao;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.Prestamo;

public class PrestamoDaoImpl implements PrestamoDao{

	@Override
	public ArrayList<Prestamo> listarPrestamos() {
	    String query = "SELECT idPrestamo, idCliente, idCuenta, fechaAltaPrestamo, importePrestamo, mesesPlazo, importeCuota, cantidadCuotas, EstadoPrestamo FROM prestamos WHERE EstadoPrestamo = 1";
	    ArrayList<Prestamo> listaPrestamos = new ArrayList<>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {
	            Prestamo prestamo = new Prestamo();
	            Cliente cliente = new ClienteDaoImpl().obtenerClientePorId(resultSet.getInt("idCliente"));
	            Cuenta cuenta = new CuentaDaoImpl().obtenerCuentaPorId(resultSet.getInt("idCuenta"));

	            prestamo.setIdPrestamo(resultSet.getInt("idPrestamo"));
	            prestamo.setCliente(cliente);
	            prestamo.setCuenta(cuenta);
	            prestamo.setFechaAltaPrestamo(resultSet.getDate("fechaAltaPrestamo"));
	            prestamo.setImporteTotal(resultSet.getFloat("importePrestamo"));
	            prestamo.setPlazo(resultSet.getInt("mesesPlazo"));
	            prestamo.setImporteCuota(resultSet.getFloat("importeCuota"));
	            prestamo.setCantCuotas(resultSet.getInt("cantidadCuotas"));
	            prestamo.setEstado(resultSet.getString("EstadoPrestamo"));

	            listaPrestamos.add(prestamo);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return listaPrestamos;
	}

	@Override
	public ArrayList<Prestamo> listarPrestamosXEstado(String estado) {
	    String query = "SELECT idPrestamo, idCliente, idCuenta, fechaAltaPrestamo, importePrestamo, mesesPlazo, importeCuota, cantidadCuotas, EstadoPrestamo FROM prestamos WHERE EstadoPrestamo = ?";
	    ArrayList<Prestamo> listaPrestamos = new ArrayList<>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        statement.setString(1, estado);
	        
	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Prestamo prestamo = new Prestamo();
	                
	                Cliente cliente = new ClienteDaoImpl().obtenerClientePorId(resultSet.getInt("idCliente"));
	                Cuenta cuenta = new CuentaDaoImpl().obtenerCuentaPorId(resultSet.getInt("idCuenta"));

	                prestamo.setIdPrestamo(resultSet.getInt("idPrestamo"));
	                prestamo.setCliente(cliente);
	                prestamo.setCuenta(cuenta);
	                prestamo.setFechaAltaPrestamo(resultSet.getDate("fechaAltaPrestamo"));  // Usar getTimestamp si necesitamos la hora
	                prestamo.setImporteTotal(resultSet.getFloat("importePrestamo"));
	                prestamo.setPlazo(resultSet.getInt("mesesPlazo"));
	                prestamo.setImporteCuota(resultSet.getFloat("importeCuota"));
	                prestamo.setCantCuotas(resultSet.getInt("cantidadCuotas"));
	                prestamo.setEstado(resultSet.getString("EstadoPrestamo"));

	                listaPrestamos.add(prestamo);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return listaPrestamos;
	}


    public ArrayList<Prestamo> listarPrestamosPendientes() {
        return listarPrestamosXEstado("Pendiente");
    }


    public ArrayList<Prestamo> listarPrestamosAprobados() {
        return listarPrestamosXEstado("Activo");
    }


    public ArrayList<Prestamo> listarPrestamosRechazados() {
        return listarPrestamosXEstado("Rechazado");
    }
	
	@Override
	public boolean agregarPrestamo(Prestamo prestamo) {
	    String query = "INSERT INTO prestamos(idCliente, idCuenta, fechaAltaPrestamo, importePrestamo, mesesPlazo, importeCuota, cantidadCuotas, EstadoPrestamo) "
	                 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        statement.setInt(1, prestamo.getCliente().getIdCliente());
	        statement.setInt(2, prestamo.getCuenta().getIdCuenta());
	        statement.setDate(3, new java.sql.Date(prestamo.getFechaAltaPrestamo().getTime()));
	        statement.setFloat(4, prestamo.getImporteTotal());
	        statement.setInt(5, prestamo.getPlazo());
	        statement.setFloat(6, prestamo.getImporteCuota());
	        statement.setInt(7, prestamo.getCantCuotas());
	        statement.setString(8, prestamo.getEstado());

	        int filas = statement.executeUpdate();
	        return filas > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	@Override
	public boolean bajarPrestamo(int idPrestamo) {
	    String query = "UPDATE prestamos SET EstadoPrestamo = 'Rechazado' WHERE idPrestamo = ?";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        statement.setInt(1, idPrestamo);
	        
	        return statement.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	@Override
	public Prestamo prestamoXId(int idPrestamo) {
	    String query = "SELECT idPrestamo, idCliente, idCuenta, fechaAltaPrestamo, importePrestamo, mesesPlazo, importeCuota, cantidadCuotas, EstadoPrestamo "
	                 + "FROM prestamos WHERE idPrestamo = ?";
	    
	    Prestamo prestamo = null;
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        statement.setInt(1, idPrestamo);
	        
	        try (ResultSet resultSet = statement.executeQuery()) {
	            if (resultSet.next()) {
	                prestamo = new Prestamo();
	                
	                Cliente cliente = new ClienteDaoImpl().obtenerClientePorId(resultSet.getInt("idCliente"));
	                Cuenta cuenta = new CuentaDaoImpl().obtenerCuentaPorId(resultSet.getInt("idCuenta"));

	                prestamo.setIdPrestamo(resultSet.getInt("idPrestamo"));
	                prestamo.setCliente(cliente);
	                prestamo.setCuenta(cuenta);
	                prestamo.setFechaAltaPrestamo(resultSet.getDate("fechaAltaPrestamo"));
	                prestamo.setImporteTotal(resultSet.getFloat("importePrestamo"));
	                prestamo.setPlazo(resultSet.getInt("mesesPlazo"));
	                prestamo.setImporteCuota(resultSet.getFloat("importeCuota"));
	                prestamo.setCantCuotas(resultSet.getInt("cantidadCuotas"));
	                prestamo.setEstado(resultSet.getString("EstadoPrestamo"));
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return prestamo;
	}


	@Override
	public ArrayList<Prestamo> listarPrestamosXCliente(int idCliente) {
	    String query = "SELECT idPrestamo, idCliente, idCuenta, fechaAltaPrestamo, importePrestamo, mesesPlazo, importeCuota, cantidadCuotas, EstadoPrestamo " +
	                   "FROM prestamos WHERE idCliente = ?";
	    ArrayList<Prestamo> listaPrestamos = new ArrayList<Prestamo>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        statement.setInt(1, idCliente);
	        
	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Prestamo prestamo = new Prestamo();
	                Cliente cliente = new ClienteDaoImpl().obtenerClientePorId(resultSet.getInt("idCliente"));
	                Cuenta cuenta = new CuentaDaoImpl().obtenerCuentaPorId(resultSet.getInt("idCuenta"));

	                prestamo.setIdPrestamo(resultSet.getInt("idPrestamo"));
	                prestamo.setCliente(cliente);
	                prestamo.setCuenta(cuenta);
	                prestamo.setFechaAltaPrestamo(resultSet.getDate("fechaAltaPrestamo"));
	                prestamo.setImporteTotal(resultSet.getFloat("importePrestamo"));
	                prestamo.setPlazo(resultSet.getInt("mesesPlazo"));
	                prestamo.setImporteCuota(resultSet.getFloat("importeCuota"));
	                prestamo.setCantCuotas(resultSet.getInt("cantidadCuotas"));
	                prestamo.setEstado(resultSet.getString("EstadoPrestamo"));

	                listaPrestamos.add(prestamo);
	            }
	        }
	    } catch (SQLException e) {
	        System.err.println("Error de SQL: " + e.getMessage());
	        e.printStackTrace(); // Proporciona m�s detalles sobre el error
	    } catch (Exception e) {
	        System.err.println("Error inesperado: " + e.getMessage());
	        e.printStackTrace(); // Maneja otros tipos de errores
	    }

	    return listaPrestamos;
	}

	@Override
	public boolean darDeAltaPrestamo(Prestamo prestamo) {
	    String query = "UPDATE prestamos SET EstadoPrestamo = ? WHERE idPrestamo = ?";
	    try (Connection conexion = Conexion.getConnection();
		         PreparedStatement statement = conexion.prepareStatement(query)) {
	    	statement.setString(1, prestamo.getEstado());
	    	statement.setInt(2, prestamo.getIdPrestamo());
	        return statement.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	@Override
	public void SP_AprobarPrestamo(Prestamo prestamo) throws SQLException {
		try {
			Connection conexion = Conexion.getConnection();
			CallableStatement cst = conexion.prepareCall("CALL spAprobarPrestamo"
			 		+ "(?,?,?,?,?)");			 
		 			 				 
			 cst.setInt(1, prestamo.getCuenta().getIdCuenta());
			 cst.setInt(2, prestamo.getIdPrestamo());
			 cst.setFloat(3, prestamo.getImporteTotal());
			 cst.setFloat(4,prestamo.getImporteCuota());
			 cst.setInt(5, prestamo.getCantCuotas());
			 
			 cst.execute();
			 conexion.close();
		  }
		  catch (SQLException e) {
			  e.printStackTrace();
			  throw e;
		  }
		  finally {			  
		  }
	}
	
	@Override
	public int ultimoID() {
		String query = "SELECT MAX(id_prestamo) AS ultimo_id FROM prestamos";
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        if (resultSet.next()) {
	            return resultSet.getInt("ultimo_id");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return -1; // Retornar -1 si no se encuentra un ID valido.
	}



}
