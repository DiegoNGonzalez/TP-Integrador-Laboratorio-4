package negocioImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import daoImpl.PrestamoDaoImpl;
import entidades.Prestamo;
import negocio.PrestamoNegocio;

public class PrestamoNegocioImpl implements PrestamoNegocio{

    private PrestamoDaoImpl auxPrestamo;

    public PrestamoNegocioImpl() {
        auxPrestamo = new PrestamoDaoImpl();
    }
    
	@Override
	public ArrayList<Prestamo> listarPrestamos() {
		return auxPrestamo.listarPrestamos();
	}

	
	
	@Override
	public boolean agregarPrestamo(Prestamo prestamo) {
		if(auxPrestamo.agregarPrestamo(prestamo)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean bajarPrestamo(int id) {
		if(auxPrestamo.bajarPrestamo(id)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Prestamo prestamoXId(int id) {
		return auxPrestamo.prestamoXId(id);
	}

	@Override
	public ArrayList<Prestamo> listarPrestamosXCliente(int idCliente) {
		return auxPrestamo.listarPrestamosXCliente(idCliente);
	}

	@Override
	public ArrayList<Prestamo> listarPrestamosXEstado(String estado) {
		return auxPrestamo.listarPrestamosXEstado(estado);
	}

	@Override
	public ArrayList<Prestamo> listarPrestamosPendientes() {
		return auxPrestamo.listarPrestamosPendientes();
	}

	@Override
	public ArrayList<Prestamo> listarPrestamosAprobados() {
		return auxPrestamo.listarPrestamosAprobados();
	}

	@Override
	public ArrayList<Prestamo> listarPrestamosRechazados() {
		return auxPrestamo.listarPrestamosRechazados();
	}

	@Override
	public boolean darDeAltaPrestamo(Prestamo prestamo) {
		return auxPrestamo.darDeAltaPrestamo(prestamo);
	}

	@Override
	public void SP_AprobarPrestamo(Prestamo prestamo) throws SQLException {
		try {
			auxPrestamo.SP_AprobarPrestamo(prestamo);
		}
		catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}finally {
		}		
	}
	
	
	@Override
	public int ultimoID() {
		return auxPrestamo.ultimoID();
	}

	@Override
	public ArrayList<Prestamo> filtrarPrestamos(Date fechaInicio, Date fechaFin, Float montoMinimo, Float montoMaximo, int idCliente) {
		return auxPrestamo.filtrarPrestamos(fechaInicio, fechaFin, montoMinimo, montoMaximo, idCliente);
	}

	@Override
	public boolean finalizarPrestamo(int idPrestamo) {
		if(auxPrestamo.finalizarPrestamo(idPrestamo)) {
			return true;
		} else {
			return false;
		}
	}

}
