package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import org.junit.Before
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar
import static org.junit.Assert.*;
import org.junit.Test
import ar.edu.unq.ciu.GatoEncerradoDominio.Item

class TestCrearAccionUsarItem {
		
	Habitacion unaHabitacion;
	AccionUsar unaAccionUsarElem;
	Item unItemLlave
	
	@Before
	def void setUp(){
		unItemLlave = new Item()
		unaAccionUsarElem = new AccionUsar()
		unaAccionUsarElem.item = unItemLlave
		unaHabitacion = new Habitacion("unaHabitacion")
	}
	
	@Test 
	def void testHabitacionInicial() {
		assertEquals(unaHabitacion.getAcciones.size(),0)
		unaHabitacion.agregarAccion(unaAccionUsarElem)
		assertEquals(unaHabitacion.getAcciones.size(),1)
	}
}