package dao;

import java.util.ArrayList;

import entidades.Prestamo;

public interface PrestamoDao {

	public ArrayList<Prestamo> listarPrestamos();
	public ArrayList<Prestamo> listarPrestamosXCliente(int idCliente);
	public boolean agregarPrestamo(Prestamo prestamo);
	public boolean bajarPrestamo(int id);
	public Prestamo prestamoXId(int id);
}
