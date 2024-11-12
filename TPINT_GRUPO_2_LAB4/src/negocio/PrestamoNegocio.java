package negocio;

import java.util.ArrayList;

import entidades.Prestamo;

public interface PrestamoNegocio {

	public ArrayList<Prestamo> listarPrestamos();
	public boolean agregarPrestamo(Prestamo prestamo);
	public boolean bajarPrestamo(int id);
	public Prestamo prestamoXId(int id);
}
