package ar.edu.unq.ciu.appHelpers

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import java.util.ArrayList
import java.util.HashMap
import java.util.List

class LaberintoFactory {

    HashMap<String, Object> laberintoHash

    def static para(HashMap<String, Object> laberinto){
        val factory = new LaberintoFactory
        factory.laberintoHash = laberinto
        factory
    }

    def construir(){

        var laberintoConstruido = new Laberinto

        laberintoConstruido.setId(Integer.parseInt(laberintoHash.get('id').toString))
        laberintoConstruido.setNombre(laberintoHash.get('nombre').toString)
        laberintoConstruido.setPathImagen(laberintoHash.get('pathImg').toString)
        laberintoConstruido.setHabitaciones(construirHabitaciones(laberintoHash.get('habitaciones')))

        laberintoConstruido
    }

    def construirHabitaciones(Object habitacionesObject){
        val habitacionesHashList = habitacionesObject as List<HashMap<String, Object>>
        val habitaciones = new ArrayList<Habitacion>

        habitacionesHashList.forEach[
            habitacionHash |
            habitaciones.add(HabitacionFactory.para(habitacionHash).construir)
        ]

        habitaciones
    }
}