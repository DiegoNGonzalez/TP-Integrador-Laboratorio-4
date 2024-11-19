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
	public boolean darDeAltaPrestamo(Prestamo prestamo);
	public int ultimoID();
	public ArrayList<Prestamo> listarPrestamosXClienteEstado(int idCliente,String estado);
}
