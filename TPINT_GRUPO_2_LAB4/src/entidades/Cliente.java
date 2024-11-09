package entidades;

import java.util.Date;

public class Cliente {
	private Usuario usuario;
	private int idCliente;
	private String dni;
	private String cuil;
	private String nombre;
	private String apellido;
	private String email;
	private String telefono;
	private String direccion;
	private Date fechaNacimiento;
	private char sexo;
	
	public  Cliente () {
		
	}
	
	public Cliente(Usuario usuario, int idCliente, String dni, String cuil, String nombre, String apellido, String email,
			String telefono, String direccion, Date fechaNacimiento, char sexo) {
		super();
		this.usuario = usuario;
		this.idCliente = idCliente;
		this.dni = dni;
		this.cuil=cuil;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.telefono = telefono;
		this.direccion = direccion;
		this.fechaNacimiento = fechaNacimiento;
		this.sexo = sexo;
	}

	//Getters y setters
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public char getSexo() {
		return sexo;
	}
	public void setSexo(char sexo) {
		this.sexo = sexo;
	}
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getCuil() {
		return cuil;
	}

	public void setCuil(String cuil) {
		this.cuil = cuil;
	}
	@Override
	public String toString() {
		return "Cliente [idCliente=" + idCliente + ", dni=" + dni + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", email=" + email + ", telefono=" + telefono + ", direccion=" + direccion + ", fechaNacimiento="
				+ fechaNacimiento + ", sexo=" + sexo + "]";
	}
	

}
