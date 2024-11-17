package entidades;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

public class Prestamo {

	private int idPrestamo;
	private Cuenta cuenta;
	private Cliente cliente;
	private Date fechaAltaPrestamo;
	private float importeTotal;
	private int plazo;
	private BigDecimal importeCuota;
	private int cantCuotas;
	private ArrayList<Cuota> cuotas;
	private String estado;
	
	public Prestamo() {
	}
	
	public Prestamo(int idPrestamo, Cuenta cuenta, Cliente cliente, Date fechaAltaPrestamo, float importeTotal, int plazo,
			BigDecimal importeCuota, int cantCuotas, ArrayList<Cuota> cuotas, String estado) {
		super();
		this.idPrestamo = idPrestamo;
		this.cuenta = cuenta;
		this.cliente = cliente;
		this.fechaAltaPrestamo = fechaAltaPrestamo;
		this.importeTotal = importeTotal;
		this.plazo = plazo;
		this.importeCuota = importeCuota;
		this.cantCuotas = cantCuotas;
		this.cuotas = cuotas;
		this.estado = estado;
	}
	
	public int getIdPrestamo() {
		return idPrestamo;
	}
	public void setIdPrestamo(int idPrestamo) {
		this.idPrestamo = idPrestamo;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Date getFechaAltaPrestamo() {
		return fechaAltaPrestamo;
	}
	public void setFechaAltaPrestamo(Date fechaAltaPrestamo) {
		this.fechaAltaPrestamo = fechaAltaPrestamo;
	}
	
	public float getImporteTotal() {
		return importeTotal;
	}
	public void setImporteTotal(float importeTotal) {
		this.importeTotal = importeTotal;
	}
	public int getPlazo() {
		return plazo;
	}
	public void setPlazo(int plazo) {
		this.plazo = plazo;
	}
	public BigDecimal getImporteCuota() {
		return importeCuota;
	}
	public void setImporteCuota(BigDecimal importeCuota2) {
		this.importeCuota = importeCuota2;
	}
	public int getCantCuotas() {
		return cantCuotas;
	}
	public void setCantCuotas(int cantCuotas) {
		this.cantCuotas = cantCuotas;
	}
	
	public ArrayList<Cuota> getCuotas() {
		return cuotas;
	}

	public void setCuotas(ArrayList<Cuota> cuotas) {
		this.cuotas = cuotas;
	}

	public Cuenta getCuenta() {
		return cuenta;
	}

	public void setCuenta(Cuenta cuenta) {
		this.cuenta = cuenta;
	}

	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Prestamo [idPrestamo=" + idPrestamo + ", cliente=" + cliente + ", fechaAltaPrestamo="
				+ fechaAltaPrestamo + ", importeTotal=" + importeTotal + ", plazo=" + plazo + ", importeCuota="
				+ importeCuota + ", cantCuotas=" + cantCuotas + ", cuotas=" + cuotas + ", estado=" + estado + "]";
	}
	
	
}
