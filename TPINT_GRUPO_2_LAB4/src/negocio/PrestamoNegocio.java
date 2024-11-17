package negocio;

import java.util.ArrayList;

import entidades.Prestamo;

public interface PrestamoNegocio {

	public ArrayList<Prestamo> listarPrestamos();
	public boolean agregarPrestamo(Prestamo prestamo);
	public ArrayList<Prestamo> listarPrestamosXCliente(int idCliente);
	public boolean bajarPrestamo(int id);
	public Prestamo prestamoXId(int id);
	public ArrayList<Prestamo> listarPrestamosXEstado(String estado);
	public ArrayList<Prestamo> listarPrestamosPendientes();
	public ArrayList<Prestamo> listarPrestamosAprobados();
	public ArrayList<Prestamo> listarPrestamosRechazados();
}
