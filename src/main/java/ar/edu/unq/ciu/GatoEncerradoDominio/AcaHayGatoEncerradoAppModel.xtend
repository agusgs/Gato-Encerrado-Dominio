package ar.edu.unq.ciu.GatoEncerradoDominio
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList

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
        var habitacionNueva = new Habitacion
        habitacionNueva.setNombre(nuevaHabitacion)
        laberintoSeleccionado.agregarHabitacion(habitacionNueva)
        habitacionSeleccionada = habitacionNueva
        nuevaHabitacion = null
    }

    def quitarHabitacion(){
        // esto esta incompleto hay que hacer deep delete
        laberintoSeleccionado.quitarHabitacion(habitacionSeleccionada)
        habitacionSeleccionada = null
    }

    def crearLaberinto(){
        var laberintoNuevo = new Laberinto
        laberintoNuevo.setNombre(nuevoLaberinto)
        laberintos.add(laberintoNuevo)
        laberintoSeleccionado = laberintoNuevo
        nuevoLaberinto = null
    }

    def quitarLaberinto(){
        // deep delete
    }

}