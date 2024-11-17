package negocioImpl;

import java.util.ArrayList;

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

}
