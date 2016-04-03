package ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador

import ar.edu.unq.ciu.GatoEncerradoDominio.Inventario
import static org.junit.Assert.*;
import org.junit.Test

class TestConocerElInventario extends LaberintoSetUp {
	
	Inventario unInventario
	
	@Test
	def testConocerElInventario(){
		unInventario = new Inventario
		unLaberinto.comenzarJuego
		assertEquals(unLaberinto.getInventario().items.size(),unInventario.items.size())
		assertNotNull(unLaberinto.inventario)
		
	}
	
}