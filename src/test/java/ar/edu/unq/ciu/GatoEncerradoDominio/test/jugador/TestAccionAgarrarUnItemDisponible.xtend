package ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador

import ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador.LaberintoSetUp
import static org.junit.Assert.*;
import org.junit.Test

class TestAccionAgarrarUnItemDisponible extends LaberintoSetUp {
	
	@Test
	def testTomarUnItemDisponible(){
		
		unLaberinto.comenzarJuego
		assertEquals(unLaberinto.getInventario().items.size(),0)
		habitacionCero.usarAccionAgarrar(accionAgarrarUno)
		assertEquals(habitacionCero.acciones.size(),3)
		assertEquals(unLaberinto.getInventario().items.size(),1)
		
	}
	
}