package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoAppModel.AcaHayGatoEncerradoAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.junit.Test

import static org.junit.Assert.*

class TestAcaHayGatoEncerradoAppModel {

    @Test
    def cuandoCreoUnaHabitacionNuevaLaCantidadDeHabitacionesDelLaberintoSeleccionadoDebeAumentarEnUno(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.setLaberintos(newArrayList(lab1))
        appModel.setLaberintoSeleccionado(lab1)

        var cantAntesDeCrearHabitacion = appModel.getLaberintoSeleccionado.cantidadDeHabitaciones()
        appModel.nuevaHabitacion = "hab1"
        appModel.crearHabitacion()
        var cantDespuesDeCrearHabitacion = appModel.getLaberintoSeleccionado.cantidadDeHabitaciones()

        assertEquals((cantDespuesDeCrearHabitacion - cantAntesDeCrearHabitacion), 1)
    }

//    def quitarHabitacion(){
//        // esto esta incompleto hay que hacer deep delete
//        laberintoSeleccionado.quitarHabitacion(habitacionSeleccionada)
//        habitacionSeleccionada = null
//    }
//
//    def crearLaberinto(){
//        var laberintoNuevo = new Laberinto
//        laberintoNuevo.setNombre(nuevoLaberinto)
//        laberintos.add(laberintoNuevo)
//        laberintoSeleccionado = laberintoNuevo
//        nuevoLaberinto = null
//    }
//
//    def quitarLaberinto(){
//        // deep delete
//    }
}