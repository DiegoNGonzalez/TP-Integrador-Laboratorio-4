package entidades;

import java.util.Date;

public class Cuota {

	private int idCuota;
	private int  idPrestamo;
	private int numCuota;
	private float montoAPagar;
	private Date fechaPago;
	private boolean estado;
	
	public Cuota() {
	}
	
	public Cuota(int idCuota, int idPrestamo, int numCuota, float montoAPagar, Date fechaPago, boolean estado) {
		super();
		this.idCuota = idCuota;
		this.idPrestamo = idPrestamo;
		this.numCuota = numCuota;
		this.montoAPagar = montoAPagar;
		this.fechaPago = fechaPago;
		this.estado = estado;
	}
	
	public int getIdCuota() {
		return idCuota;
	}
	public void setIdCuota(int idCuota) {
		this.idCuota = idCuota;
	}
	public int getidPrestamo() {
		return idPrestamo;
	}
	public void setPrestamo(int idPrestamo) {
		this.idPrestamo = idPrestamo;
	}
	public int getNumCuota() {
		return numCuota;
	}
	public void setNumCuota(int numCuota) {
		this.numCuota = numCuota;
	}
	public float getMontoAPagar() {
		return montoAPagar;
	}
	public void setMontoAPagar(float montoAPagar) {
		this.montoAPagar = montoAPagar;
	}
	public Date getFechaPago() {
		return fechaPago;
	}
	public void setFechaPago(Date fechaPago) {
		this.fechaPago = fechaPago;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	@Override
	public String toString() {
		return "Cuota [idCuota=" + idCuota + ", idPrestamo=" + idPrestamo + ", numCuota=" + numCuota + ", montoAPagar="
				+ montoAPagar + ", fechaPago=" + fechaPago + ", estado=" + estado + "]";
	}
	
	
	
}
