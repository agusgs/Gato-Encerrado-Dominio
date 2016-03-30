package ar.edu.unq.ciu.gato_encerrado_dominio.test.admin

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*;
import ar.edu.unq.ciu.gato_encerrado_dominio.Accion
import ar.edu.unq.ciu.gato_encerrado_dominio.Habitacion
import ar.edu.unq.ciu.gato_encerrado_dominio.AccionAgarrar
import ar.edu.unq.ciu.gato_encerrado_dominio.Item

class TestCrearAccionAgarrarItem {
	
	Habitacion unaHabitacion;
	Accion unaAccionAgarrarElem;
	Item unItemCuchillo
	
	@Before
	def void setUp(){
		unItemCuchillo = new Item()
		unaAccionAgarrarElem = new AccionAgarrar(unItemCuchillo)
		unaHabitacion = new Habitacion
	}
	
	@Test 
	def void testHabitacionInicial() {
		assertEquals(unaHabitacion.getAcciones.size(),0)
		unaHabitacion.agregarAccion(unaAccionAgarrarElem)
		assertEquals(unaHabitacion.getAcciones.size(),1)
	}
	
}