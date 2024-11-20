package dao;

import java.util.ArrayList;

import entidades.Cuota;

public interface CuotaDao {

    ArrayList<Cuota> listarCuotas();
    boolean agregarCuota(Cuota cuota, int idPrestamo);
    boolean bajarCuota(int idCuota);
    Cuota obtenerCuotaPorId(int idCuota);
    
    public boolean registrarPago(int idCuota);
    public ArrayList<Cuota> listarCuotasPendientesPorPrestamo(int idPrestamo);
    public ArrayList<Cuota> listarCuotasPorPrestamo(int idPrestamo);
    
    /*
    // Para los filtros
    public ArrayList<Cuota> buscarCuotasPorRangoDeFechas(Date fechaInicio, Date fechaFin);
    public ArrayList<Cuota> buscarCuotasPorRangoDeMontos(BigDecimal montoMinimo, BigDecimal montoMaximo);
    
    // Cuotas pendientes del prestamo
    public ArrayList<Cuota> obtenerCuotasPendientes(int idPrestamo);
    public boolean actualizarEstadoCuota(int idCuota, boolean estado);
    */
    public String pagarCuotaSP(int idCuota, int idCuenta);
}
