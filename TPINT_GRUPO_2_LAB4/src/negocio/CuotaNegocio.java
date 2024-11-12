package negocio;

import java.util.ArrayList;

import entidades.Cuota;

public interface CuotaNegocio {
    ArrayList<Cuota> listarCuotas();
    boolean agregarCuota(Cuota cuota);
    boolean bajarCuota(int idCuota);
    Cuota obtenerCuotaPorId(int idCuota);
}
