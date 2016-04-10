package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover

class TestCrearAccionMoverAOtraHabitacion {
	
	Habitacion unaHabitacion;
	Habitacion otraHabitacion;
	Accion unaAccionIrOtraHabitacion;
	
	@Before
	def void setUp(){
		unaHabitacion = new Habitacion
		otraHabitacion = new Habitacion
		unaAccionIrOtraHabitacion = new AccionMover()
	}
	
	/**
	 * Pre: A la accion de mover se le pasa una habitacion valida. Como la interfaz va a mostrar un combo 
	 * desplegable para que el  usuario seleccione desde ahi, no hay manera de llegar a la situaci�n de que
	 * la habitacion sea invalida o que no exista 
	 */
	@Test 
	def void testHabitacionInicial() {
		assertEquals(unaHabitacion.getAcciones.size(),0)
		unaHabitacion.agregarAccion(unaAccionIrOtraHabitacion)
		assertEquals(unaHabitacion.getAcciones.size(),1)
	}
		
}