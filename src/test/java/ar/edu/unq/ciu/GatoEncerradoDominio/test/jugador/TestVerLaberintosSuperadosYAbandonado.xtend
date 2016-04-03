package ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador

import ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador.LaberintoSetUp
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.GatoEncerradoDominio.Jugador

class TestVerLaberintosSuperadosYAbandonado extends LaberintoSetUp {

	@Test
	def testLaberintosAbandonados(){
		var Jugador unJugador = new Jugador
		unJugador.jugar(unLaberinto)
		unLaberinto.comenzarJuego
		unJugador.abandonarLaberinto(unLaberinto)
		assertEquals(unJugador.getLaberintosAbandonados.size(),1)
		assertEquals(unJugador.getLaberintosSuperados.size(),0)
	}

	@Test
	def testLaberintosSuperados(){
		var Jugador unJugador = new Jugador
		unJugador.jugar(otroLaberinto)
		otroLaberinto.comenzarJuego
		unJugador.abandonarLaberinto(otroLaberinto)
		assertEquals(unJugador.getLaberintosAbandonados.size(),0)
		assertEquals(unJugador.getLaberintosSuperados.size(),1)
	}
}