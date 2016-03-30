package ar.edu.unq.ciu.gato_encerrado_dominio.test.admin

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.gato_encerrado_dominio.Habitacion
import ar.edu.unq.ciu.gato_encerrado_dominio.Laberinto

class TestModificarLaberinto {
	
	Laberinto unLaberinto
	Habitacion unaHabitacion
	Habitacion otraHabitacion
	
	@Before
	def void setUp(){
		unaHabitacion = new Habitacion
		unaHabitacion = new Habitacion
		unLaberinto = new Laberinto("Robo en el museo")
	}
	
	@Test 
	def void testCambiarNombreAlLaberinto() {
		assertEquals(unLaberinto.getNombre,"Robo en el museo")
		unLaberinto.setNombre("Atrapado en la torre")
		assertEquals(unLaberinto.getNombre,"Atrapado en la torre")
	}
	
	@Test
	def void testAgregarHabitacionLaberinto(){
		assertEquals(unLaberinto.getHabitaciones.size(),0)
		unLaberinto.agregarHabitacion(unaHabitacion)
		assertEquals(unLaberinto.getHabitaciones.size(),1)
	}
	
	@Test
	def void testQuitarHabitacion(){
		unLaberinto.agregarHabitacion(unaHabitacion)
		unLaberinto.agregarHabitacion(otraHabitacion)
		assertEquals(unLaberinto.getHabitaciones.size(),2)
		unLaberinto.quitarHabitacion(unaHabitacion)
		assertEquals(unLaberinto.getHabitaciones.size(),1)
	}
	
	@Test
	def void testValidarExistenciaUnivocaDeHabitacionInicial(){
		
	}
}