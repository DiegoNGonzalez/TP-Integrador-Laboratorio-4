package dao;

import java.util.ArrayList;

import entidades.Cuota;

public interface CuotaDao {

    ArrayList<Cuota> listarCuotas();
    boolean agregarCuota(Cuota cuota, int idPrestamo);
    boolean bajarCuota(int idCuota);
    Cuota obtenerCuotaPorId(int idCuota);
}
