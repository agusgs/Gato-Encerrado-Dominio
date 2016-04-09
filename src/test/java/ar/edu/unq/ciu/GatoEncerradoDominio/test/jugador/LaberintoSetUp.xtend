package ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.junit.Before

abstract class LaberintoSetUp {
		
	protected Laberinto unLaberinto
	protected Laberinto otroLaberinto
	
	Habitacion habitacionUnica	
	Habitacion habitacionCero	
	Habitacion habitacionUno
	Habitacion habitacionDos
	Habitacion habitacionTres
	Habitacion habitacionCuatro
	Habitacion habitacionCinco
	Habitacion habitacionSeis
	Habitacion habitacionSiete
	Habitacion habitacionOcho
	Habitacion habitacionNueve
	
	Item unItemCuchillo
	Item unItemPala
	Item unItemMadera
	Item unItemPiedra
	
	Accion accionAgarrarUno
	Accion accionAgarrarDos
	Accion accionAgarrarCinco
	Accion accionAgarrarSiete
	
	Accion accionMoverTres
	Accion accionMoverCinco
	Accion accionMoverSeis
	Accion accionMoverNueve
	
	Accion accionUsarItemTres
	Accion accionUsarItemCuatro
	Accion accionUsarItemSeis
	Accion accionUsarItemNueve
	
	/**
	 * Se construye el laberinto de ejemplo que se da en el enunciado para utilizarlo en los test
	 */
	@Before
	def void setUp(){
		
		unLaberinto = new Laberinto("Laberinto del Minotauro")
		otroLaberinto = new Laberinto("Laberinto Casa")
		
		unItemCuchillo = new Item
		unItemPala = new Item
		unItemMadera = new Item
		unItemPiedra = new Item
		
		habitacionCero = new Habitacion
		habitacionUno = new Habitacion
		habitacionDos = new Habitacion
		habitacionTres = new Habitacion
		habitacionCuatro = new Habitacion
		habitacionCinco = new Habitacion
		habitacionSeis = new Habitacion
		habitacionSiete = new Habitacion
		habitacionOcho = new Habitacion
		habitacionNueve = new Habitacion
		
		habitacionCero.esInicial = true
		habitacionNueve.esFinal = true
		
		habitacionUnica = new Habitacion
		habitacionUnica .esInicial = true
		habitacionUnica.esFinal = true
		otroLaberinto.agregarHabitacion(habitacionUnica)
		
		accionAgarrarUno = new AccionAgarrar(unItemCuchillo)
		accionAgarrarDos = new AccionAgarrar(unItemPala)
		accionAgarrarCinco = new AccionAgarrar(unItemMadera)
		accionAgarrarSiete = new AccionAgarrar(unItemPiedra)
		
		habitacionUno.agregarAccion(accionAgarrarUno)
		habitacionDos.agregarAccion(accionAgarrarDos)
		habitacionCinco.agregarAccion(accionAgarrarCinco)
		habitacionSiete.agregarAccion(accionAgarrarSiete)
		
		
		unLaberinto.agregarHabitacion(habitacionCero)
		unLaberinto.agregarHabitacion(habitacionUno)
		unLaberinto.agregarHabitacion(habitacionDos)
		unLaberinto.agregarHabitacion(habitacionTres)
		unLaberinto.agregarHabitacion(habitacionCuatro)
		unLaberinto.agregarHabitacion(habitacionCinco)
		unLaberinto.agregarHabitacion(habitacionSeis)
		unLaberinto.agregarHabitacion(habitacionSiete)
		unLaberinto.agregarHabitacion(habitacionOcho)
		unLaberinto.agregarHabitacion(habitacionNueve)
		
	}
	
}