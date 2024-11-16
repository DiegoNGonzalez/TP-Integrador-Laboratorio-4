package negocio;

import java.util.ArrayList;

import entidades.Movimiento;

public interface MovimientoNegocio {
	public boolean agregarMovimiento(Movimiento movimiento, int idCuenta);
	public ArrayList<Movimiento> listarTodosLosMovimientos();
	public Movimiento obtenerMovimientoPorID(int idMovimiento);
	public ArrayList<Movimiento> obtenerMovimientosPorCuenta(int idCuenta);
}
