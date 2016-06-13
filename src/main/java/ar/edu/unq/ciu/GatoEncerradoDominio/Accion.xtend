package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.ciu.exceptions.AccionNoHabilitada

@Accessors
@Observable
abstract class Accion {

	Integer id
	String nombre
	String tipo
    Boolean habilitada

    new(){
        this.habilitada = false
    }

    def ejecutar(Juego juego){
        if(!(this.habilitada)){
            throw new AccionNoHabilitada
        }
    }

    def habilitar(){
        this.habilitada = true
    }
}