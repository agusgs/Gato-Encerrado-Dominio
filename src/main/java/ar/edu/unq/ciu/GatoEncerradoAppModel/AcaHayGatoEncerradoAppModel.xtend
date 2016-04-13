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

        if(nuevaHabitacion == null)
            throw new UserException("El nombre de la habitacion no puede estar vacio")

        var habitacionNueva = new Habitacion

        habitacionNueva.setNombre(nuevaHabitacion)

        laberintoSeleccionado.agregarHabitacion(habitacionNueva)
        habitacionSeleccionada = habitacionNueva
        nuevaHabitacion = null

        firePropertyChanged(this, "laberintoSeleccionado", this.laberintoSeleccionado)
    }

    def quitarHabitacion(){
        laberintoSeleccionado.quitarHabitacion(habitacionSeleccionada)

        firePropertyChanged(this, "laberintoSeleccionado", this.laberintoSeleccionado)
    }

    def crearLaberinto(){

        if(nuevoLaberinto == null)
            throw new UserException("El nombre del laberinto no puede estar vacio")

        var laberintoNuevo = new Laberinto
        laberintoNuevo.setNombre(nuevoLaberinto)
        laberintos.add(laberintoNuevo)
        laberintoSeleccionado = laberintoNuevo
        nuevoLaberinto = null

        firePropertyChanged(this, "laberintos", this.laberintos)
    }

    def quitarLaberinto(){
        laberintos.remove(laberintoSeleccionado)

        firePropertyChanged(this, "laberintos", this.laberintos)
    }

    def quitarAccion(){
        habitacionSeleccionada.quitarAccion(accionSeleccionada)

        firePropertyChanged(this, "habitacionSeleccionada", this.habitacionSeleccionada)
    }

}
