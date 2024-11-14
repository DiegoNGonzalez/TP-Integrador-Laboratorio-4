package negocioImpl;

import java.util.ArrayList;

import dao.TipoCuentaDao;
import daoImpl.TipoCuentaDaoImpl;
import entidades.TipoCuenta;
import negocio.TipoCuentaNegocio;

public class TipoCuentaNegocioImpl implements TipoCuentaNegocio {
	
	private TipoCuentaDao tipoCuentaDao;
	
	public TipoCuentaNegocioImpl() {
		this.tipoCuentaDao = new TipoCuentaDaoImpl();
	}
	
	@Override
	public ArrayList<TipoCuenta> listarTiposCuenta(){
		ArrayList<TipoCuenta> listaTiposCuenta = tipoCuentaDao.listarTiposCuenta();
		
		if(listaTiposCuenta == null || listaTiposCuenta.isEmpty()) {
			System.out.println("No hay tipos de cuenta cargados.");
			return new ArrayList<>();			
		}
		
		return listaTiposCuenta;
	}
	
	@Override
	public TipoCuenta obtenerTipoCuentaPorId(int idCuenta) {
		if(idCuenta <= 0) {
			System.out.println("El ID de cuenta no es válido.");
			return null;
		}
		
		return tipoCuentaDao.obtenerTipoCuentaPorId(idCuenta);		
	}
}
