package ar.edu.unq.ciu.appHelpers

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import ar.edu.unq.ciu.GatoEncerradoDominio.Item

class HabitacionFactory {

    HashMap<String, Object> habitacionHash

    def static para(HashMap<String, Object> habitacion){
        val factory = new HabitacionFactory
        factory.habitacionHash = habitacion
        factory
    }

    def construir(){
        var habitacionConstruida = new Habitacion

        habitacionConstruida.setId(Integer.parseInt(habitacionHash.get('id').toString))
        habitacionConstruida.nombre = (habitacionHash.get('nombre').toString)
        habitacionConstruida.isInicial = contruirComoBooleano(habitacionHash.get('isInicial').toString)
        habitacionConstruida.isFinal = contruirComoBooleano(habitacionHash.get('isFinal').toString)
        habitacionConstruida.acciones = (construirAcciones(habitacionHash.get('acciones')))
        habitacionConstruida.items = (construitItems(habitacionHash.get('items')))

        habitacionConstruida
    }

    def contruirComoBooleano(String booleanString){
        if(booleanString == 'false'){
            return false
        }
        if(booleanString == 'true'){
            true
        }
    }

    def construirAcciones(Object accionesObject){
        val accionesHashList = accionesObject as List<HashMap<String, Object>>
        val acciones = new ArrayList<Accion>

        accionesHashList.forEach[
            accionHash |
            acciones.add(AccionFactory.para(accionHash).construir)
        ]

        acciones
    }

    def construitItems(Object itemsObject){
        val itemsHashList = itemsObject as List<HashMap<String, Object>>
        val items = new ArrayList<Item>

        itemsHashList.forEach[
            itemHash |
            items.add(ItemFactory.para(itemHash).construir)
        ]

        items
    }
}