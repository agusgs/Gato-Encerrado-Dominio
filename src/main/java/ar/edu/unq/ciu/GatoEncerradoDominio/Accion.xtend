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

	abstract def void usarAccion()
	abstract def void usarAccion(Habitacion hab)
	abstract def Object respuesta(Habitacion hab, UsuarioJugador us, Inventario inv)

    def ejecutar(Juego juego){
        if(!(this.habilitada)){
            throw new AccionNoHabilitada
        }
    }

    def habilitar(){
        this.habilitada = true
    }
}