package ar.edu.unq.ciu.GatoEncerradoDominio.test.jugador

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.junit.Before
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover

abstract class LaberintoSetUp {
		
	protected Laberinto unLaberinto
	protected Laberinto otroLaberinto
	
	protected Habitacion habitacionUnica	
	protected Habitacion habitacionCero	
	protected Habitacion habitacionUno
	protected Habitacion habitacionDos
	protected Habitacion habitacionTres
	protected Habitacion habitacionCuatro
	protected Habitacion habitacionCinco
	protected Habitacion habitacionSeis
	protected Habitacion habitacionSiete
	protected Habitacion habitacionOcho
	protected Habitacion habitacionNueve
	
	Accion unItemCuchillo
	Accion unItemPala
	Accion unItemMadera
	Accion unItemPiedra
	
	protected Accion accionAgarrarUno
	Accion accionAgarrarDos
	Accion accionAgarrarCinco
	Accion accionAgarrarSiete
	protected AccionMover accionMoverTres

	@Before
	def void setUp(){
		
		unLaberinto = new Laberinto("Laberinto del Minotauro")
		otroLaberinto = new Laberinto("Laberinto Casa")

		habitacionCero = new Habitacion("cero")
		habitacionUno = new Habitacion("uno")
		habitacionDos = new Habitacion("dos")
		habitacionTres = new Habitacion("tres")
		habitacionCuatro = new Habitacion("cuatro")
		habitacionCinco = new Habitacion("cinco")
		habitacionSeis = new Habitacion("seis")
		habitacionSiete = new Habitacion("siete")
		habitacionOcho = new Habitacion("ocho")
		habitacionNueve = new Habitacion("nueve")

		unItemCuchillo = new AccionMover(habitacionTres)
		unItemPala = new AccionUsar
		unItemMadera = new AccionMover
		unItemPiedra = new AccionUsar
		
		habitacionCero.isInicial = true
		habitacionNueve.isFinal = true
		
		habitacionUnica = new Habitacion("unica")
		habitacionUnica.isInicial = true
		habitacionUnica.isFinal = true
		otroLaberinto.agregarHabitacion(habitacionUnica)
		
//		accionAgarrarUno = new AccionAgarrar(unItemCuchillo)
//		accionAgarrarDos = new AccionAgarrar(unItemPala)
//		accionAgarrarCinco = new AccionAgarrar(unItemMadera)
//		accionAgarrarSiete = new AccionAgarrar(unItemPiedra)
		accionMoverTres = new AccionMover
		accionMoverTres.setHabitacion(habitacionTres)
		habitacionCero.agregarAccion(accionMoverTres)
		
		habitacionCero.agregarAccion(accionAgarrarUno)
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