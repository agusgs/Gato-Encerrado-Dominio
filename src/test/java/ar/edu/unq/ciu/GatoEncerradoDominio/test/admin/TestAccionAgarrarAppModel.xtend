package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import org.junit.Before
import org.junit.Test
import ar.edu.unq.ciu.GatoEncerradoAppModel.AccionAgarrarAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import org.uqbar.commons.model.UserException
import static org.junit.Assert.*

class TestAccionAgarrarAppModel {
	
	Habitacion habitacion
    String nombreNuevoItem
    AccionAgarrarAppModel appModel
    String nombreNuevoItemDuplicado
	
	@Before
	def void setUp(){
		habitacion = new Habitacion
		nombreNuevoItem = "plato"
		appModel = new AccionAgarrarAppModel
		appModel.habitacion = habitacion
		appModel.nombreNuevoItem = nombreNuevoItem
		
		nombreNuevoItemDuplicado = "plato"
	}
	
	@Test
	def testAgregarAccionAgarrarItemAUnaHabitacion(){
		assertEquals(appModel.habitacion.acciones.size, 0)
		assertEquals(appModel.habitacion.items.size, 0)
		appModel.agregarAccion

		assertEquals(appModel.habitacion.acciones.size, 1)
		assertEquals(appModel.habitacion.items.size, 1)
		assertEquals(appModel.habitacion.items.get(0).nombre, "plato")
		assertEquals(appModel.habitacion.acciones.get(0).nombre, "Agarrar plato")
	}
	
	@Test
	def testAgregarAccionAgarrarItemQueYaExisteEnLaHabitacion(){
		appModel.agregarAccion
		assertEquals(appModel.habitacion.acciones.size, 1)
		appModel.nombreNuevoItem = nombreNuevoItemDuplicado
		
		var String exception = null

        try {
            appModel.agregarAccion()
        } catch(UserException e) {
            exception = e.message
        }
        
        assertEquals(exception, "Ese elemento ya se encuentra en la habitacion.")
	}
	
}