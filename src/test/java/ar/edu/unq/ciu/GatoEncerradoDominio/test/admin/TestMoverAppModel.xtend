package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoAppModel.MoverAppModel
import org.junit.Before
import org.junit.Test
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import org.uqbar.commons.model.UserException
import static org.junit.Assert.*

class TestMoverAppModel {
	
	Habitacion habitacionSeleccionada
	Habitacion habitacionActual
    MoverAppModel appModel
    AccionMover accionMover
	
	@Before
	def void setUp(){
		habitacionSeleccionada = new Habitacion
		habitacionSeleccionada.nombre = "cocina"
		
		habitacionActual = new Habitacion
		
		appModel = new MoverAppModel
		appModel.habitacionActual = habitacionActual
		appModel.habitacionSeleccionada = habitacionSeleccionada

		accionMover = new AccionMover
		
	}
	
	@Test
	def testParaAgregarUnaAccionDeMoverAUnaHabitacion(){

		accionMover.habitacion = habitacionSeleccionada
		
		assertEquals(appModel.habitacionActual.acciones.size, 0)
		appModel.agregarAccionMover(accionMover)
		assertEquals(appModel.habitacionActual.acciones.size, 1)
		assertEquals(appModel.habitacionActual.acciones.get(0).nombre, "Ir a cocina")
	}
	
	@Test
	def testParaCuandoSeQuiereMoverALaMismaHabitacionQueSeEstaEditando(){
		
		appModel.habitacionSeleccionada = appModel.habitacionActual
		
		var String exception = null

        try {
            appModel.agregarAccionMover(accionMover)
        } catch(UserException e) {
            exception = e.message
        }
        
        assertEquals(exception, "No es posible moverte a la misma habitaciòn en la que te encontras.")
	}

}