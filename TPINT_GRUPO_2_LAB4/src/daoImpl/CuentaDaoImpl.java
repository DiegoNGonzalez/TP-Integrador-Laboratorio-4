package daoImpl;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dao.CuentaDao;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.TipoCuenta;

public class CuentaDaoImpl implements CuentaDao{

	@Override
	public Cuenta obtenerCuentaPorId(int idCuenta) {
	    String query = "SELECT idTipoCuenta, fechaCreacion, numeroCuenta, cbu, saldo, estadoCuenta FROM cuentas where idCuenta= ?";     
	    Cuenta cuenta = new Cuenta();
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        statement.setInt(1, idCuenta);
	        
	        try (ResultSet resultSet = statement.executeQuery()) {

	            // Si se encuentra la cuenta, se crea el objeto.
	            if (resultSet.next()) {                
		        	TipoCuenta tipoCuenta = new TipoCuentaDaoImpl().obtenerTipoCuentaPorId(resultSet.getInt("idTipoCuenta"));		        		        		        	
		        	cuenta.setIdCuenta(idCuenta);
		            cuenta.setTipoCuenta(tipoCuenta);
		            cuenta.setFechaCreacion(resultSet.getDate("fechaCreacion"));
		            cuenta.setNumeroCuenta(resultSet.getLong("numeroCuenta"));	            
		            cuenta.setCbu(resultSet.getLong("cbu"));
		            cuenta.setSaldo(resultSet.getFloat("saldo"));
		            cuenta.setEstadoCuenta(resultSet.getBoolean("estadoCuenta"));
		            
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
	            cuenta.setCbu(resultSet.getLong("cbu"));
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
	public boolean modificarCuenta(Cuenta cuenta) {
	    String query = "UPDATE cuentas SET idTipoCuenta = ?, saldo = ? WHERE idCuenta = ?";
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        

	        statement.setInt(1, cuenta.getTipoCuenta().getId());
	        statement.setFloat(2, cuenta.getSaldo());
	        statement.setInt(3, cuenta.getIdCuenta());
	        


	        return statement.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	@Override
	public void agregarCuenta(Cuenta cuenta, int idCliente) throws SQLException {
		
		  try
		  {
			 Connection conexion = Conexion.getConnection();
			 CallableStatement cst = conexion.prepareCall("CALL spAgregarCuenta"
			 		+ "(?, ?, ?, ?, ?, ?)");			 
		 			 
			 cst.setInt(1, idCliente);
			 cst.setInt(2, cuenta.getTipoCuenta().getId());
			 cst.setDate(3, new java.sql.Date(cuenta.getFechaCreacion().getTime()));
			 cst.setLong(4, cuenta.getNumeroCuenta());
			 cst.setLong(5, cuenta.getCbu());
			 cst.setFloat(6, cuenta.getSaldo());
			  			 
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
	public boolean bajaCuenta(int idCuenta) {
		String query = "UPDATE cuentas SET estadoCuenta = 0 WHERE idCuenta = ?";
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        statement.setInt(1, idCuenta);
	        return statement.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	@Override
	public long obtenerProximoCBU() {
	    String query = "SELECT MAX(cbu) FROM cuentas";
	    long proximoCBU = 1111111111111111111L;  

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        if (resultSet.next()) {
	            long maxCBU = resultSet.getLong(1);
	            if (!resultSet.wasNull()) {
	                proximoCBU = maxCBU + 1;
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return proximoCBU;
	}
	
	
	@Override
	public long obtenerProximoNumeroCuenta() {
	    String query = "SELECT MAX(numeroCuenta) FROM cuentas"; 
	    long proximoNumeroCuenta = 1111111111111111111L;
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        if (resultSet.next()) {
	            long maxNumeroCuenta = resultSet.getLong(1);
	            
	            if (!resultSet.wasNull()) {
	                proximoNumeroCuenta = maxNumeroCuenta + 1;
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return proximoNumeroCuenta; 
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
                    cuenta.setCbu(resultSet.getLong("cbu"));
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

	
	public void ejecutarSPTransferencia(long cbuDestino, long cbuOrigen, float monto, String concepto) throws SQLException
	{
		  try
		  {
			 Connection conexion = Conexion.getConnection();
			 CallableStatement cst = conexion.prepareCall("CALL spRealizarTransferencia"
			 		+ "(?,?,?,?)");			 
		 			 				 
			 cst.setLong(1, cbuDestino);
			 cst.setLong(2, cbuOrigen);
			 cst.setFloat(3, monto);
			 cst.setString(4, concepto);
			 
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
	public boolean ingresos(int idCuenta, Float montoIngreso) {
	    // Consulta SQL para actualizar el saldo
	    String query = "UPDATE cuentas SET saldo = saldo + ? WHERE idCuenta = ?";

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        statement.setFloat(1, montoIngreso); 
	        statement.setInt(2, idCuenta);
	        return statement.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	@Override
	public ArrayList<Cliente> filtrarCuentas(
	    Date fechaInicio, 
	    Date fechaFin, 
	    Float montoMinimo, 
	    Float montoMaximo
	) {
	    ArrayList<Cliente> clientesFiltrados = new ArrayList<>();
	    String query = "SELECT DISTINCT c.idCliente, c.nombre, c.apellido FROM clientes c " +
	                   "INNER JOIN cuentas cu ON c.idCliente = cu.idcliente " +
	                   "WHERE 1=1 ";

	    ArrayList<Object> parametros = new ArrayList<>();

	    // Filtro por fecha
	    if (fechaInicio != null && fechaFin != null) {
	        query += " AND cu.fechaCreacion BETWEEN ? AND ? ";
	        parametros.add(fechaInicio);
	        parametros.add(fechaFin);
	    }

	    // Filtro por saldo
	    if (montoMinimo != null && montoMaximo != null) {
	        query += " AND cu.saldo BETWEEN ? AND ? ";
	        parametros.add(montoMinimo);
	        parametros.add(montoMaximo);
	    }

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        // Establecer parámetros
	        for (int i = 0; i < parametros.size(); i++) {
	            statement.setObject(i + 1, parametros.get(i));
	        }

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Cliente cliente = new Cliente();
	                cliente.setIdCliente(resultSet.getInt("idCliente"));
	                cliente.setNombre(resultSet.getString("nombre"));
	                cliente.setApellido(resultSet.getString("apellido"));
	                
	                // Obtener cuentas del cliente con los filtros aplicados
	                cliente.setCuentas(obtenerCuentasFiltradas(cliente.getIdCliente(), fechaInicio, fechaFin, montoMinimo, montoMaximo));
	                
	                clientesFiltrados.add(cliente);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return clientesFiltrados;
	}

	private ArrayList<Cuenta> obtenerCuentasFiltradas(
	    int idCliente, 
	    Date fechaInicio, 
	    Date fechaFin, 
	    Float montoMinimo, 
	    Float montoMaximo
	) {
	    ArrayList<Cuenta> cuentasFiltradas = new ArrayList<>();
	    String query = "SELECT * FROM cuentas WHERE idcliente = ? AND estadoCuenta = 1 ";

	    ArrayList<Object> parametros = new ArrayList<>();
	    parametros.add(idCliente);

	    // Filtro por fecha
	    if (fechaInicio != null && fechaFin != null) {
	        query += " AND fechaCreacion BETWEEN ? AND ? ";
	        parametros.add(fechaInicio);
	        parametros.add(fechaFin);
	    }

	    // Filtro por saldo
	    if (montoMinimo != null && montoMaximo != null) {
	        query += " AND saldo BETWEEN ? AND ? ";
	        parametros.add(montoMinimo);
	        parametros.add(montoMaximo);
	    }

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        // Establecer parámetros
	        for (int i = 0; i < parametros.size(); i++) {
	            statement.setObject(i + 1, parametros.get(i));
	        }

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Cuenta cuenta = new Cuenta();
	                cuenta.setIdCuenta(resultSet.getInt("idCuenta"));
	                cuenta.setFechaCreacion(resultSet.getDate("fechaCreacion"));
	                cuenta.setNumeroCuenta(resultSet.getLong("numeroCuenta"));
	                cuenta.setCbu(resultSet.getLong("cbu"));
	                cuenta.setSaldo(resultSet.getFloat("saldo"));
	                
	                TipoCuenta tipoCuenta = new TipoCuentaDaoImpl().obtenerTipoCuentaPorId(resultSet.getInt("idTipoCuenta"));
	                cuenta.setTipoCuenta(tipoCuenta);
	                
	                cuentasFiltradas.add(cuenta);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return cuentasFiltradas;
	}

	@Override
	public ArrayList<String> reporteMovimientosCuentas(Date fechaInicio, Date fechaFin) {
	    ArrayList<String> reporte = new ArrayList<>();
	    
	    ResultSet rs = null;

	    String query = "SELECT " +
	            "YEAR(fechaMovimiento) AS `A�o`, " +
	            "MONTH(fechaMovimiento) AS `Mes`, " +
	            "COUNT(*) AS `Cantidad de movimientos`, " +
	            "SUM(CASE WHEN importeMovimiento > 0 THEN importeMovimiento ELSE 0 END) AS `Saldo Positivo`, " +
	            "SUM(CASE WHEN importeMovimiento < 0 THEN importeMovimiento ELSE 0 END) AS `Saldo Negativo`, " +
	            "SUM(importeMovimiento) AS `Saldo del Mes` " +
	        "FROM movimientos " +
	        "WHERE fechaMovimiento BETWEEN ? AND ? " +
	        "GROUP BY YEAR(fechaMovimiento), MONTH(fechaMovimiento) " +
	        "ORDER BY MONTH(fechaMovimiento) ASC;";

	    try (Connection conexion = Conexion.getConnection();
	             PreparedStatement statement = conexion.prepareStatement(query)){

	        statement.setDate(1, new java.sql.Date(fechaInicio.getTime()));
	        statement.setDate(2, new java.sql.Date(fechaFin.getTime()));
	        rs = statement.executeQuery();

	        while (rs.next()) {
	            int anio = rs.getInt("A�o");
	            int mes = rs.getInt("Mes");
	            int totalMovimientos = rs.getInt("Cantidad de movimientos");
	            double montoPositivo = rs.getDouble("Saldo Positivo");
	            double montoNegativo = rs.getDouble("Saldo Negativo");
	            double montoTotal = rs.getDouble("Saldo del Mes");

	            
	            String saldoPositivo = String.format("%.2f", montoPositivo).replace(',', '.');
	            String saldoNegativo = String.format("%.2f", montoNegativo).replace(',', '.');
	            String saldoMes = String.format("%.2f", montoTotal).replace(',', '.');

	            
	            String lineaReporte = String.format(
	                " %d, %d, %d, $ %s, $ %s, $ %s",
	                anio, mes, totalMovimientos, saldoPositivo, saldoNegativo, saldoMes
	            );

	            reporte.add(lineaReporte);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return reporte;
	}
	
	
	@Override
	public Cuenta obtenerCuentaPorCbu(long cbu) {
	    String query = "SELECT idCuenta, idTipoCuenta, fechaCreacion, numeroCuenta, saldo, estadoCuenta FROM cuentas where cbu = ?";     
	    Cuenta cuenta = new Cuenta();
	    
	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        statement.setLong(1, cbu);
	        
	        try (ResultSet resultSet = statement.executeQuery()) {

	            // Si se encuentra la cuenta, se crea el objeto.
	            if (resultSet.next()) {                
		        	TipoCuenta tipoCuenta = new TipoCuentaDaoImpl().obtenerTipoCuentaPorId(resultSet.getInt("idTipoCuenta"));		        		        		        	
		        	cuenta.setIdCuenta(resultSet.getInt("idCuenta"));
		            cuenta.setTipoCuenta(tipoCuenta);
		            cuenta.setFechaCreacion(resultSet.getDate("fechaCreacion"));
		            cuenta.setNumeroCuenta(resultSet.getLong("numeroCuenta"));	            
		            cuenta.setCbu(cbu);
		            cuenta.setSaldo(resultSet.getFloat("saldo"));
		            cuenta.setEstadoCuenta(resultSet.getBoolean("estadoCuenta"));
		            
	            }
	            else {
	            	cuenta.setIdCuenta(-1);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }	  

	    return cuenta;
	}


}

