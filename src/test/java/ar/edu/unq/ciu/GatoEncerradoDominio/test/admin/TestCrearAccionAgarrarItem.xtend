package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*;
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover

class TestCrearAccionAgarrarItem {
	
	Habitacion unaHabitacion;
	Accion unaAccionAgarrarElem;
	Accion unItemLlave
	
	@Before
	def void setUp(){
		unItemLlave = new AccionMover()
		unaAccionAgarrarElem = new AccionAgarrar(unItemLlave)
		unaHabitacion = new Habitacion("cocina")
	}
	
	@Test 
	def void testHabitacionInicial() {
		assertEquals(unaHabitacion.getAcciones.size(),0)
		unaHabitacion.agregarAccion(unaAccionAgarrarElem)
		assertEquals(unaHabitacion.getAcciones.size(),1)
	}
	
}