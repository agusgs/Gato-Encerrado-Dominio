package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoAppModel.AcaHayGatoEncerradoAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.uqbar.commons.model.UserException
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestAcaHayGatoEncerradoAppModel {

    @Test
    def noSeDebePoderCrearUnaHabitacionSinNombre(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1
        appModel.nuevaHabitacion = null

        var habitacionSeleccionadaAntes = appModel.habitacionSeleccionada
        var cantidadDeHabitacionesAntes = appModel.laberintoSeleccionado.cantidadDeHabitaciones

        var String exeption = null

        try {
            appModel.crearHabitacion()
        } catch(UserException e) {
            exeption = e.message
        }

        assertEquals(exeption, "El nombre de la habitacion no puede estar vacio")
        assertEquals(appModel.habitacionSeleccionada, habitacionSeleccionadaAntes)
        assertEquals(appModel.laberintoSeleccionado.cantidadDeHabitaciones, cantidadDeHabitacionesAntes)
    }

    @Test
    def cuandoCreoUnaHabitacionNuevaLaCantidadDeHabitacionesDelLaberintoSeleccionadoDebeAumentarEnUno(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1

        var cantAntesDeCrearHabitacion = appModel.getLaberintoSeleccionado.cantidadDeHabitaciones()

        appModel.nuevaHabitacion = "hab1"
        appModel.crearHabitacion()

        var cantDespuesDeCrearHabitacion = appModel.getLaberintoSeleccionado.cantidadDeHabitaciones()

        assertEquals((cantDespuesDeCrearHabitacion - cantAntesDeCrearHabitacion), 1)
    }

    @Test
    def cuandoCreoUnaHabitacionNuevaLaHabitacionSeleccionadaDebeCambiarPorUnaNueva(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1

        var habitacionSeleccionadaAntes = appModel.habitacionSeleccionada

        appModel.nuevaHabitacion = "hab1"
        appModel.crearHabitacion()

        assertFalse(appModel.habitacionSeleccionada == habitacionSeleccionadaAntes)
    }

    @Test
    def noSeDebePoderQuitarUnaHabitacionDeUnLaberintoQueNoTenga(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1

        var String exeption = null

        try {
            appModel.quitarHabitacion()
        } catch(UserException e) {
            exeption = e.message
        }

        assertEquals(exeption, "El laberinto seleccionado no tiene habitaciones para quitar")
    }

    @Test
    def noSeDebePoderQuitarUnaHabitacionSiNoHayUnaHabitacionSeleccionada(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1
        appModel.nuevaHabitacion = "hab1"
        appModel.crearHabitacion()
        appModel.habitacionSeleccionada = null

        var String exeption = null

        try {
            appModel.quitarHabitacion()
        } catch(UserException e) {
            exeption = e.message
        }

        assertEquals(exeption, "Tiene que haber una habitacion seleccionada para poder quitarla")
    }

    @Test
    def siQuitoUnaHabitacionDelLaberintoSeleccionadoEstaNoDebeQuedarSeleccionada(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1
        appModel.nuevaHabitacion = "hab1"
        appModel.crearHabitacion()

        var habitacionSeleccionadaAntesDeQuitar = appModel.habitacionSeleccionada

        appModel.quitarHabitacion()

        assertFalse(appModel.habitacionSeleccionada == habitacionSeleccionadaAntesDeQuitar )
    }

    @Test
    def siQuitoUnaHabitacionDelLaberintoSeleccionadoEstaNoDebeEstarEnEl(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1
        appModel.nuevaHabitacion = "hab1"
        appModel.crearHabitacion()

        var habitacionSeleccionadaAntesDeQuitar = appModel.habitacionSeleccionada

        appModel.quitarHabitacion()

        assertFalse(appModel.laberintoSeleccionado.tieneHabitacion(habitacionSeleccionadaAntesDeQuitar))
    }

    @Test
    def noSeDebeCrearUnLaberintoSinNombre(){

        var appModel = new AcaHayGatoEncerradoAppModel()

        var cantidadAntesDeNuevoLaberinto = appModel.laberintos.size
        var seleccionadoAntesDeNuevoLaberinto = appModel.laberintoSeleccionado

        appModel.nuevoLaberinto = null

        var String exception = null

        try {
            appModel.crearLaberinto()
        } catch(UserException e) {
            exception = e.message
        }

        assertEquals(exception, "El nombre del laberinto no puede estar vacio")
        assertEquals(appModel.laberintos.size, cantidadAntesDeNuevoLaberinto)
        assertEquals(appModel.laberintoSeleccionado, seleccionadoAntesDeNuevoLaberinto)
    }

    @Test
    def cuandoCreoUnLaberintoNuevoLaCantidadDeLaberintosDebeAumentarEnUno(){

        var appModel = new AcaHayGatoEncerradoAppModel()

        var cantAntesDeCrearLaberinto = appModel.laberintos.size

        appModel.nuevoLaberinto = "nuevo laberinto 1"
        appModel.crearLaberinto

        var cantDespuesDeCrearLaberinto = appModel.laberintos.size

        assertEquals((cantDespuesDeCrearLaberinto - cantAntesDeCrearLaberinto), 1)
    }

    @Test
    def cuandoCreoUnLaberintoNuevoElLaberintoSeleccionadoDebeSerElCreado(){

        var appModel = new AcaHayGatoEncerradoAppModel()

        var nombreLaberintoNuevo = "laberinto nuevo 2"

        appModel.nuevoLaberinto = nombreLaberintoNuevo
        appModel.crearLaberinto

        assertEquals(appModel.laberintoSeleccionado.nombre, nombreLaberintoNuevo)
    }

    @Test
    def cuandoQuitoUnLaberintoDebeEliminarseElLaberintoSeleccionadoDeLaListaDeLaberintos(){

        var appModel = new AcaHayGatoEncerradoAppModel()

        val laberinto = new Laberinto
        laberinto.nombre = "Laberinto 3"

        appModel.laberintos.add(laberinto)
        appModel.laberintoSeleccionado = laberinto

        appModel.quitarLaberinto

        assertFalse(appModel.laberintos.exists([lab| lab == laberinto]))
    }

    @Test
    def cuandoQuitoUnLaberintoElLaberintoSeleccionadoNoDebeSerElMismoQueSeElimino(){

        var appModel = new AcaHayGatoEncerradoAppModel()

        val laberinto = new Laberinto
        laberinto.nombre = "Laberinto 3"

        appModel.laberintos.add(laberinto)
        appModel.laberintoSeleccionado = laberinto

        appModel.quitarLaberinto

        assertTrue(appModel.laberintoSeleccionado != laberinto)
    }

    @Test
    def noSePuedeQuitarUnLaberintoSiNoHayNingunoSeleccionado(){

        var appModel = new AcaHayGatoEncerradoAppModel()

        val laberinto = new Laberinto
        laberinto.nombre = "Laberinto 3"

        appModel.laberintos.add(laberinto)

        var cantidadAntesDeQuitarLaberinto = appModel.laberintos.size
        var exception = ""

        try {
            appModel.quitarLaberinto
        } catch(UserException e) {
            exception = e.message
        }

        assertEquals("No hay ningun laberinto seleccionado", exception)
        assertEquals(cantidadAntesDeQuitarLaberinto, appModel.laberintos.size)
    }


//    def quitarAccion(){
//        habitacionSeleccionada.quitarAccion(accionSeleccionada)
//
//        firePropertyChanged(this, "habitacionSeleccionada", this.habitacionSeleccionada)
//    }
}