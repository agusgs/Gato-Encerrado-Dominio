package ar.edu.unq.ciu.gato_encerrado_dominio.test.admin

import ar.edu.unq.ciu.gato_encerrado_dominio.Accion
import ar.edu.unq.ciu.gato_encerrado_dominio.Habitacion
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.gato_encerrado_dominio.AccionMover

class TestCrearAccionMoverAOtraHabitacion {
	
	Habitacion unaHabitacion;
	Habitacion otraHabitacion;
	AccionMover unaAccionIrOtraHabitacion;
	
	@Before
	def void setUp(){
		unaHabitacion = new Habitacion
		otraHabitacion = new Habitacion
		unaAccionIrOtraHabitacion = new AccionMover(1)
	}
	
	/**
	 * Pre: A la accion de mover se le pasa una habitacion valida. Como la interfaz va a mostrar un combo 
	 * desplegable para que el  usuario seleccione desde ahi, no hay manera de llegar a la situaci�n de que
	 * la habitacion sea invalida o que no exista 
	 */
	@Test 
	def void testHabitacionInicial() {
		assertEquals(unaHabitacion.getMovimientos.size(),0)
		unaHabitacion.agregarAccionMover(unaAccionIrOtraHabitacion)
		assertEquals(unaHabitacion.getMovimientos.size(),1)
	}
		
}