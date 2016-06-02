package ar.edu.unq.ciu.appHelpers

import java.util.HashMap
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import java.util.List
import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion

class LaberintoFactory {

    static HashMap<String, String> laberintoHash

    def static para(HashMap<String, String> laberinto){
        laberintoHash = laberinto
    }

    def construir(){

        var laberintoConstruido = new Laberinto

        laberintoConstruido.setId(Integer.parseInt(laberintoHash.get('id')))
        laberintoConstruido.setNombre(laberintoHash.get('nombre'))
        laberintoConstruido.setPathImagen(laberintoHash.get('pathImg'))
        laberintoConstruido.setHabitaciones(construirHabitaciones(laberintoHash.get('habitaciones')))
    }

    def construirHabitaciones(List<HashMap<String, String>> habitacionesHashList){
        val habitaciones = new ArrayList<Habitacion>

        habitacionesHashList.forEach[
            habitacionHash |
            habitaciones.add(HabitacionFactory.para(habitacionHash).construir)
        ]

        habitaciones
    }
}