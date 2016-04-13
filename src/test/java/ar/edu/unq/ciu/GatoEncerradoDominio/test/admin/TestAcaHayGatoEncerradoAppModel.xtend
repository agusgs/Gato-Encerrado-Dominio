package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoAppModel.AcaHayGatoEncerradoAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.uqbar.commons.model.UserException
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestAcaHayGatoEncerradoAppModel {

    @Test
    def cuandoCreoUnaHabitacionConNombreVacioDebeArrojarUnaUserExeptionYNoCrearLaHabitacion(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.setLaberintos(newArrayList(lab1))
        appModel.setLaberintoSeleccionado(lab1)
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

        assertNotSame(appModel.habitacionSeleccionada, habitacionSeleccionadaAntes)
    }


//
//    def quitarHabitacion(){
//        laberintoSeleccionado.quitarHabitacion(habitacionSeleccionada)
//
//        firePropertyChanged(this, "laberintoSeleccionado", this.laberintoSeleccionado)
//    }
//
//    def crearLaberinto(){
//
//        if(nuevoLaberinto == null)
//            throw new UserException("El nombre del laberinto no puede estar vacio")
//
//        var laberintoNuevo = new Laberinto
//        laberintoNuevo.setNombre(nuevoLaberinto)
//        laberintos.add(laberintoNuevo)
//        laberintoSeleccionado = laberintoNuevo
//        nuevoLaberinto = null
//
//        firePropertyChanged(this, "laberintos", this.laberintos)
//    }
//
//    def quitarLaberinto(){
//        laberintos.remove(laberintoSeleccionado)
//
//        firePropertyChanged(this, "laberintos", this.laberintos)
//    }
//
//    def quitarAccion(){
//        habitacionSeleccionada.quitarAccion(accionSeleccionada)
//
//        firePropertyChanged(this, "habitacionSeleccionada", this.habitacionSeleccionada)
//    }
}