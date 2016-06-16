package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.minificados.RespuestaMover

@Accessors
class ResultadoMover extends Resultado{
    Habitacion habitacionAMoverse

    new(){}

    new(Habitacion habitacion){
        this.habitacionAMoverse = habitacion
    }

    def override getHabitacionAMoverse(){
        this.habitacionAMoverse
    }

    override minificate() {
        return new RespuestaMover(habitacionAMoverse)
    }

}