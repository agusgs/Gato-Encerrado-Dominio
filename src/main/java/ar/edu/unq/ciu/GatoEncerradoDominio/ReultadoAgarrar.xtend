package ar.edu.unq.ciu.GatoEncerradoDominio

class ResultadoAgarrar extends Resultado{

    Item itemAgarrado

    new(Item item){
        this.itemAgarrado = item
    }

    def override getItemAgarrado(){
        this.itemAgarrado
    }
}