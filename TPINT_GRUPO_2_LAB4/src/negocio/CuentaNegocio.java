package negocio;

import java.sql.SQLException;
=======
import java.math.BigDecimal;
>>>>>>> branch 'main' of https://github.com/DiegoNGonzalez/TPINT_GRUPO_2_LAB4.git
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
	public ArrayList<Cuenta> obtenerCuentasPorCliente(int idCliente);
	public void ejecutarSPTransferencia(long cbuOrigen, long cbuDestino, float monto, String concepto) throws SQLException;
	public boolean ingresos(int idCuenta, BigDecimal montoACargar);
}

