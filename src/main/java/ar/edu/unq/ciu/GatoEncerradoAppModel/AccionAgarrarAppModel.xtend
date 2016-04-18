package ar.edu.unq.ciu.GatoEncerradoAppModel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class AccionAgarrarAppModel {

    Habitacion habitacion
    String nombreNuevoItem

    def agregarAccion(){

        var item = new Item
        item.nombre = nombreNuevoItem

        var nuevaAccion = new AccionAgarrar
        nuevaAccion.nombre = "Agarrar "
        nuevaAccion.item = item

		validacionItemDuplicado(item)

        habitacion.items.add(item)
        habitacion.acciones.add(nuevaAccion)
    }
    
    def validacionItemDuplicado(Item item){
		val mensajeDeExcepcion = "Ese elemento ya se encuentra en la habitacion."
        for(Item i: habitacion.items)
        	if(i.nombre.equals(item.nombre))
        		throw new UserException(mensajeDeExcepcion)
	}
}