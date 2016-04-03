package ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador

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