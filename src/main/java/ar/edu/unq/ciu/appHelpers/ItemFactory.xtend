package ar.edu.unq.ciu.appHelpers

import java.util.HashMap
import ar.edu.unq.ciu.GatoEncerradoDominio.Item

class ItemFactory {
    HashMap<String, Object> itemHash

    def static para(HashMap<String, Object> item){
        val factory = new ItemFactory()
        factory.itemHash = item
        factory
    }

    def construir(){
        var itemConstruido = new Item()

        itemConstruido.setId(Integer.parseInt(itemHash.get('id').toString))
        itemConstruido.setNombre(itemHash.get('nombre').toString)

        itemConstruido
    }
}