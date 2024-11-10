package entidades;

public class Localidad {
	private int id;
	private String localidad;
	
	public Localidad(int id, String localidad) {
		this.id = id;
		this.localidad = localidad;
	}
	
	public Localidad() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	
}
