package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Cliente;
import entidades.Prestamo;

public interface PrestamoDao {

	public ArrayList<Prestamo> listarPrestamos();
	public ArrayList<Prestamo> listarPrestamosXCliente(int idCliente);
	public boolean agregarPrestamo(Prestamo prestamo);
	public boolean bajarPrestamo(int id);
	public Prestamo prestamoXId(int id);
	public ArrayList<Prestamo> listarPrestamosXEstado(String estado);
	public ArrayList<Prestamo> listarPrestamosPendientes();
	public ArrayList<Prestamo> listarPrestamosAprobados();
	public ArrayList<Prestamo> listarPrestamosRechazados();
	public boolean darDeAltaPrestamo(Prestamo prestamo);
	public void SP_AprobarPrestamo(Prestamo prestamo)throws SQLException;
	public int ultimoID();
	
	ArrayList<Prestamo> filtrarPrestamos(Date fechaInicio, Date fechaFin, Float montoMinimo, Float montoMaximo, int idCliente);
	
	public ArrayList<String> generarReportePrestamos(Date fechaInicio, Date fechaFin);
}
