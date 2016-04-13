package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.uqbar.commons.model.UserException

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel

class TestAcaHayGatoEncerradoAppModel {

    @Test
    def cuandoCreoUnaHabitacionConNombreVacioDebeArrojarUnaUserExeptionYNoCrearLaHabitacion(){

        var appModel = new AcaHayGatoEncerradoAppModel()
        var lab1 = new Laberinto

        appModel.setLaberintos(newArrayList(lab1))
        appModel.setLaberintoSeleccionado(lab1)
        appModel.nuevaHabitacion = null

        var String exeption = null

        try {
            appModel.crearHabitacion()
        } catch(UserException e) {
            exeption = e.message
        }

        assertEquals(exeption, "El nombre de la habitacion no puede estar vacio")
    }

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

//    def crearHabitacion(){
//
//        if(nuevaHabitacion == null)
//            throw new UserException("El nombre de la habitacion no puede estar vacio")
//
//        var habitacionNueva = new Habitacion
//
//        habitacionNueva.setNombre(nuevaHabitacion)
//
//        laberintoSeleccionado.agregarHabitacion(habitacionNueva)
//        habitacionSeleccionada = habitacionNueva
//        nuevaHabitacion = null
//
//        firePropertyChanged(this, "laberintoSeleccionado", this.laberintoSeleccionado)
//    }
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