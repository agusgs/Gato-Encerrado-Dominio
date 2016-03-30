package ar.edu.unq.ciu.gato_encerrado_dominio.test

import ar.edu.unq.ciu.gato_encerrado_dominio.Habitacion
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;

class TestHabitacionFinal {
	
	Habitacion unaHabitacion;
	
	@Before
	def void setUp(){
		unaHabitacion = new Habitacion
		unaHabitacion.setEsFinal(true)
	}
	
	@Test 
	def void testHabitacionInicial() {
		assertTrue(unaHabitacion.getEsFinal)
	}
}