package ar.edu.unq.ciu.GatoEncerradoDominio

class ResultadoMover extends Resultado{
    Habitacion habitacionAMoverse

    new(Habitacion habitacion){
        this.habitacionAMoverse = habitacion
    }

    def override getHabitacionAMoverse(){
        this.habitacionAMoverse
    }
}