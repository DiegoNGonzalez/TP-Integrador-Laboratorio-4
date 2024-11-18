package negocioImpl;

import java.util.ArrayList;

import dao.MovimientoDao;
import daoImpl.MovimientoDaoImpl;
import entidades.Movimiento;
import negocio.MovimientoNegocio;

public class MovimientoNegocioImpl implements MovimientoNegocio {

	private MovimientoDao movimientoDao;

	public MovimientoNegocioImpl() {
		this.movimientoDao = new MovimientoDaoImpl();
	}

	@Override
	public boolean agregarMovimiento(Movimiento movimiento, int idCuenta) {
		if (movimiento == null || idCuenta <= 0) {
			System.out.println("El movimiento es nulo o el id de cuenta es invalido");
			return false;
		}
		try {
			boolean resultado = movimientoDao.agregarMovimiento(movimiento, idCuenta);
			return resultado;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ArrayList<Movimiento> listarTodosLosMovimientos() {
		ArrayList<Movimiento> movimientos = movimientoDao.listarTodosLosMovimientos();

		if (movimientos == null || movimientos.isEmpty()) {
			System.out.println("No hay movimientos .");
			return new ArrayList<>();
		}
		return movimientos;
	}

	@Override
	public Movimiento obtenerMovimientoPorID(int idMovimiento) {
		if (idMovimiento <= 0) {
			System.out.println("El id de movimiento es invalido");
			return null;
		}
		return movimientoDao.obtenerMovimientoPorID(idMovimiento);
	}

	@Override
	public ArrayList<Movimiento> obtenerMovimientosPorCuenta(int idCuenta) {
		if(idCuenta<=0) {
			System.out.println("El id de cuenta es invalido");
			return null;
		}
		ArrayList<Movimiento> movimientos = movimientoDao.obtenerMovimientosPorCuenta(idCuenta);

		/*if (movimientos == null || movimientos.isEmpty()) {
			System.out.println("No hay movimientos .");
			return null;
		}*/
		return movimientos;
	}

}
