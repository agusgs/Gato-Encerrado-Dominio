package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*

class TestLaberinto {
	
	Laberinto lab
	Habitacion hab1
	Habitacion hab2
	Habitacion hab3
	
	@Before
	def void setUp(){
		lab = new Laberinto
		hab1 = new Habitacion
		hab1.isInicial = true
		hab2 = new Habitacion
		hab2.isActual = true
		hab3 = new Habitacion
		lab.agregarHabitacion(hab1)
		lab.agregarHabitacion(hab2)
	}
	
	@Test
	def testSetNombreDistintoDeVacio(){
		lab.setNombre("CasaRosada")
		assertEquals(lab.nombre, "CasaRosada")
	}
	
	@Test
	def testSetNombreVacio(){
		var String error
		try{
			lab.setNombre("")
		}catch(Exception e){
			error = e.message
		}
		assertEquals(error, "Debe completar el nombre del Laberinto")
	}
	
	@Test
	def testAgregarHabitacion(){
		assertEquals(lab.habitaciones.size,2)
		lab.agregarHabitacion(hab3)
		assertEquals(lab.habitaciones.size,3)
	}
	
	@Test
	def testQuitarHabitacion(){
		assertEquals(lab.habitaciones.size,2)
		lab.quitarHabitacion(hab2)
		assertEquals(lab.habitaciones.size,1)
	}
	
	@Test
	def testGetHabitacionInicial(){
		assertEquals(lab.habitacionInicial,hab1)
	}
	
	@Test
	def testComenzarJuego(){
		lab.comenzarJuego
		assertEquals(lab.habitacionActual,lab.habitacionInicial)
	}
	
	@Test
	def testGetHabitacionActual(){
		assertEquals(lab.habitacionActual,hab2)
	}
	
	@Test
	def testCantidadDeHabitaciones(){
		assertEquals(lab.cantidadDeHabitaciones,2)
	}
	
	@Test
	def testTieneHabitacion(){
		assertTrue(lab.tieneHabitacion(hab2))
		lab.quitarHabitacion(hab3)
		assertFalse(lab.tieneHabitacion(hab3))
	}
}