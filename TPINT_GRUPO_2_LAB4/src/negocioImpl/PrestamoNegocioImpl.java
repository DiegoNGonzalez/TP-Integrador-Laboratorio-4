package negocioImpl;

import java.util.ArrayList;

import daoImpl.PrestamoDaoImpl;
import entidades.Prestamo;
import negocio.PrestamoNegocio;

public class PrestamoNegocioImpl implements PrestamoNegocio{

	PrestamoDaoImpl auxPrestamo;
	
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

}
