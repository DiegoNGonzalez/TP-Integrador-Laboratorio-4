package dao;

import entidades.Usuario;

public interface UsuarioDao {
	public Usuario obtenerUnUsuario(int id);
	public Usuario verificarCredenciales(String nombreUsuario, String password);
	
}
