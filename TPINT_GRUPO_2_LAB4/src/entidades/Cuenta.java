package entidades;
import java.util.Date;
import entidades.Cliente;
import entidades.TipoCuenta;

public class Cuenta {
	private int idCuenta;
	private Cliente cliente;
	private TipoCuenta tipoCuenta;
	private Date fechaCreacion;
	private long numeroCuenta;
	private String cbu;
	private float saldo;
	private boolean estadoCuenta;
	
	//constructores
	public Cuenta(int idCuenta, Cliente cliente, TipoCuenta tipoCuenta, Date fechaCreacion, long numeroCuenta, String cbu, float saldo, boolean estadoCuenta) {
		this.idCuenta = idCuenta;
		this.cliente = cliente;
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
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
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
	public String getCbu() {
		return cbu;
	}
	public void setCbu(String cbu) {
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