package entidades;

public class Usuario {
	private int id;
	private String nombreUsuario;
	private String password;
	private TipoUsuario tipoUsuario;
	private boolean estado;
	
	public Usuario(int id, String nombreUsuario, String password, boolean estado, TipoUsuario tipoUsuario) {
		this.id = id;
		this.nombreUsuario = nombreUsuario;
		this.password = password;
		this.estado = estado;
		this.tipoUsuario = tipoUsuario;
	}
	
	public Usuario() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isActivo() {
		return estado;
	}

	public void setActivo(boolean activo) {
		this.estado = activo;
	}

	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
		
}
