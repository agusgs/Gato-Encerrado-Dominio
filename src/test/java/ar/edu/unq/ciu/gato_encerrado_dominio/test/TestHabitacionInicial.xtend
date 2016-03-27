package ar.edu.unq.ciu.gato_encerrado_dominio.test

import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import org.mockito.Mockito
import static org.junit.Assert.*;

class TestHabitacionInicial {
	
	@Mock Habitacion unaHabitacion
	
	@Before
	def void setUp(){
		MockitoAnnotations.initMocks(this);
		unaHabitacion = Mockito.mock(Habitacion.class);
	}
	
	@Test 
	def void testHabitacionInicial() {
		unaHabitacion.setInicial()
		assertTrue(unaHabitacion.inicial())
	}
}