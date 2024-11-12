package dao;
import java.util.ArrayList;
import entidades.TipoCuenta;

public interface TipoCuentaDao {
	public ArrayList<TipoCuenta> listarTipoCuenta();
	public TipoCuenta obtenerTipoCuentaPorId(int id);
}
