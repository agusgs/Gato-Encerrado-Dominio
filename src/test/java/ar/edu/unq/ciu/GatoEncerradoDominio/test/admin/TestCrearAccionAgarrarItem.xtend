package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestCrearAccionAgarrarItem {
	
	Habitacion unaHabitacion;
	Accion unaAccionAgarrarElem;
	Item unItemLlave
	
	@Before
	def void setUp(){
		unItemLlave = new Item(1, "llave")
		unaAccionAgarrarElem = new AccionAgarrar(1, "lala", false, unItemLlave)
		unaHabitacion = new Habitacion("cocina")
	}
	
	@Test
	def void testHabitacionInicial() {
		assertEquals(unaHabitacion.getAcciones.size(),0)
		unaHabitacion.agregarAccion(unaAccionAgarrarElem)
		assertEquals(unaHabitacion.getAcciones.size(),1)
	}
	
}