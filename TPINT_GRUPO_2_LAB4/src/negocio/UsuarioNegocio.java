package negocio;

import entidades.Usuario;

public interface UsuarioNegocio {
	Usuario verificarCredenciales(String username, String password);
	public Usuario obtenerUnUsuario(int id);
	public boolean agregarUsuario(Usuario usuario);
	public Usuario buscarUsuario(String nombreUsuario);
	public boolean eliminarUsuarioLogico(int idUsuario);
}
