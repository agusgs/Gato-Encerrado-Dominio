package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionUsar extends Accion{
	
	Item item
	Accion accion

	new(){
	}

    override usarAccion() {
        throw new UnsupportedOperationException()
    }
    
    override getNombre() {
    	val name = super.nombre + item.nombre
    	if (accion != null){
    		name + accion.nombre
    	}
	}
}