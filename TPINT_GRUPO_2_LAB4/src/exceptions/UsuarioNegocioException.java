package exceptions;

public class UsuarioNegocioException extends RuntimeException {
    public UsuarioNegocioException(String message) {
        super(message);
    }
}
