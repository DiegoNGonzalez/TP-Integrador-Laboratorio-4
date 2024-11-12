package dao;
import java.util.ArrayList;
import entidades.Cuenta;

public interface CuentaDao {
	public boolean agregarCuenta(Cuenta cuenta);
	public ArrayList<Cuenta> listarCuentas();
	public boolean modificarCuenta(Cuenta cuenta);
	public boolean bajaCuenta(int idCuenta);
	public Cuenta obtenerCuentaPorId(int idCuenta);
}