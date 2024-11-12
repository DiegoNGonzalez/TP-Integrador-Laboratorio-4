package negocioImpl;

import java.util.ArrayList;

import daoImpl.CuotaDaoImpl;
import entidades.Cuota;
import negocio.CuotaNegocio;

public class CuotaNegocioImpl implements CuotaNegocio{

	CuotaDaoImpl auxCuota;
	
	@Override
	public ArrayList<Cuota> listarCuotas() {
		return auxCuota.listarCuotas();
	}

	@Override
	public boolean agregarCuota(Cuota cuota) {
		if(auxCuota.agregarCuota(cuota)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean bajarCuota(int idCuota) {
		if(auxCuota.bajarCuota(idCuota)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Cuota obtenerCuotaPorId(int idCuota) {
		return auxCuota.obtenerCuotaPorId(idCuota);
	}

}
