package negocioImpl;

import daoImpl.UsuarioDaoImpl;
import entidades.Usuario;
import exceptions.UsuarioNegocioException;
import negocio.UsuarioNegocio;

public class UsuarioNegocioImpl implements UsuarioNegocio {

    @Override
    public Usuario verificarCredenciales(String username, String password) {
        // Validaciones de par�metros
        if (username == null || username.trim().isEmpty()) {
            throw new UsuarioNegocioException("El nombre de usuario no puede estar vac�o.");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new UsuarioNegocioException("La contrase�a no puede estar vac�a.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        Usuario usuario = usuarioDao.verificarCredenciales(username, password);

        // Verificamos que el usuario exista
        if (usuario == null) {
            throw new UsuarioNegocioException("Usuario no encontrado o credenciales incorrectas.");
        }

        if (!usuario.isActivo()) {
            throw new UsuarioNegocioException("El usuario est� inactivo.");
        }

        return usuario; // Retorna el usuario si todo est� bien
    }

    @Override
    public Usuario obtenerUnUsuario(int id) {
        if (id <= 0) {
            throw new UsuarioNegocioException("El ID de usuario no puede ser menor o igual a cero.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        Usuario usuario = usuarioDao.obtenerUnUsuario(id);

        if (usuario == null) {
            throw new UsuarioNegocioException("No se encontr� un usuario con el ID proporcionado.");
        }

        return usuario;
    }

    @Override
    public boolean agregarUsuario(Usuario usuario) {
        if (usuario == null) {
            throw new UsuarioNegocioException("El usuario no puede ser nulo.");
        }

        if (usuario.getNombreUsuario() == null || usuario.getNombreUsuario().trim().isEmpty()) {
            throw new UsuarioNegocioException("El nombre de usuario no puede estar vac�o.");
        }

        if (usuario.getPassword() == null || usuario.getPassword().trim().isEmpty()) {
            throw new UsuarioNegocioException("La contrase�a no puede estar vac�a.");
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
            throw new UsuarioNegocioException("El nombre de usuario no puede estar vac�o.");
        }

        UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
        Usuario usuario = usuarioDao.buscarUsuario(nombreUsuario);

        if (usuario == null) {
            throw new UsuarioNegocioException("No se encontr� un usuario con el nombre de usuario proporcionado.");
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
