package entidades;

import java.util.ArrayList;
import java.util.Date;

public class Prestamo {
	private int idPrestamo;
	private int idCuenta;
	private int idCliente;
	private Date fechaAltaPrestamo;
	private float importeTotal;
	private int plazo;
	private float importeCuota;
	private int cantCuotas;
	private ArrayList<Cuota> cuotas;
	private String estado;
	
	public Prestamo() {
	}
	
	public Prestamo(int idPrestamo, int idCuenta, int idCliente, Date fechaAltaPrestamo, float importeTotal, int plazo,
			float importeCuota, int cantCuotas, ArrayList<Cuota> cuotas, String estado) {
		super();
		this.idPrestamo = idPrestamo;
		this.idCuenta = idCuenta;
		this.idCliente = idCliente;
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
	
	public float getImporteCuota() {
		return importeCuota;
	}
	public void setImporteCuota(float importeCuota2) {
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

	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Prestamo [idPrestamo=" + idPrestamo + ", idCliente=" + idCliente + ", fechaAltaPrestamo="
				+ fechaAltaPrestamo + ", importeTotal=" + importeTotal + ", plazo=" + plazo + ", importeCuota="
				+ importeCuota + ", cantCuotas=" + cantCuotas + ", cuotas=" + cuotas + ", estado=" + estado + "]";
	}
}
