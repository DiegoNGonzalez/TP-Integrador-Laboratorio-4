package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cuota;
import entidades.Movimiento;
import entidades.Prestamo;
import entidades.TipoMovimiento;
import negocio.CuentaNegocio;
import negocio.CuotaNegocio;
import negocio.MovimientoNegocio;
import negocio.PrestamoNegocio;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.CuotaNegocioImpl;
import negocioImpl.MovimientoNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

/**
 * Servlet implementation class AprobarPrestamoServlet
 */
@WebServlet("/AprobarPrestamoServlet")
public class AprobarPrestamoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AprobarPrestamoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int prestamoId = Integer.parseInt(request.getParameter("prestamoId"));

        PrestamoNegocio prestamoNegocio = new PrestamoNegocioImpl();
        Prestamo prestamo = prestamoNegocio.prestamoXId(prestamoId);
        try {
        if (prestamo != null) {
        	
            prestamo.setEstado("Activo"); // Cambia el estado del pr�stamo
            prestamoNegocio.darDeAltaPrestamo(prestamo);

            // Generar cuotas
            CuotaNegocio cuotaNegocio = new CuotaNegocioImpl();
            Float montoPorCuota = prestamo.getImporteCuota();
            Calendar calendar = Calendar.getInstance();
            for (int i = 1; i <= prestamo.getCantCuotas(); i++) {
            	calendar.add(Calendar.MONTH, 1);
                Cuota cuota = new Cuota();
                cuota.setNumCuota(i);
                cuota.setMontoAPagar(montoPorCuota);
                cuota.setFechaPago(new java.sql.Date(calendar.getTimeInMillis()));
                cuota.setEstado(false);

                cuotaNegocio.agregarCuota(cuota, prestamo.getIdPrestamo());

            }

            // Registrar movimiento
            MovimientoNegocio movimientoNegocio = new MovimientoNegocioImpl();
            Movimiento movimiento = new Movimiento();
            TipoMovimiento tipomovimiento = new TipoMovimiento();
            tipomovimiento.setIdTipoMovimiento(2);
            movimiento.setTipoMovimiento(tipomovimiento);
            movimiento.setImporteMovimiento(prestamo.getImporteTotal());
            movimiento.setFechaMovimiento(new java.sql.Date(System.currentTimeMillis()));
            movimiento.setConcepto("Pr�stamo aprobado");
            movimientoNegocio.agregarMovimiento(movimiento, prestamo.getCuenta().getIdCuenta());
            
            // Cargar el saldo a la cuenta destino
            CuentaNegocio cuentaNegocio = new CuentaNegocioImpl();
            Float importe = Float.valueOf(prestamo.getImporteTotal());
            cuentaNegocio.ingresos(prestamo.getCuenta().getIdCuenta(), importe);
            
        }

        response.sendRedirect("GestionPrestamosServlet"); // Redirigir a la p�gina de gesti�n
    } catch (Exception e) {
    	e.printStackTrace();

    }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
