package negocio;

import java.util.ArrayList;

import entidades.TipoCuenta;

public interface TipoCuentaNegocio {
	public ArrayList<TipoCuenta> listarTiposCuenta();
	public TipoCuenta obtenerTipoCuentaPorId(int id);
}
