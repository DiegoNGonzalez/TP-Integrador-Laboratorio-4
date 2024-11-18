package entidades;

public class TipoMovimiento {
	private int idMovimiento;
	private int idTipoMovimiento;
	private String tipoMovimiento;
	
	public TipoMovimiento () {}
	
	public TipoMovimiento(int idMovimiento, int idTipoMovimiento, String tipoMovimiento) {
		super();
		this.idMovimiento = idMovimiento;
		this.tipoMovimiento = tipoMovimiento;
	}
	
	public int getIdTipoMovimiento() {
		return idTipoMovimiento;
	}

	public void setIdTipoMovimiento(int idTipoMovimiento) {
		this.idTipoMovimiento = idTipoMovimiento;
	}

	public int getIdMovimiento() {
		return idMovimiento;
	}
	public void setIdMovimiento(int idMovimiento) {
		this.idMovimiento = idMovimiento;
	}
	public String getTipoMovimiento() {
		return tipoMovimiento;
	}
	public void setTipoMovimiento(String tipoMovimiento) {
		this.tipoMovimiento = tipoMovimiento;
	}

}
