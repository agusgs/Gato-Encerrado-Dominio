package ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador

import org.junit.Test
import static org.junit.Assert.*;

class TestAccionMoverAUnaHabitacion extends LaberintoSetUp {
	
	@Test
	def void testMover(){
		unLaberinto.comenzarJuego
		assertEquals(unLaberinto.getHabitacionActual,habitacionCero)
		habitacionCero.usarAccionMover(accionMoverTres)
		assertEquals(unLaberinto.getHabitacionActual,habitacionTres)
	}
	
}