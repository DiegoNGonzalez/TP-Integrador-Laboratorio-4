package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import dao.MovimientoDao;
import entidades.Movimiento;
import entidades.TipoMovimiento;

public class MovimientoDaoImpl implements MovimientoDao {

	@Override
	public boolean agregarMovimiento(Movimiento movimiento, int idCuenta) {
		String query = "insert into movimientos(idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) values(?,?,?,?,?)";
		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query)) {

			statement.setInt(1, idCuenta);
			statement.setInt(2, movimiento.getTipoMovimiento().getIdMovimiento());
			statement.setDate(3, new java.sql.Date(movimiento.getFechaMovimiento().getTime()));
			statement.setString(4, movimiento.getConcepto());
			statement.setFloat(5, movimiento.getImporteMovimiento());

			int filas = statement.executeUpdate();
			return filas > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ArrayList<Movimiento> listarTodosLosMovimientos() {

		String query = "select idMovimiento, idTipoMovimiento, fechaMovimiento,concepto,importeMovimiento from movimientos";
		ArrayList<Movimiento> listaMovimientos = null;
		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query);
				ResultSet resultSet = statement.executeQuery()) {
			listaMovimientos = new ArrayList<Movimiento>();
			while (resultSet.next()) {
				Movimiento movimiento = new Movimiento();
				TipoMovimiento tipoMovimiento = new TipoMovimientoDaoImpl()
						.obtenerTipoPorID(resultSet.getInt("idTipoMovimiento"));

				movimiento.setIdMovimiento(resultSet.getInt("idMovimiento"));
				movimiento.setTipoMovimiento(tipoMovimiento);
				movimiento.setFechaMovimiento(resultSet.getDate("fechaMovimiento"));
				movimiento.setConcepto(resultSet.getString("concepto"));
				movimiento.setImporteMovimiento(resultSet.getFloat("importeMovimiento"));

				listaMovimientos.add(movimiento);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listaMovimientos;
	}

	@Override
	public Movimiento obtenerMovimientoPorID(int idMovimiento) {
		String query = "select idMovimiento, idTipoMovimiento, fechaMovimiento,concepto,importeMovimiento from movimientos where idMovimiento= ?";
		Movimiento movimiento = null;

		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query)) {

			statement.setInt(1, idMovimiento);
			try (ResultSet resultSet = statement.executeQuery()) {

				if (resultSet.next()) {
					movimiento = new Movimiento();

					TipoMovimiento tipoMovimiento = new TipoMovimientoDaoImpl()
							.obtenerTipoPorID(resultSet.getInt("idTipoMovimiento"));
					movimiento.setTipoMovimiento(tipoMovimiento);
					movimiento.setFechaMovimiento(resultSet.getDate("fechaMovimiento"));
					movimiento.setConcepto(resultSet.getString("concepto"));
					movimiento.setImporteMovimiento(resultSet.getFloat("importeMovimiento"));

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return movimiento;
	}

	@Override
	public ArrayList<Movimiento> obtenerMovimientosPorCuenta(int idCuenta) {
		String query = "select idMovimiento, idTipoMovimiento, fechaMovimiento,concepto,importeMovimiento from movimientos where idCuenta=?";
		ArrayList<Movimiento> listaMovimientos = null;
		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query);) {
			listaMovimientos = new ArrayList<Movimiento>();
			statement.setInt(1, idCuenta);
			try (ResultSet resultSet = statement.executeQuery()) {

				while (resultSet.next()) {
					Movimiento movimiento = new Movimiento();
					TipoMovimiento tipoMovimiento = new TipoMovimientoDaoImpl()
							.obtenerTipoPorID(resultSet.getInt("idTipoMovimiento"));

					movimiento.setIdMovimiento(resultSet.getInt("idMovimiento"));
					movimiento.setTipoMovimiento(tipoMovimiento);
					movimiento.setFechaMovimiento(resultSet.getDate("fechaMovimiento"));
					movimiento.setConcepto(resultSet.getString("concepto"));
					movimiento.setImporteMovimiento(resultSet.getFloat("importeMovimiento"));

					listaMovimientos.add(movimiento);

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listaMovimientos;
	}

}
