package entidades;

public class TipoCuenta {
	private int id;
    private String tipo;
	
	public TipoCuenta(int id, String tipo) {
		this.id = id;
		this.tipo = tipo;
	}
	
	public TipoCuenta() {
		
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
}
