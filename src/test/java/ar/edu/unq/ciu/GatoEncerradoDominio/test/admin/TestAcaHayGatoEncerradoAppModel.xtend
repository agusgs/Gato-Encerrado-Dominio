package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel

class TestAcaHayGatoEncerradoAppModel {

    @Test
    def cuandoCreoUnaHabitacionNuevaLaCantidadDeHabitacionesDelLaberintoSeleccionadoDebeAumentarEnUno(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.setLaberintos(newArrayList(lab1))
        appModel.setLaberintoSeleccionado(lab1)

        var cantAntesDeCrearHabitacion = appModel.getLaberintoSeleccionado.cantidadDeHabitaciones()
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