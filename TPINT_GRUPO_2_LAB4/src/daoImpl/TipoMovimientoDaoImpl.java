package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.TipoMovimientoDao;
import entidades.TipoMovimiento;

public class TipoMovimientoDaoImpl implements TipoMovimientoDao{

	@Override
	public TipoMovimiento obtenerTipoPorID(int idTipoMovimiento) {
		String query="Select idTipoMovimiento, tipoMovimiento from tiposMovimientos where idTipoMovimiento= ?";
		TipoMovimiento tipoMovimiento=null;
		try (Connection conexion = Conexion.getConnection();
		         PreparedStatement statement = conexion.prepareStatement(query)) {
		        
		        statement.setInt(1, idTipoMovimiento);
		        try(ResultSet resultSet= statement.executeQuery()) {
		        	if(resultSet.next()) {
		        		tipoMovimiento=new TipoMovimiento();
		        		tipoMovimiento.setIdMovimiento(resultSet.getInt("idTipoMovimiento"));
		        		tipoMovimiento.setTipoMovimiento(resultSet.getString("tipoMovimiento"));
		        		
		        	}
				
				}
		 }catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return tipoMovimiento;
	}

}
