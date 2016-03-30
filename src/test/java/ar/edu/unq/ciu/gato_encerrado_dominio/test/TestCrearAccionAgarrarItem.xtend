package ar.edu.unq.ciu.gato_encerrado_dominio.test

import org.junit.Before
import org.junit.Test
import ar.edu.unq.ciu.gato_encerrado_dominio.Habitacion
import static org.junit.Assert.*;
import ar.edu.unq.ciu.gato_encerrado_dominio.Accion
import ar.edu.unq.ciu.gato_encerrado_dominio.AccionAgarrar

class TestCrearAccionAgarrarItem {
	
	Habitacion unaHabitacion;
	Accion unaAccionAgarrarElem;
	
	@Before
	def void setUp(){
		unaHabitacion = new Habitacion
		unaAccionAgarrarElem = new AccionAgarrar("Cuchillo")
	}
	
	@Test 
	def void testHabitacionInicial() {
		assertEquals(unaHabitacion.getAcciones.size(),0)
		unaHabitacion.agregarAccion(unaAccionAgarrarElem)
		assertEquals(unaHabitacion.getAcciones.size(),1)
	}
	
}