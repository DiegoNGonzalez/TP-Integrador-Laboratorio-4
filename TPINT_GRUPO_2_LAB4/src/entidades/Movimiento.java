package entidades;

import java.util.Date;

public class Movimiento {
	private int idMovimiento;
	private TipoMovimiento tipoMovimiento;
	private Date fechaMovimiento;
	private String concepto;
	private float importeMovimiento;

	public Movimiento() {}

	public Movimiento(int idMovimiento, TipoMovimiento tipoMovimiento, Date fechaMovimiento, String concepto,
			float importeMovimiento) {
		super();
		this.idMovimiento = idMovimiento;
		this.tipoMovimiento = tipoMovimiento;
		this.fechaMovimiento = fechaMovimiento;
		this.concepto = concepto;
		this.importeMovimiento = importeMovimiento;
	}

	public int getIdMovimiento() {
		return idMovimiento;
	}

	public void setIdMovimiento(int idMovimiento) {
		this.idMovimiento = idMovimiento;
	}

	public TipoMovimiento getTipoMovimiento() {
		return tipoMovimiento;
	}

	public void setTipoMovimiento(TipoMovimiento tipoMovimiento) {
		this.tipoMovimiento = tipoMovimiento;
	}

	public Date getFechaMovimiento() {
		return fechaMovimiento;
	}

	public void setFechaMovimiento(Date fechaMovimiento) {
		this.fechaMovimiento = fechaMovimiento;
	}

	public String getConcepto() {
		return concepto;
	}

	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}

	public float getImporteMovimiento() {
		return importeMovimiento;
	}

	public void setImporteMovimiento(float importeMovimiento) {
		this.importeMovimiento = importeMovimiento;
	};
	
	
}
