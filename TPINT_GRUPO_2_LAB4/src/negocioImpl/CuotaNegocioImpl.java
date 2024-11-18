package negocioImpl;

import java.util.ArrayList;

import daoImpl.CuotaDaoImpl;
import entidades.Cuota;
import negocio.CuotaNegocio;

public class CuotaNegocioImpl implements CuotaNegocio{

	private CuotaDaoImpl auxCuota;
	
	public CuotaNegocioImpl() {
		auxCuota = new CuotaDaoImpl();
	}
	
	@Override
	public ArrayList<Cuota> listarCuotas() {
		return auxCuota.listarCuotas();
	}

	@Override
	public boolean agregarCuota(Cuota cuota, int idPrestamo) {
		if(auxCuota.agregarCuota(cuota, idPrestamo)) {
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

	@Override
	public boolean registrarPago(int idCuota) {
		return auxCuota.registrarPago(idCuota);
	}

	@Override
	public ArrayList<Cuota> listarCuotasPendientesPorPrestamo(int idPrestamo) {
		return auxCuota.listarCuotasPendientesPorPrestamo(idPrestamo);
	}

}
