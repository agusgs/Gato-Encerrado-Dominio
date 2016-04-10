package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion

/**
 * Consideraciones:
 * una habitacion puede ser inicial y final al mismo tiempo
 */
class TestHabitacionInicial {
	
	Habitacion unaHabitacion;
	
	@Before
	def void setUp(){
		unaHabitacion = new Habitacion
		unaHabitacion.setIsInicial(true)
	}
	
	@Test 
	def void testHabitacionInicial() {
		assertTrue(unaHabitacion.getIsInicial)
	}
}