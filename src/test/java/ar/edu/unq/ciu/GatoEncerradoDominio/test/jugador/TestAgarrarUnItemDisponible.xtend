package ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador

import ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador.LaberintoSetUp
import static org.junit.Assert.*;
import org.junit.Test

class TestAgarrarUnItemDisponible extends LaberintoSetUp {
	
	@Test
	def testTomarUnItemDisponible(){
		
		unLaberinto.comenzarJuego
		assertEquals(unLaberinto.getInventario().items.size(),0)
		
		unLaberinto.moverHabitacionActualA(1)
		assertEquals(unLaberinto.getInventario().items.size(),0)
		
		var i = unLaberinto.indexHabitacionActual
		var hab = unLaberinto.getHabitacion(i)
		assertEquals(hab.acciones.size(),1)
		
		unLaberinto.tomarItem(hab)
		assertEquals(hab.acciones.size(),0)
		assertEquals(unLaberinto.getInventario().items.size(),1)
		
	}
	
}