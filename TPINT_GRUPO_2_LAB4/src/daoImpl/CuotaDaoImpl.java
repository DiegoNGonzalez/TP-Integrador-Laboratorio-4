package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import java.sql.CallableStatement;

import dao.CuotaDao;
import entidades.Cuota;
import entidades.Prestamo;

public class CuotaDaoImpl implements CuotaDao {

    @Override
    public ArrayList<Cuota> listarCuotas() {
        String query = "SELECT idCuota, idPrestamo, numeroCuota, montoPagado, fechaPago, estadoPago FROM cuotas";
        ArrayList<Cuota> listaCuotas = new ArrayList<>();

        try (Connection conexion = Conexion.getConnection();
             PreparedStatement statement = conexion.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Cuota cuota = new Cuota();
                cuota.setIdCuota(resultSet.getInt("idCuota"));
                //int idPrestamo = resultSet.getInt("idPrestamo");
//                Prestamo prestamo = aux.prestamoXId(idPrestamo);
//                cuota.setPrestamo(prestamo);
                
                cuota.setNumCuota(resultSet.getInt("numeroCuota"));
                cuota.setMontoAPagar(resultSet.getFloat("montoPagado"));
                cuota.setFechaPago(resultSet.getDate("fechaPago"));
                cuota.setEstado(resultSet.getBoolean("estadoPago"));

                listaCuotas.add(cuota);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCuotas;
    }

    @Override
    public boolean agregarCuota(Cuota cuota, int idPrestamo) {
        String query = "INSERT INTO cuotas(idPrestamo, numeroCuota, montoPagado, fechaPago, estadoPago) VALUES (?, ?, ?, ?, ?)";

        try (Connection conexion = Conexion.getConnection();
             PreparedStatement statement = conexion.prepareStatement(query)) {

            statement.setInt(1, idPrestamo);
            statement.setInt(2, cuota.getNumCuota());
            statement.setFloat(3, cuota.getMontoAPagar());
            statement.setDate(4, new java.sql.Date(cuota.getFechaPago().getTime()));
            statement.setBoolean(5, cuota.isEstado());

            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean bajarCuota(int idCuota) {
        String query = "UPDATE cuotas SET estadoPago = false WHERE idCuota = ?";

        try (Connection conexion = Conexion.getConnection();
             PreparedStatement statement = conexion.prepareStatement(query)) {

            statement.setInt(1, idCuota);
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Cuota obtenerCuotaPorId(int idCuota) {
        String query = "SELECT idCuota, idPrestamo, numeroCuota, montoPagado, fechaPago, estado FROM cuotas WHERE idCuota = ?";
        Cuota cuota = null;
        PrestamoDaoImpl aux = new PrestamoDaoImpl();

        try (Connection conexion = Conexion.getConnection();
             PreparedStatement statement = conexion.prepareStatement(query)) {

            statement.setInt(1, idCuota);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    cuota = new Cuota();
                    cuota.setIdCuota(resultSet.getInt("idCuota"));

                    cuota.setNumCuota(resultSet.getInt("numeroCuota"));
                    cuota.setMontoAPagar(resultSet.getFloat("montoPagado"));
                    cuota.setFechaPago(resultSet.getDate("fechaPago"));
                    cuota.setEstado(resultSet.getBoolean("estadoPago"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cuota;
    }

	@Override
	public boolean registrarPago(int idCuota) {
		String query = "UPDATE cuotas SET estadoPago = true WHERE idCuota= ?";
		try (Connection conexion = Conexion.getConnection();
				PreparedStatement statement = conexion.prepareStatement(query)) {

			statement.setInt(1, idCuota);

			int filasAfectadas = statement.executeUpdate();

			if (filasAfectadas > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Cuota> listarCuotasPendientesPorPrestamo(int idPrestamo) {
	    String query = "SELECT idCuota, idPrestamo, numeroCuota, montoPagado, fechaPago, estadoPago FROM cuotas WHERE idPrestamo = ? AND estadoPago = false";
	    ArrayList<Cuota> listaCuotasPendientes = new ArrayList<>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        statement.setInt(1, idPrestamo);
	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Cuota cuota = new Cuota();
	                cuota.setIdCuota(resultSet.getInt("idCuota"));
	                cuota.setNumCuota(resultSet.getInt("numeroCuota"));
	                cuota.setMontoAPagar(resultSet.getFloat("montoPagado"));
	                cuota.setFechaPago(resultSet.getDate("fechaPago"));
	                cuota.setEstado(resultSet.getBoolean("estadoPago"));

	                listaCuotasPendientes.add(cuota);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return listaCuotasPendientes;
	}
	
	public ArrayList<Cuota> listarCuotasPorPrestamo(int idPrestamo) {
	    String query = "SELECT idCuota, idPrestamo, numeroCuota, montoPagado, fechaPago, estadoPago FROM cuotas WHERE idPrestamo = ? ";
	    ArrayList<Cuota> listaCuotasPendientes = new ArrayList<>();

	    try (Connection conexion = Conexion.getConnection();
	         PreparedStatement statement = conexion.prepareStatement(query)) {
	        
	        statement.setInt(1, idPrestamo);
	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Cuota cuota = new Cuota();
	                cuota.setIdCuota(resultSet.getInt("idCuota"));
	                cuota.setNumCuota(resultSet.getInt("numeroCuota"));
	                cuota.setMontoAPagar(resultSet.getFloat("montoPagado"));
	                cuota.setFechaPago(resultSet.getDate("fechaPago"));
	                cuota.setEstado(resultSet.getBoolean("estadoPago"));

	                listaCuotasPendientes.add(cuota);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return listaCuotasPendientes;
	}

	@Override
	public String pagarCuotaSP(int idCuota, int idCuenta) {
	    try (Connection conexion = Conexion.getConnection();
	         CallableStatement cst = conexion.prepareCall("CALL spPagarCuota(?, ?)")) {

	        cst.setInt(1, idCuota);
	        cst.setInt(2, idCuenta);

	        cst.execute(); // Ejecuta el procedimiento almacenado

	        return "La cuota se pagó exitosamente."; // Mensaje de éxito si no hay excepciones
	    } catch (SQLException e) {
	        // Captura el mensaje del procedimiento almacenado
	        String errorMessage = e.getMessage();
	        System.err.println("Error al pagar cuota: " + errorMessage);
	        return errorMessage; // Retorna el mensaje del error
	    }
	}



}
