package ar.edu.unq.ciu.gato_encerrado_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Habitacion {
	
	Boolean esInicial
	Boolean esFinal
	ArrayList<Accion> acciones
	
	new (){
		acciones = new ArrayList
	}
	
	def agregarAccion(Accion accion) {
		acciones.add(accion)
	}
	
}