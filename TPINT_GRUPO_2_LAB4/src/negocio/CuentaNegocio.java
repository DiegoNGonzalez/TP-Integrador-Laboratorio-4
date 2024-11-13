package negocio;
import java.util.ArrayList;

import entidades.Cuenta;

public interface CuentaNegocio {
	public boolean agregarCuenta(Cuenta cuenta, int idCliente);
	public ArrayList<Cuenta> listarCuentas();
	public boolean modificarCuenta(Cuenta cuenta, int idCliente);
	public boolean bajaCuenta(int idCuenta);
	public Cuenta obtenerCuentaPorId(int idCuenta);

}

