package negocio;

import java.util.ArrayList;

import entidades.Cuota;

public interface CuotaNegocio {
    ArrayList<Cuota> listarCuotas();
    boolean agregarCuota(Cuota cuota, int idPrestamo);
    boolean bajarCuota(int idCuota);
    Cuota obtenerCuotaPorId(int idCuota);
    
    public boolean registrarPago(int idCuota);
    public ArrayList<Cuota> listarCuotasPendientesPorPrestamo(int idPrestamo);
    
    /*
    public ArrayList<Cuota> filtrarCuotas(Date fechaInicio, Date fechaFin, BigDecimal montoMinimo, BigDecimal montoMaximo);
    public boolean pagarCuota(int idCuota, int idCuentaDebito);
    */
}
