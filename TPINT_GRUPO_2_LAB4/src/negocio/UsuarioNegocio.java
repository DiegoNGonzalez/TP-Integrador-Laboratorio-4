package negocio;

import entidades.Usuario;

public interface UsuarioNegocio {
	Usuario verificarCredenciales(String username, String password);
}
