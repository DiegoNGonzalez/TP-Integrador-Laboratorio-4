package negocio;
import java.util.ArrayList;

import entidades.Cuenta;

public interface CuentaNegocio {
	public boolean agregarCuenta(Cuenta cuenta, int idCliente);
	public ArrayList<Cuenta> listarCuentas();
	public boolean modificarCuenta(Cuenta cuenta);
	public boolean bajaCuenta(int idCuenta);
	public Cuenta obtenerCuentaPorId(int idCuenta);
	public long obtenerProximoCBU();
	public long obtenerProximoNumeroCuenta();
}

