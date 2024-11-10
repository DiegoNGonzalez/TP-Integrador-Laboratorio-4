package dao;

import entidades.Usuario;

public interface UsuarioDao {
	public Usuario obtenerUnUsuario(int id);
	public Usuario verificarCredenciales(String nombreUsuario, String password);
	public boolean agregarUsuario(Usuario usuario);
	public Usuario buscarUsuario (String nombreUsuario);
	public boolean eliminarUsuarioLogico(int idUsuario);
	
}
