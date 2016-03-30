package ar.edu.unq.ciu.gato_encerrado_dominio.test.admin


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.gato_encerrado_dominio.Habitacion

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