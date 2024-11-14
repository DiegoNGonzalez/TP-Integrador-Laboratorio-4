package entidades;
import java.util.Date;
import entidades.TipoCuenta;

public class Cuenta {
	private int idCuenta;
	private TipoCuenta tipoCuenta;
	private Date fechaCreacion;
	private long numeroCuenta;
	private long cbu;
	private float saldo;
	private boolean estadoCuenta;
	
	//constructores
	public Cuenta(int idCuenta, TipoCuenta tipoCuenta, Date fechaCreacion, long numeroCuenta, long cbu, float saldo, boolean estadoCuenta) {
		this.idCuenta = idCuenta;
		this.tipoCuenta = tipoCuenta;
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
	public TipoCuenta getTipoCuenta() {
		return tipoCuenta;
	}
	public void setTipoCuenta(TipoCuenta tipoCuenta) {
		this.tipoCuenta = tipoCuenta;
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
	public long getCbu() {
		return cbu;
	}
	public void setCbu(long cbu) {
		this.cbu = cbu;
	}
	public float getSaldo() {
		return saldo;
	}
	public void setSaldo(float saldo) {
		this.saldo = saldo;
	}
	public boolean getEstadoCuenta() {
		return estadoCuenta;
	}
	public void setEstadoCuenta(boolean estadoCuenta) {
		this.estadoCuenta = estadoCuenta;
	}
}