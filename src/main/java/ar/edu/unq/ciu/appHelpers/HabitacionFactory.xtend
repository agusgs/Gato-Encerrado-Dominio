package ar.edu.unq.ciu.appHelpers

import java.util.HashMap
import com.sun.xml.internal.bind.v2.TODO
import java.util.List

class HabitacionFactory {

    static HashMap<String, String> habitacionHash

    def static para(HashMap<String, String> habitacion){
        habitacionHash = habitacion
    }

    def construir(){
        var habitacionConstruida = new Habitacion

        habitacionConstruida.setId(Integer.parseInt(habitacionHash.get('id')))
        habitacionConstruida.setNombre(habitacionHash.get('nombre'))
        habitacionConstruida.setPathImagen(habitacionHash.get('isInicial'))
        habitacionConstruida.setPathImagen(habitacionHash.get('isFinal'))
        habitacionConstruida.setPathImagen(habitacionHash.get('isFinal'))
        habitacionConstruida.setHabitaciones(construirAcciones(habitacionHash.get('acciones')))
        habitacionConstruida.setHabitaciones(construirItems(habitacionHash.get('items')))

    }

    def construirAcciones(List<HashMap<String, String>> accionesHashList){
        // TODO implementar este metodo y el factory
    }

    def construitItems(List<HashMap<String, String>> itemsHashList){
        // TODO implementar este metodo y el factory
    }
}