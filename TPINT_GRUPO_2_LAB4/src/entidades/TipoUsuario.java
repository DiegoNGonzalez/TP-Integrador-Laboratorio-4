package entidades;

public class TipoUsuario {
	private int id;
	private String tipoUsuario;
	
	public TipoUsuario(int id, String tipoUsuario) {
		this.id = id;
		this.tipoUsuario = tipoUsuario;
	}
	
	public TipoUsuario() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	@Override
	public String toString() {
		return tipoUsuario;
	}
	
	
}
