package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

@Accessors
@Observable
class AccionUsarAppModel {
	
	Laberinto laberinto
	Habitacion habitacionActual
	
	def ArrayList<Accion> listadoCompletoDeAcciones(){
		val lista = new ArrayList<Accion>
		for(Habitacion habitacion: laberinto.habitaciones){
			lista.addAll(habitacion.acciones)
			}
		lista
	}
	
}