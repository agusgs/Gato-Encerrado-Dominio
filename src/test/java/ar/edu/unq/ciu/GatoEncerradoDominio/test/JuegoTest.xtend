package ar.edu.unq.ciu.GatoEncerradoDominio.test

import org.junit.Before
import ar.edu.unq.ciu.appHelpers.CastilloLaberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioJugador
import ar.edu.unq.ciu.GatoEncerradoDominio.Juego
import org.junit.Test
import static org.assertj.core.api.Assertions.*

import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.errores.NoExisteAccion
import ar.edu.unq.ciu.errores.NoExisteHabitacion
import ar.edu.unq.ciu.exceptions.AccionNoHabilitada
import ar.edu.unq.ciu.exceptions.NoTieneItemParaAccion

class JuegoTest {

    Laberinto laberinto
    UsuarioJugador usuario
    Juego juego

    @Before
    def void setUp(){
        this.laberinto = new CastilloLaberinto().CASTILLO
        this.usuario = new UsuarioJugador(1, "Agus", newArrayList(this.laberinto))
        this.juego = new Juego(this.usuario, this.laberinto)
     }

    @Test
    def void realizarUnaAccionMoverHabilitada(){
        this.juego.realizarAccion(1, 1)

        assertThat(this.juego.resultado.getHabitacionAMoverse)equals(this.laberinto.habitacion(2))
    }

    @Test
    def void realizarUnaAccionAgarrarHabilitada(){
        this.juego.realizarAccion(1, 2)

        var existeItem = juego.inventario.tieneItem(laberinto.habitacion(1).item(1))

        assertThat(this.juego.resultado.getItemAgarrado)equals(this.laberinto.habitacion(1).item(1))
        assertThat(existeItem).isTrue
    }

    @Test
    def void noSePuedeRealizarUnaAccionInexistente(){
        try{
            this.juego.realizarAccion(1,52)
            failBecauseExceptionWasNotThrown(NoExisteAccion)
        }catch(NoExisteAccion e) {

        }
    }

    @Test
    def void noSePuedeRealizarUnaAccionEnUnaHabitacionInexistente(){
        try{
            this.juego.realizarAccion(12,1)
            failBecauseExceptionWasNotThrown(NoExisteHabitacion)
        }catch(NoExisteHabitacion e) {

        }
    }

    @Test
    def void noSePuedeRealizarUnaAccionNoHabilitada(){
        try{
            this.juego.realizarAccion(2,4)
            failBecauseExceptionWasNotThrown(AccionNoHabilitada)
        }catch(AccionNoHabilitada e) {

        }
    }

    @Test
    def void noSePuedeRealizarUnaAccionUsarSiNoSeTieneElItem(){
        try{
            this.juego.realizarAccion(2,3)
            failBecauseExceptionWasNotThrown(NoTieneItemParaAccion)
        }catch(NoTieneItemParaAccion e) {

        }
    }

    @Test
    def void realizarUnaAccionUsar(){
        this.juego.realizarAccion(1,2)
        this.juego.realizarAccion(2,3)

        var existeItem = juego.inventario.tieneItem(laberinto.habitacion(1).item(1))

        assertThat(existeItem).isFalse
        assertThat(juego.resultado.getAccionHabilitada)equals(laberinto.habitacion(2).accion(3))
    }

    @Test
    def void realizarAccionGanar(){
        this.juego.realizarAccion(3,5)

        assertThat(juego.resultado.ganar)equals("Ganaste")
    }
}