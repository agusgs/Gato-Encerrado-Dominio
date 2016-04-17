package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoAppModel.AcaHayGatoEncerradoAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import ar.edu.unq.ciu.GatoEncerradoDominio.Usuario

import org.uqbar.commons.model.UserException

import org.junit.Test
import static org.junit.Assert.*

class TestAcaHayGatoEncerradoAppModel {

    @Test
    def noSeDebePoderCrearUnaHabitacionSinNombre(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario
        var lab1 = new Laberinto

        appModel.usuario.laberintos = newArrayList(lab1)
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

        assertEquals(exeption, "¿Vas a crear una habitacion sin nombre?... Naaah ponele un nombre mejor :D")
        assertEquals(appModel.habitacionSeleccionada, habitacionSeleccionadaAntes)
        assertEquals(appModel.laberintoSeleccionado.cantidadDeHabitaciones, cantidadDeHabitacionesAntes)
    }

    @Test
    def cuandoCreoUnaHabitacionNuevaLaCantidadDeHabitacionesDelLaberintoSeleccionadoDebeAumentarEnUno(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario
        var lab1 = new Laberinto

        appModel.usuario.laberintos = newArrayList(lab1)
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
        appModel.usuario = new Usuario
        var lab1 = new Laberinto

        appModel.usuario.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1

        var habitacionSeleccionadaAntes = appModel.habitacionSeleccionada

        appModel.nuevaHabitacion = "hab1"
        appModel.crearHabitacion()

        assertFalse(appModel.habitacionSeleccionada == habitacionSeleccionadaAntes)
    }

    @Test
    def noSeDebePoderQuitarUnaHabitacionDeUnLaberintoQueNoTenga(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario
        var lab1 = new Laberinto

        appModel.usuario.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1

        var String exeption = null

        try {
            appModel.quitarHabitacion()
        } catch(UserException e) {
            exeption = e.message
        }

        assertEquals(exeption, "No hay habitaciones. Deberias crear una antes si queres quitarla ;)")
    }

    @Test
    def noSeDebePoderQuitarUnaHabitacionSiNoHayUnaHabitacionSeleccionada(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario
        var lab1 = new Laberinto

        appModel.usuario.laberintos = newArrayList(lab1)
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

        assertEquals(exeption, "Deberias seleccionar una habitacion para poder quitarla")
    }

    @Test
    def siQuitoUnaHabitacionDelLaberintoSeleccionadoEstaNoDebeQuedarSeleccionada(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario
        var lab1 = new Laberinto

        appModel.usuario.laberintos = newArrayList(lab1)
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
        appModel.usuario = new Usuario
        var lab1 = new Laberinto

        appModel.usuario.laberintos = newArrayList(lab1)
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
        appModel.usuario = new Usuario

        var cantidadAntesDeNuevoLaberinto = appModel.usuario.laberintos.size
        var seleccionadoAntesDeNuevoLaberinto = appModel.laberintoSeleccionado

        appModel.nuevoLaberinto = null

        var String exception = null

        try {
            appModel.crearLaberinto()
        } catch(UserException e) {
            exception = e.message
        }

        assertEquals(exception, "¿Vas a crear una habitacion sin nombre?... Naaah ponele un nombre mejor :D")
        assertEquals(appModel.usuario.laberintos.size, cantidadAntesDeNuevoLaberinto)
        assertEquals(appModel.laberintoSeleccionado, seleccionadoAntesDeNuevoLaberinto)
    }

    @Test
    def cuandoCreoUnLaberintoNuevoLaCantidadDeLaberintosDebeAumentarEnUno(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        var cantAntesDeCrearLaberinto = appModel.usuario.laberintos.size

        appModel.nuevoLaberinto = "nuevo laberinto 1"
        appModel.crearLaberinto

        var cantDespuesDeCrearLaberinto = appModel.usuario.laberintos.size

        assertEquals((cantDespuesDeCrearLaberinto - cantAntesDeCrearLaberinto), 1)
    }

    @Test
    def cuandoCreoUnLaberintoNuevoElLaberintoSeleccionadoDebeSerElCreado(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        var nombreLaberintoNuevo = "laberinto nuevo 2"

        appModel.nuevoLaberinto = nombreLaberintoNuevo
        appModel.crearLaberinto

        assertEquals(appModel.laberintoSeleccionado.nombre, nombreLaberintoNuevo)
    }

    @Test
    def cuandoQuitoUnLaberintoDebeEliminarseElLaberintoSeleccionadoDeLaListaDeLaberintos(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        val laberinto = new Laberinto
        laberinto.nombre = "Laberinto 3"

        appModel.usuario.laberintos.add(laberinto)
        appModel.laberintoSeleccionado = laberinto

        appModel.quitarLaberinto

        assertFalse(appModel.usuario.laberintos.exists([lab| lab == laberinto]))
    }

