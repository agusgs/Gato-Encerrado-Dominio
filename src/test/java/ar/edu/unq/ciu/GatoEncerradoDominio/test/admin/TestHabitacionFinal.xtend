package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion

class TestHabitacionFinal {
	
	Habitacion unaHabitacion;
	
	@Before
	def void setUp(){
		unaHabitacion = new Habitacion
		unaHabitacion.setIsFinal(true)
	}
	
	@Test 
	def void testHabitacionInicial() {
		assertTrue(unaHabitacion.getIsFinal)
	}
}