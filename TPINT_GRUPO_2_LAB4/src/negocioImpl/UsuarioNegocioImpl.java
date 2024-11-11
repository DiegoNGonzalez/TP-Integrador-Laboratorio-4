package negocioImpl;

import daoImpl.UsuarioDaoImpl;
import entidades.Usuario;
import exceptions.UsuarioNegocioException;
import negocio.UsuarioNegocio;

public class UsuarioNegocioImpl implements UsuarioNegocio {

    @Override
    public Usuario verificarCredenciales(String username, String password) {
        // Validaciones de parámetros
        if (username == null || username.trim().isEmpty()) {
            throw new UsuarioNegocioException("El nombre de usuario no puede estar vacío.");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new UsuarioNegocioException("La contraseña no puede estar vacía.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        Usuario usuario = usuarioDao.verificarCredenciales(username, password);

        // Verificamos que el usuario exista
        if (usuario == null) {
            throw new UsuarioNegocioException("Usuario no encontrado o credenciales incorrectas.");
        }

        if (!usuario.isActivo()) {
            throw new UsuarioNegocioException("El usuario está inactivo.");
        }

        return usuario; // Retorna el usuario si todo está bien
    }

    @Override
    public Usuario obtenerUnUsuario(int id) {
        if (id <= 0) {
            throw new UsuarioNegocioException("El ID de usuario no puede ser menor o igual a cero.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        Usuario usuario = usuarioDao.obtenerUnUsuario(id);

        if (usuario == null) {
            throw new UsuarioNegocioException("No se encontró un usuario con el ID proporcionado.");
        }

        return usuario;
    }

    @Override
    public boolean agregarUsuario(Usuario usuario) {
        if (usuario == null) {
            throw new UsuarioNegocioException("El usuario no puede ser nulo.");
        }

        if (usuario.getNombreUsuario() == null || usuario.getNombreUsuario().trim().isEmpty()) {
            throw new UsuarioNegocioException("El nombre de usuario no puede estar vacío.");
        }

        if (usuario.getPassword() == null || usuario.getPassword().trim().isEmpty()) {
            throw new UsuarioNegocioException("La contraseña no puede estar vacía.");
        }

        if (usuario.getTipoUsuario() == null) {
            throw new UsuarioNegocioException("El tipo de usuario es obligatorio.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        return usuarioDao.agregarUsuario(usuario);
    }

    @Override
    public Usuario buscarUsuario(String nombreUsuario) {
        if (nombreUsuario == null || nombreUsuario.trim().isEmpty()) {
            throw new UsuarioNegocioException("El nombre de usuario no puede estar vacío.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        Usuario usuario = usuarioDao.buscarUsuario(nombreUsuario);

        if (usuario == null) {
            throw new UsuarioNegocioException("No se encontró un usuario con el nombre de usuario proporcionado.");
        }

        return usuario;
    }

    @Override
    public boolean eliminarUsuarioLogico(int idUsuario) {
        if (idUsuario <= 0) {
            throw new UsuarioNegocioException("El ID de usuario no puede ser menor o igual a cero.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        boolean eliminado = usuarioDao.eliminarUsuarioLogico(idUsuario);

        if (!eliminado) {
            throw new UsuarioNegocioException("No se pudo eliminar el usuario.");
        }

        return eliminado;
    }
}
