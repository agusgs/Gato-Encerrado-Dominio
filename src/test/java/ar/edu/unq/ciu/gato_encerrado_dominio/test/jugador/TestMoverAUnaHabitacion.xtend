package ar.edu.unq.ciu.gato_encerrado_dominio.test.jugador

import org.junit.Test
import static org.junit.Assert.*;

class TestMoverAUnaHabitacion extends LaberintoSetUp {
	
	@Test
	def void testMover(){
		assertEquals(unLaberinto.posicionActual(),0)
		unLaberinto.moverHabitacionActualA(1)
		assertEquals(unLaberinto.posicionActual(),1)
	}
	
}