    @Test
    def cuandoQuitoUnLaberintoElLaberintoSeleccionadoNoDebeSerElMismoQueSeElimino(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        val laberinto = new Laberinto
        laberinto.nombre = "Laberinto 3"

        appModel.usuario.laberintos.add(laberinto)
        appModel.laberintoSeleccionado = laberinto

        appModel.quitarLaberinto

        assertTrue(appModel.laberintoSeleccionado != laberinto)
    }

    @Test
    def noSePuedeQuitarUnLaberintoSiNoHayNingunoSeleccionado(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        val laberinto = new Laberinto
        laberinto.nombre = "Laberinto 3"

        appModel.usuario.laberintos.add(laberinto)

        var cantidadAntesDeQuitarLaberinto = appModel.usuario.laberintos.size
        var exception = ""

        try {
            appModel.quitarLaberinto
        } catch(UserException e) {
            exception = e.message
        }

        assertEquals("No hay ningun laberinto seleccionado", exception)
        assertEquals(cantidadAntesDeQuitarLaberinto, appModel.usuario.laberintos.size)
    }

    @Test
    def noSePuedeQuitarUnLaberintoSiNoHay(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario
        var exception = ""

        try {
            appModel.quitarLaberinto
        } catch(UserException e) {
            exception = e.message
        }

        assertEquals("No hay laberintos. Deberias crear uno antes si queres quitarlo ;)", exception)
    }

    @Test
    def cuandoQuitoUnaAccionDebeEliminarseLaAccionSeleccionadaDeLasAccionesDeLaHabiracionSeleccionada(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        val accion1 = new AccionMover
        accion1.nombre = "accion1"

        var hab1 = new Habitacion
        hab1.nombre = "hab1"
        hab1.acciones = newArrayList(accion1)

        var lab1 = new Laberinto
        lab1.nombre = "lab1"
        lab1.habitaciones = newArrayList(hab1)

        appModel.usuario.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1
        appModel.habitacionSeleccionada = hab1
        appModel.accionSeleccionada = accion1

        appModel.quitarAccion

        assertFalse(appModel.habitacionSeleccionada.acciones.exists([accion| accion == accion1]))
    }

    @Test
    def cuandoQuitoUnaAccionLaAccionSeleccionadaNoDebeSerLaMismaQueSeElimino(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        val accion1 = new AccionMover
        accion1.nombre = "accion1"

        var hab1 = new Habitacion
        hab1.nombre = "hab1"
        hab1.acciones = newArrayList(accion1)

        var lab1 = new Laberinto
        lab1.nombre = "lab1"
        lab1.habitaciones = newArrayList(hab1)

        appModel.usuario.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1
        appModel.habitacionSeleccionada = hab1
        appModel.accionSeleccionada = accion1

        appModel.quitarAccion

        assertTrue(appModel.accionSeleccionada!= accion1)
    }

    @Test
    def noSePuedeQuitarUnaAccionSiNoHayNingunaSeleccionada(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        val accion1 = new AccionMover
        accion1.nombre = "accion1"

        var hab1 = new Habitacion
        hab1.nombre = "hab1"
        hab1.acciones = newArrayList(accion1)

        var lab1 = new Laberinto
        lab1.nombre = "lab1"
        lab1.habitaciones = newArrayList(hab1)

        appModel.usuario.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1
        appModel.habitacionSeleccionada = hab1

        var cantidadAntesDeQuitarAccion = appModel.habitacionSeleccionada.acciones.size
        var exception = ""

        try {
            appModel.quitarAccion
        } catch(UserException e) {
            exception = e.message
        }

        assertEquals("Deberias seleccionar una accion para poder quitarla", exception)
        assertEquals(cantidadAntesDeQuitarAccion, appModel.habitacionSeleccionada.acciones.size)
    }

    @Test
    def noSePuedeQuitarUnaAccionSiNoHay(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        appModel.usuario = new Usuario

        var hab1 = new Habitacion
        hab1.nombre = "hab1"

        var lab1 = new Laberinto
        lab1.nombre = "lab1"
        lab1.habitaciones = newArrayList(hab1)

        appModel.usuario.laberintos = newArrayList(lab1)
        appModel.laberintoSeleccionado = lab1
        appModel.habitacionSeleccionada = hab1

        var exception = ""

        try {
            appModel.quitarAccion
        } catch(UserException e) {
            exception = e.message
        }

        assertEquals("No hay acciones. Deberias crear una antes si queres quitarla ;)", exception)
    }

}