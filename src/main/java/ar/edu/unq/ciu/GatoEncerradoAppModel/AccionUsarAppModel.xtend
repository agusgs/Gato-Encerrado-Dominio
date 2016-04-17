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
    Accion accionSeleccionada
    Item itemSeleccionado

	def ArrayList<Accion> listadoCompletoDeAcciones(){

        val lista = new ArrayList<Accion>

		for(Habitacion habitacion: laberinto.habitaciones){
			lista.addAll(habitacion.acciones)
		}

		lista
	}
	
}