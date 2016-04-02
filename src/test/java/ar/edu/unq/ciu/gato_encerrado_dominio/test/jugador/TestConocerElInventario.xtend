package ar.edu.unq.ciu.gato_encerrado_dominio.test.jugador

import ar.edu.unq.ciu.gato_encerrado_dominio.Inventario
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