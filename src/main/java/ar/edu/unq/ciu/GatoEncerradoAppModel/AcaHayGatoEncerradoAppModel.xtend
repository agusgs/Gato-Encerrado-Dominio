package ar.edu.unq.ciu.GatoEncerradoAppModel

import org.eclipse.xtend.lib.annotations.Accessors

import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*
import org.uqbar.commons.model.UserException

import java.util.List
import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion

@Accessors
@Observable
class AcaHayGatoEncerradoAppModel {

    List<Laberinto> laberintos
    Laberinto laberintoSeleccionado
    Habitacion habitacionSeleccionada
    Accion accionSeleccionada
    String nuevaHabitacion
    String nuevoLaberinto

    new(){
        laberintos = new ArrayList<Laberinto>()
    }

    def crearHabitacion(){

        validarNuevaHabitacionNoNula()

        var habitacionNueva = new Habitacion
        habitacionNueva.setNombre(nuevaHabitacion)

        laberintoSeleccionado.agregarHabitacion(habitacionNueva)
        habitacionSeleccionada = habitacionNueva
        nuevaHabitacion = null

        firePropertyChanged(this, "laberintoSeleccionado", this.laberintoSeleccionado)
    }

    def quitarHabitacion(){

        validarLaberintoSeleccionadoSinHabitaciones()
        validarHabitacionSeleccionadaNoNula()

        laberintoSeleccionado.quitarHabitacion(habitacionSeleccionada)
        habitacionSeleccionada = null

        firePropertyChanged(this, "laberintoSeleccionado", this.laberintoSeleccionado)
    }

    def crearLaberinto(){

        validarNuevoLaberintoNoNulo()

        var laberintoNuevo = new Laberinto
        laberintoNuevo.setNombre(nuevoLaberinto)
        laberintos.add(laberintoNuevo)
        laberintoSeleccionado = laberintoNuevo
        nuevoLaberinto = null

        firePropertyChanged(this, "laberintos", this.laberintos)
    }

    def quitarLaberinto(){

        validarLaberintoSeleccionadoNoNulo()

        laberintos.remove(laberintoSeleccionado)
        laberintoSeleccionado = null

        firePropertyChanged(this, "laberintos", this.laberintos)
    }

    def quitarAccion(){
        habitacionSeleccionada.quitarAccion(accionSeleccionada)

        firePropertyChanged(this, "habitacionSeleccionada", this.habitacionSeleccionada)
    }

// VALIDACIONES ...

    def validarNuevaHabitacionNoNula(){
        val mensajeDeExcepcion = "El nombre de la habitacion no puede estar vacio"
        validarPropiedadNula(nuevaHabitacion, mensajeDeExcepcion)
    }

    def validarHabitacionSeleccionadaNoNula(){
        val mensajeDeExcepcion = "Tiene que haber una habitacion seleccionada para poder quitarla"
        validarPropiedadNula(habitacionSeleccionada, mensajeDeExcepcion)
    }

    def validarNuevoLaberintoNoNulo(){
        val mensajeDeExcepcion = "El nombre del laberinto no puede estar vacio"
        validarPropiedadNula(nuevoLaberinto, mensajeDeExcepcion)
    }

    def validarLaberintoSeleccionadoNoNulo(){
        val mensajeDeExcepcion = "No hay ningun laberinto seleccionado"
        validarPropiedadNula(laberintoSeleccionado , mensajeDeExcepcion)
    }

    def validarLaberintoSeleccionadoSinHabitaciones(){
        if(laberintoSeleccionado.habitaciones.isEmpty)
        throw new UserException("El laberinto seleccionado no tiene habitaciones para quitar")
    }
    
    def validarPropiedadNula(Object propiedad, String mensajeDeExcepcion){
        if(propiedad == null)
            throw new UserException(mensajeDeExcepcion)
    }
}
