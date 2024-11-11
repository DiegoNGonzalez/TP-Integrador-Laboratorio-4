package entidades;
import java.util.Date;
import java.math.BigDecimal;

public class Cuenta {
	private int idCuenta;
	private int idCliente;
	private int idTipoCuenta;
	private Date fechaCreacion;
	private long numeroCuenta;
	private String cbu;
	private BigDecimal saldo;
	private boolean estadoCuenta;
	
	//constructores
	public Cuenta(int idCuenta, int idCliente, int idTipoCuenta, Date fechaCreacion, long numeroCuenta, String cbu, BigDecimal saldo, boolean estadoCuenta) {
		this.idCuenta = idCuenta;
		this.idCliente = idCliente;
		this.idTipoCuenta = idTipoCuenta;
		this.fechaCreacion = fechaCreacion;
		this.numeroCuenta = numeroCuenta;
		this.cbu = cbu;
		this.saldo = saldo;
		this.estadoCuenta = estadoCuenta;
	}
	
	public Cuenta() {
		
	}
	
	//getters y setters
	public int getIdCuenta() {
		return idCuenta;
	}
	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public int getIdTipoCuenta() {
		return idTipoCuenta;
	}
	public void setIdTipoCuenta(int idTipoCuenta) {
		this.idTipoCuenta = idTipoCuenta;
	}
	public Date getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public long getNumeroCuenta() {
		return numeroCuenta;
	}
	public void setNumeroCuenta(long numeroCuenta) {
		this.numeroCuenta = numeroCuenta;
	}
	public String getCbu() {
		return cbu;
	}
	public void setCbu(String cbu) {
		this.cbu = cbu;
	}
	public BigDecimal getSaldo() {
		return saldo;
	}
	public void setSaldo(BigDecimal saldo) {
		this.saldo = saldo;
	}
	public boolean getEstadoCuenta() {
		return estadoCuenta;
	}
	public void setEstadoCuenta(boolean estadoCuenta) {
		this.estadoCuenta = estadoCuenta;
	}
}







