package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.minificados.RespuestaAgarrar

@Accessors
class ResultadoAgarrar extends Resultado{

    Item itemAgarrado

    new(){}

    new(Item item){
        this.itemAgarrado = item
    }

    def override getItemAgarrado(){
        this.itemAgarrado
    }

    override minificate() {
        return new RespuestaAgarrar(itemAgarrado)
    }
}