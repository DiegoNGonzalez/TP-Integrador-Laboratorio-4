package dao;

import java.util.ArrayList;

import entidades.Movimiento;

public interface MovimientoDao {

	public boolean agregarMovimiento(Movimiento movimiento, int idCuenta);
	public ArrayList<Movimiento> listarTodosLosMovimientos();
	public Movimiento obtenerMovimientoPorID(int idMovimiento);
	public ArrayList<Movimiento> obtenerMovimientosPorCuenta(int idCuenta);
}
