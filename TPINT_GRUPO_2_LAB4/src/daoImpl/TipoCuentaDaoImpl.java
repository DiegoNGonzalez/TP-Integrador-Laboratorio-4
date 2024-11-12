package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.TipoCuentaDao;
import entidades.TipoCuenta;

public class TipoCuentaDaoImpl implements TipoCuentaDao {
	
	@Override
	public ArrayList<TipoCuenta> listarTipoCuenta(){
	    String query = "SELECT idTipoCuenta, tipoCuenta FROM cuentas";
		ArrayList<TipoCuenta> listaTipos = new ArrayList<>();	
		
	    try (Connection conexion = Conexion.getConnection();
		         PreparedStatement statement = conexion.prepareStatement(query);
		         ResultSet resultSet = statement.executeQuery()) {

		        while (resultSet.next()) {
		        	TipoCuenta tipoCuenta = new TipoCuenta();
		            
		        	tipoCuenta.setId(resultSet.getInt("idTipoCuenta"));
		        	tipoCuenta.setTipo(resultSet.getString("tipoCuenta"));
		        	listaTipos.add(tipoCuenta);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
	    
		return listaTipos;
	}
	
	@Override
	public TipoCuenta obtenerTipoCuentaPorId(int id) {
	    String query = "SELECT idTipoCuenta, tipoCuenta FROM cuentas WHERE idTipoCuenta = ?";
	    TipoCuenta tipoCuenta = null;

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {

	        statement.setInt(1, id);

	        try (ResultSet resultSet = statement.executeQuery()) {
	            if (resultSet.next()) {
	            	tipoCuenta = new TipoCuenta();
	            	tipoCuenta.setId(resultSet.getInt("idTipoCuenta"));
	            	tipoCuenta.setTipo(resultSet.getString("tipoCuenta"));
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return tipoCuenta;
	}
}
