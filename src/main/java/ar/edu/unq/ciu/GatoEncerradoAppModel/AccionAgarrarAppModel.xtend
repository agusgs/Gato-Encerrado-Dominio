package ar.edu.unq.ciu.GatoEncerradoAppModel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.Item

@Accessors
@Observable
class AccionAgarrarAppModel {

    Habitacion habitacion
    String nombreNuevoItem

    def agregarAccion(){

        var item = new Item
        item.nombre = nombreNuevoItem

        var nuevaAccion = new AccionAgarrar
        nuevaAccion.nombre = "Elemento - " + nombreNuevoItem
        nuevaAccion.item = item

        habitacion.items.add(item)
    }
}