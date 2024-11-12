package exceptions;

public class CuentaNegocioException extends RuntimeException {
	public CuentaNegocioException(String message) {
        super(message);
    }
}
