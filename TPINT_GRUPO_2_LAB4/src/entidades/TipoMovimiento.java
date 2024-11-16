package entidades;

public class TipoMovimiento {
	private int idMovimiento;
	private String tipoMovimiento;
	
	public TipoMovimiento () {}
	
	public TipoMovimiento(int idMovimiento, String tipoMovimiento) {
		super();
		this.idMovimiento = idMovimiento;
		this.tipoMovimiento = tipoMovimiento;
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
