package negocioImpl;
import java.util.ArrayList;

import dao.CuentaDao;
import daoImpl.CuentaDaoImpl;
import entidades.Cuenta;
import exceptions.CuentaNegocioException;
import negocio.CuentaNegocio;

public class CuentaNegocioImpl implements CuentaNegocio {
	
	private CuentaDao cuentaDao;
	
	public CuentaNegocioImpl() {
		this.cuentaDao = new CuentaDaoImpl();
	}
	
	@Override
    public boolean agregarCuenta(Cuenta cuenta, int idCliente) throws CuentaNegocioException {
        // se verifica que la cuenta no sea nula y tenga datos mínimos válidos
        if (cuenta == null) {
            throw new CuentaNegocioException("La cuenta no puede ser nula.");
        }
        /*if (cuenta.getCliente() == null || cuenta.getCliente().getIdCliente() <= 0) {
            throw new CuentaNegocioException("El cliente debe ser válido.");
        }*/
        if (cuenta.getTipoCuenta() == null || cuenta.getTipoCuenta().getId() <= 0) {
            throw new CuentaNegocioException("El tipo de cuenta debe ser válido.");
        }
        if (cuenta.getSaldo() < 0) {
            throw new CuentaNegocioException("El saldo no puede ser negativo.");
        }

        return cuentaDao.agregarCuenta(cuenta, idCliente);
    }

    @Override
    public ArrayList<Cuenta> listarCuentas() {
    	// Llstar los cuentas activas
    	ArrayList<Cuenta> cuentas = cuentaDao.listarCuentas();
    	
    	if (cuentas == null || cuentas.isEmpty()) {
			System.out.println("No hay cuentas activas.");
			return new ArrayList<>();
		}

		return cuentas;
    }

    @Override
    public boolean modificarCuenta(Cuenta cuenta) throws CuentaNegocioException {
        // Validaciones de datos de la cuenta
        if (cuenta == null || cuenta.getIdCuenta() <= 0) {
            throw new CuentaNegocioException("La cuenta a modificar debe ser válida y tener un ID.");
        }
        /*if (cuenta.getCliente() == null || cuenta.getCliente().getIdCliente() <= 0) {
            throw new CuentaNegocioException("El cliente debe ser válido.");
        }*/
        if (cuenta.getTipoCuenta() == null || cuenta.getTipoCuenta().getId() <= 0) {
            throw new CuentaNegocioException("El tipo de cuenta debe ser válido.");
        }
        if (cuenta.getSaldo() < 0) {
            throw new CuentaNegocioException("El saldo no puede ser negativo.");
        }

        return cuentaDao.modificarCuenta(cuenta);
    }

    @Override
    public boolean bajaCuenta(int idCuenta) throws CuentaNegocioException {
        // validar ID de la cuenta
        if (idCuenta <= 0) {
            throw new CuentaNegocioException("El ID de la cuenta debe ser válido.");
        }
        
        return cuentaDao.bajaCuenta(idCuenta);
    }
    
    @Override
	public long obtenerProximoCBU() throws CuentaNegocioException  {
    	return cuentaDao.obtenerProximoCBU();
    }
    
    @Override
	public long obtenerProximoNumeroCuenta() throws CuentaNegocioException  {
    	return cuentaDao.obtenerProximoNumeroCuenta();
    }
    

    @Override
    public Cuenta obtenerCuentaPorId(int idCuenta) throws CuentaNegocioException {
    	
    	//Borrar
		System.out.println("Mensaje de prueba: Ingrese a m�todo ObtenerCuentaPorId");
		
        // validar ID de la cuenta
        if (idCuenta <= 0) {
            throw new CuentaNegocioException("El ID de la cuenta debe ser válido.");
        }
        
        Cuenta cuenta = cuentaDao.obtenerCuentaPorId(idCuenta);

    	//Borrar
		System.out.println("Cuenta.toString: " + cuenta.toString());
		
        return cuenta;
    }
}
