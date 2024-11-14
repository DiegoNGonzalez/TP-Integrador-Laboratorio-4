package exceptions;

public class ClienteSPException extends RuntimeException {
	public ClienteSPException() {
		
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return "error en SP";
	}
	
}
