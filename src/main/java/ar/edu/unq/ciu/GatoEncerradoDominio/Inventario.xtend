package ar.edu.unq.ciu.GatoEncerradoDominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Inventario {
	
	Integer id
	String nombre
	String descripcion
	List<Item> items
	int maxCantidad
	
	new(){
		this.items = new ArrayList<Item>()
	}

	def vaciar(){
		items = newArrayList()
	}

	def agregarItem(Item item) {
		items.add(item)
	}

	def quitarItem(Item item){
		items.remove(item)
	}

	def tieneItem(Item item){
		items.exists[itemExistente | itemExistente.id == item.id]
	}
	
}