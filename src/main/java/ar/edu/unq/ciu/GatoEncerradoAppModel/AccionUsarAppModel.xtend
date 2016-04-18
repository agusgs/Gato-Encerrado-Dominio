package ar.edu.unq.ciu.GatoEncerradoAppModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.Item

@Accessors
@Observable
class AccionUsarAppModel {
	
	Laberinto laberinto
	Habitacion habitacion
    Item itemSeleccionado
    Accion accionUsar
    boolean tieneAccion

	new (){
		accionUsar = null
		tieneAccion = false
	}

	def items(){
        val items = new ArrayList<Accion>
        laberinto.habitaciones.forEach[habitacion| items.addAll(habitacion.acciones)]

		items
	}
	
	def agregarAccion(){

        var nuevaAccion = new AccionUsar
        nuevaAccion.nombre = "Usar "
        habitacion.acciones.add(nuevaAccion)
    }

    def hayAccion(){
    	tieneAccion = accionUsar != null
    }

}