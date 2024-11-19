package negocio;

import java.sql.SQLException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Cliente;
import entidades.Cuenta;

public interface CuentaNegocio {
	//public boolean agregarCuenta(Cuenta cuenta, int idCliente);
	public void agregarCuenta(Cuenta cuenta, int idCliente) throws SQLException;
	public ArrayList<Cuenta> listarCuentas();
	public boolean modificarCuenta(Cuenta cuenta);
	public boolean bajaCuenta(int idCuenta);
	public Cuenta obtenerCuentaPorId(int idCuenta);
	public long obtenerProximoCBU();
	public long obtenerProximoNumeroCuenta();
	public ArrayList<Cuenta> obtenerCuentasPorCliente(int idCliente);

	public boolean ingresos(int idCuenta, Float montoACargar);

	public void ejecutarSPTransferencia(long cbuDestino, long cbuOrigen, float monto, String concepto) throws SQLException;
	
	ArrayList<Cliente> filtrarCuentas(Date fechaInicio, Date fechaFin, Float montoMinimo, Float montoMaximo);

}

