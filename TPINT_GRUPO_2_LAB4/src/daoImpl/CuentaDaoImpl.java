package daoImpl;

import java.sql.Connection;
import java.util.ArrayList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.CuentaDao;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.TipoCuenta;

public class CuentaDaoImpl implements CuentaDao{

	@Override
	public Cuenta obtenerCuentaPorId(int idCuenta) {
	    String query = "SELECT idCuenta, idTipoCuenta, fechaCreacion, numeroCuenta, cbu, saldo, "
	    		+ "estadoCuenta FROM cuentas where idCuenta= ?"; 
	    
	    Cuenta cuenta = null;
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        statement.setInt(1, idCuenta);
	        
	        try (ResultSet resultSet = statement.executeQuery()) {
	            // Si se encuentra la cuenta, se crea el objeto.
	            if (resultSet.next()) {
	                cuenta = new Cuenta();
	                
		        	TipoCuenta tipoCuenta= new TipoCuentaDaoImpl().obtenerTipoCuentaPorId(resultSet.getInt("idTipoCuenta"));
		        		        		        	
		        	cuenta.setIdCuenta(resultSet.getInt("idCuenta"));
		            cuenta.setTipoCuenta(tipoCuenta);
		            cuenta.setFechaCreacion(resultSet.getDate("fechaCreacion"));
		            cuenta.setNumeroCuenta(resultSet.getLong("numeroCuenta"));	            
		            cuenta.setCbu(resultSet.getString("cbu"));
		            cuenta.setSaldo(resultSet.getFloat("saldo"));
		            cuenta.setEstadoCuenta(resultSet.getBoolean("estado"));
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }	    
	    return cuenta;
	}

	@Override
	public ArrayList<Cuenta> listarCuentas() {
	    String query = "SELECT idCuenta, idTipoCuenta, fechaCreacion, numeroCuenta, cbu, saldo, estadoCuenta FROM cuentas where estado=1";
	    ArrayList<Cuenta> listaCuentas = new ArrayList<>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {
	        	Cuenta cuenta = new Cuenta();
	        	
	        	TipoCuenta tipoCuenta= new TipoCuentaDaoImpl().obtenerTipoCuentaPorId(resultSet.getInt("idTipoCuenta"));
	        		        		        	
	        	cuenta.setIdCuenta(resultSet.getInt("idCuenta"));
	            cuenta.setTipoCuenta(tipoCuenta);
	            cuenta.setFechaCreacion(resultSet.getDate("fechaCreacion"));
	            cuenta.setNumeroCuenta(resultSet.getLong("numeroCuenta"));	            
	            cuenta.setCbu(resultSet.getString("cbu"));
	            cuenta.setSaldo(resultSet.getFloat("saldo"));
	            cuenta.setEstadoCuenta(resultSet.getBoolean("estado"));
	      
	            listaCuentas.add(cuenta);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return listaCuentas;
	}

	@Override
	public boolean modificarCuenta(Cuenta cuenta, int idCliente) {
	    String query = "UPDATE cuentas SET idcliente = ?, idTipoCuenta = ?, numeroCuenta = ?,"
	    		+ " cbu = ?, saldo = ? WHERE idCuenta = ?";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        // Asignación de parámetros para actualizar los datos
	        statement.setInt(1, idCliente);
	        statement.setInt(2, cuenta.getTipoCuenta().getId());
	        statement.setLong(3, cuenta.getNumeroCuenta());
	        statement.setString(4, cuenta.getCbu());
	        statement.setFloat(5, cuenta.getSaldo());
	        
	        // Ejecuta la actualización y verifica si fue exitosa
	        return statement.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public boolean agregarCuenta(Cuenta cuenta, int idCliente) {
	    String query = "INSERT INTO cuentas(idCuenta, idcliente, idTipoCuenta, fechaCreacion, numeroCuenta, cbu, saldo, estadoCuenta) "
	                 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        // Asignación de parámetros
	        statement.setInt(1, cuenta.getIdCuenta());
	        statement.setInt(2, idCliente);
	        statement.setInt(3, cuenta.getTipoCuenta().getId());
	        statement.setDate(4,new java.sql.Date(cuenta.getFechaCreacion().getTime())); 
	        statement.setLong(5, cuenta.getNumeroCuenta());
	        statement.setString(6, cuenta.getCbu());
	        statement.setFloat(7, cuenta.getSaldo()); 
	        statement.setBoolean(12, cuenta.getEstadoCuenta());

	        // Ejecuta la actualización y devuelve si al menos una fila fue afectada
	        int filas = statement.executeUpdate();
	        return filas > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	@Override
	public boolean bajaCuenta(int idCuenta) {
		String query = "UPDATE cuentas SET estadoCuenta = 0 WHERE idCuenta = ?";
		System.out.println("cccccccccc111111111");
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        statement.setInt(1, idCuenta);
	        System.out.println("ccccccc333333333");
	        return statement.executeUpdate() > 0;
	    } catch (Exception e) {
	    	System.out.println("cccccccc444444444");
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	public ArrayList<Cuenta> obtenerCuentasPorCliente(int idCliente) {
        ArrayList<Cuenta> listaCuentas = new ArrayList<>();
        String query = "SELECT idCuenta, idTipoCuenta, fechaCreacion, numeroCuenta, cbu, saldo, estadoCuenta "
                     + "FROM cuentas WHERE idcliente = ? AND estadoCuenta = 1"; 

        try (Connection conexion = Conexion.getConnection();
             PreparedStatement statement = conexion.prepareStatement(query)) {
            
            statement.setInt(1, idCliente);
            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    Cuenta cuenta = new Cuenta();
                    cuenta.setIdCuenta(resultSet.getInt("idCuenta"));
                    cuenta.setFechaCreacion(resultSet.getDate("fechaCreacion"));
                    cuenta.setNumeroCuenta(resultSet.getLong("numeroCuenta"));
                    cuenta.setCbu(resultSet.getString("cbu"));
                    cuenta.setSaldo(resultSet.getFloat("saldo"));
                    cuenta.setEstadoCuenta(resultSet.getBoolean("estadoCuenta"));
                    
                    
                    TipoCuenta tipoCuenta = new TipoCuentaDaoImpl().obtenerTipoCuentaPorId(resultSet.getInt("idTipoCuenta"));
                    
                    cuenta.setTipoCuenta(tipoCuenta);
                    
                    listaCuentas.add(cuenta);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCuentas;
    }
}

