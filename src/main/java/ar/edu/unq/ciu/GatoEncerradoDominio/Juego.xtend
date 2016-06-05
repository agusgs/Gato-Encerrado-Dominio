package ar.edu.unq.ciu.GatoEncerradoDominio

import ar.edu.unq.ciu.exceptions.Ganaste
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Juego {

    UsuarioJugador usuario
    Laberinto laberinto
    Inventario inventario
    Resultado resultado

    new(UsuarioJugador usuario, Laberinto laberinto){
        this.usuario = usuario
        this.laberinto = laberinto
        this.inventario = new Inventario
    }

    def realizarAccion(Integer idHabitacion, Integer idAccion){
        laberinto.habitacion(idHabitacion).accion(idAccion).ejecutar(this)
        resultado
    }

    def itemNuevo(Item item){
        inventario.agregarItem(item)
        resultado = new ResultadoAgarrar(item)
    }

    def ganar(){
        usuario.ganasteUnLaberinto(laberinto)
        resultado = new ResultadoGanar()
    }

    def pasarAHabitacion(Habitacion habitacion){
        resultado = new ResultadoMover(habitacion)
    }

    def nuevaAccionHabilitada(Accion accion){
        resultado = new ResultadoUsar(accion)
    }

    def tieneItem(Item item){
        inventario.tieneItem(item)
    }

    def itemUsado(Item item){
        inventario.quitarItem(item)
    }
}