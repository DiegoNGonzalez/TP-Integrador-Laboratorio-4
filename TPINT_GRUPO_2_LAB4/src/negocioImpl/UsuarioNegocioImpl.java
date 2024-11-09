package negocioImpl;

import daoImpl.UsuarioDaoImpl;
import entidades.Usuario;
import negocio.UsuarioNegocio;

public class UsuarioNegocioImpl implements UsuarioNegocio {

    @Override
    public Usuario verificarCredenciales(String username, String password) {
        
        // Validación de que las credenciales no estén vacías
        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre de usuario no puede estar vacío.");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("La contraseña no puede estar vacía.");
        }
        
        // Validación de formato del nombre de usuario
        if (!username.matches("[a-zA-Z0-9]+")) {
            throw new IllegalArgumentException("El nombre de usuario debe ser alfanumérico.");
        }

        // Validación de la longitud de la contraseña
        if (password.length() < 5) {
            throw new IllegalArgumentException("La contraseña debe tener al menos 5 caracteres.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        Usuario usuario = usuarioDao.verificarCredenciales(username, password);

        // Verificamos que el usuario no sea nulo
        if (usuario == null) {
            return null; // Usuario no encontrado o credenciales incorrectas
        }
        
        // Verificamos si el usuario está activo
        if (!usuario.isActivo()) {
            throw new IllegalStateException("El usuario está inactivo.");
        }

        // Si todas las validaciones pasan, devolvemos el usuario
        return usuario;
    }
}
