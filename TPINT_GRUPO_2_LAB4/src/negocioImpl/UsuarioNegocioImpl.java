package negocioImpl;

import daoImpl.UsuarioDaoImpl;
import entidades.Usuario;
import negocio.UsuarioNegocio;

public class UsuarioNegocioImpl implements UsuarioNegocio {

    @Override
    public Usuario verificarCredenciales(String username, String password) {
        
        // Validaci�n de que las credenciales no est�n vac�as
        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre de usuario no puede estar vac�o.");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("La contrase�a no puede estar vac�a.");
        }
        
        // Validaci�n de formato del nombre de usuario
        if (!username.matches("[a-zA-Z0-9]+")) {
            throw new IllegalArgumentException("El nombre de usuario debe ser alfanum�rico.");
        }

        // Validaci�n de la longitud de la contrase�a
        if (password.length() < 5) {
            throw new IllegalArgumentException("La contrase�a debe tener al menos 5 caracteres.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        Usuario usuario = usuarioDao.verificarCredenciales(username, password);

        // Verificamos que el usuario no sea nulo
        if (usuario == null) {
            return null; // Usuario no encontrado o credenciales incorrectas
        }
        
        // Verificamos si el usuario est� activo
        if (!usuario.isActivo()) {
            throw new IllegalStateException("El usuario est� inactivo.");
        }

        // Si todas las validaciones pasan, devolvemos el usuario
        return usuario;
    }
}
