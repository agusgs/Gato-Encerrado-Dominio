package ar.edu.unq.ciu.GatoEncerradoAppModel

import org.eclipse.xtend.lib.annotations.Accessors

import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*
import org.uqbar.commons.model.UserException

import java.util.List
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioAdministrador

@Accessors
@Observable
class AcaHayGatoEncerradoAppModel {

    UsuarioAdministrador usuario
    Laberinto laberintoSeleccionado
    Habitacion habitacionSeleccionada
    Accion accionSeleccionada
    String nuevaHabitacion
    String nuevoLaberinto
    Boolean isHabitacionSeleccionadaNoNula
    Boolean isAccionSeleccionadaNoNula
    Boolean isLaberintoSeleccionadoNoNulo

    new(){
        laberintoSeleccionado = null
        habitacionSeleccionada = null
        accionSeleccionada = null

        isHabitacionSeleccionadaNoNula = false
        isAccionSeleccionadaNoNula = false
        isLaberintoSeleccionadoNoNulo = false
    }

    def crearHabitacion(){

        validarNuevaHabitacionNoNula()

        var habitacionNueva = new Habitacion
        habitacionNueva.setNombre(nuevaHabitacion)

        laberintoSeleccionado.agregarHabitacion(habitacionNueva)
        habitacionSeleccionada = habitacionNueva
        nuevaHabitacion = null
        isHabitacionSeleccionadaNoNula = true

        firePropertyChanged(this, "laberintoSeleccionado", this.laberintoSeleccionado)
    }

    def quitarHabitacion(){

        validarLaberintoSeleccionadoSinHabitaciones()
        validarHabitacionSeleccionadaNoNula()

        laberintoSeleccionado.quitarHabitacion(habitacionSeleccionada)
        habitacionSeleccionada = null
        isHabitacionSeleccionadaNoNula = false

        firePropertyChanged(this, "laberintoSeleccionado", this.laberintoSeleccionado)
    }

    def crearLaberinto(){

        validarNuevoLaberintoNoNulo()

        var laberintoNuevo = new Laberinto
        laberintoNuevo.setNombre(nuevoLaberinto)
        usuario.laberintos.add(laberintoNuevo)
        laberintoSeleccionado = laberintoNuevo
        nuevoLaberinto = null
        isLaberintoSeleccionadoNoNulo = true

        firePropertyChanged(this, "usuario.laberintos", this.usuario.laberintos)
    }

    def quitarLaberinto(){

        validarAppModelSinLaberintos()
        validarLaberintoSeleccionadoNoNulo()

        usuario.laberintos.remove(laberintoSeleccionado)
        laberintoSeleccionado = null
        isLaberintoSeleccionadoNoNulo = false

        firePropertyChanged(this, "usuario.laberintos", this.usuario.laberintos)
    }

    def quitarAccion(){

        validarHabitacionSeleccionadalSinAcciones()
        validarAccionSeleccionadoNoNula()

        habitacionSeleccionada.quitarAccion(accionSeleccionada)
        accionSeleccionada = null
        isAccionSeleccionadaNoNula = false

        firePropertyChanged(this, "habitacionSeleccionada", this.habitacionSeleccionada)
    }

    def agregarAccionAppModel(){
        var agregarAccionAppModel = new AgregarAccionAppModel()

        agregarAccionAppModel.laberinto = laberintoSeleccionado
        agregarAccionAppModel.habitacion = habitacionSeleccionada

        return agregarAccionAppModel
    }

    // VALIDACIONES ...

    def validarHabitacionSeleccionadalSinAcciones(){
        val mensajeDeExcepcion = "No hay acciones. Deberias crear una antes si queres quitarla ;)"
        validarPropiedadListaVacia(habitacionSeleccionada.acciones, mensajeDeExcepcion)
    }

    def validarAccionSeleccionadoNoNula(){
        val mensajeDeExcepcion = "Deberias seleccionar una accion para poder quitarla"
        validarPropiedadNula(accionSeleccionada, mensajeDeExcepcion)
    }

    def validarNuevaHabitacionNoNula(){
        val mensajeDeExcepcion = "¿Vas a crear una habitacion sin nombre?... Naaah ponele un nombre mejor :D"
        validarPropiedadNula(nuevaHabitacion, mensajeDeExcepcion)
    }

    def validarHabitacionSeleccionadaNoNula(){
        val mensajeDeExcepcion = "Deberias seleccionar una habitacion para poder quitarla"
        validarPropiedadNula(habitacionSeleccionada, mensajeDeExcepcion)
    }

    def validarNuevoLaberintoNoNulo(){
        val mensajeDeExcepcion = "¿Vas a crear una habitacion sin nombre?... Naaah ponele un nombre mejor :D"
        validarPropiedadNula(nuevoLaberinto, mensajeDeExcepcion)
    }

    def validarLaberintoSeleccionadoNoNulo(){
        val mensajeDeExcepcion = "No hay ningun laberinto seleccionado"
        validarPropiedadNula(laberintoSeleccionado , mensajeDeExcepcion)
    }

    def validarLaberintoSeleccionadoSinHabitaciones(){
        val mensajeDeExcepcion = "No hay habitaciones. Deberias crear una antes si queres quitarla ;)"
        validarPropiedadListaVacia(laberintoSeleccionado.habitaciones, mensajeDeExcepcion)
    }

    def validarAppModelSinLaberintos(){
        val mensajeDeExcepcion = "No hay laberintos. Deberias crear uno antes si queres quitarlo ;)"
        validarPropiedadListaVacia(usuario.laberintos, mensajeDeExcepcion)
    }

    def validarPropiedadListaVacia(List<?> propiedadLista, String mensajeDeExcepcion){
        if(propiedadLista.isEmpty())
            throw new UserException(mensajeDeExcepcion)
    }

    def validarPropiedadNula(Object propiedad, String mensajeDeExcepcion){
        if(propiedad == null)
            throw new UserException(mensajeDeExcepcion)
    }
}
