package negocio;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

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
	public void SP_AprobarPrestamo(Prestamo prestamo) throws SQLException;
	public int ultimoID();
	public boolean finalizarPrestamo(int idPrestamo);
	
	ArrayList<Prestamo> filtrarPrestamos(Date fechaInicio, Date fechaFin, Float montoMinimo, Float montoMaximo, int idCliente);
	public ArrayList<String> generarReportePrestamos(Date fechaInicio, Date fechaFin);	
}
