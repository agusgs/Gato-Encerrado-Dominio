package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

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
}