package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import org.junit.Before
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import static org.junit.Assert.*;
import org.junit.Test

class TestCrearAccionUsarItem {
		
	Habitacion unaHabitacion;
	Accion unaAccionUsarElem;
	Accion unItemLlave
	
	@Before
	def void setUp(){
		unItemLlave = new AccionMover()
		unaAccionUsarElem = new AccionUsar(unItemLlave)
		unaHabitacion = new Habitacion("unaHabitacion")
	}
	
	@Test 
	def void testHabitacionInicial() {
		assertEquals(unaHabitacion.getAcciones.size(),0)
		unaHabitacion.agregarAccion(unaAccionUsarElem)
		assertEquals(unaHabitacion.getAcciones.size(),1)
	}
}