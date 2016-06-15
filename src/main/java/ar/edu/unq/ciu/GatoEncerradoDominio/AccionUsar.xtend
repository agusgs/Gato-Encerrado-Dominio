package ar.edu.unq.ciu.GatoEncerradoDominio

import ar.edu.unq.ciu.exceptions.NoTieneItemParaAccion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionUsar extends Accion{
	
	Item item
	Accion accion

	new(){
		tipo = "usar"
	}

	def override ejecutar(Juego juego){
        super.ejecutar(juego)
		validarJuegoTieneItem(juego)
        accion.habilitar
        juego.nuevaAccionHabilitada(accion)
        juego.itemUsado(item)
	}

    def validarJuegoTieneItem(Juego juego){
        if(!(juego.tieneItem(item))){
            throw new NoTieneItemParaAccion
        }
    }
}