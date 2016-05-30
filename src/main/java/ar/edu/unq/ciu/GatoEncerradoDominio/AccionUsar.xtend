package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.ciu.minificados.RespuestaUsar

@Accessors
@Observable
class AccionUsar extends Accion{
	
	Item item
	Accion accion

	new(){
		tipo = "usar"
	}

    override usarAccion() {
        accion.usarAccion
    }
    
    override getNombre() {
    	val name = super.nombre + item.nombre
    	if (accion != null){
    		name + accion.nombre
    	}
	}
		
	override usarAccion(Habitacion h) {
		h.acciones.remove(accion)
		this.usarAccion
	}
	
	override respuesta(Habitacion hab, UsuarioJugador us, Inventario inv) {
		var resp = new RespuestaUsar
		resp.inv = inv
		resp
	}
	
}