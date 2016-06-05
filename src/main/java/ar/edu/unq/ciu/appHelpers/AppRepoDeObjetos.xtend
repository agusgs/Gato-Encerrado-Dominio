package ar.edu.unq.ciu.appHelpers

import ar.edu.unq.ciu.GatoEncerradoDominio.Juego
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioJugador
import ar.edu.unq.ciu.errores.NoExisteAccionParaHabitacion
import ar.edu.unq.ciu.errores.NoExisteElUsuario
import ar.edu.unq.ciu.errores.NoExisteHabitacionParaElUsuario
import ar.edu.unq.ciu.errores.NoExisteLaberintoParaUsuario
import ar.edu.unq.ciu.errores.UsuarioYaTieneJuegoActivo
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AppRepoDeObjetos {

    List<UsuarioJugador> usuarios
    List<Juego> juegos

    def iniciarJuego(Integer idUsuario, Integer idLaberinto){
        validarExistenciaDeUsuario(idUsuario)
        validarExistenciaDeLaberintoParaUsuario(idUsuario, idLaberinto)

        juegoNuevoParaUsuarioLaberinto(idUsuario, idLaberinto)
    }

    def juegoNuevoParaUsuarioLaberinto(Integer idUsuario, Integer idLaberinto){
        validarJuegoYaIniciadoParaUsuario(idUsuario)

        var usuario = getUsuarioById(idUsuario)
        var laberinto = getLaberintoByUsuarioIdLaberintoId(idUsuario, idLaberinto)

        juegos.add(new Juego(usuario, laberinto))

        laberinto
    }


    def laberintosDe(Integer usuarioId){
        validarExistenciaDeUsuario(usuarioId)
        getLaberintosByUsuarioId(usuarioId)
    }

    def accion(Integer idUsuario, Integer idHabitacion, Integer idAccion){
        validarExistenciaDeUsuario(idUsuario)
        validarExistenciaDeHabitacionParaUsuario(idHabitacion, idUsuario)
        validarExistenciaDeAccionEnHabitacion(idUsuario, idHabitacion, idAccion)

        getJuegoByUsuarioId(idUsuario).realizarAccion(idHabitacion, idAccion)
    }

    def getJuegoByUsuarioId(Integer idUsuario){
        juegos.findFirst[juego | juego.usuario.id == idUsuario]
    }

    def validarExistenciaDeUsuario(Integer usuarioId){
        if(!(existeElUsuario(usuarioId))) {
            throw new NoExisteElUsuario
        }
    }

    def validarExistenciaDeLaberintoParaUsuario(Integer idUsuario, Integer idLaberinto){
        if(!(existeElLaberinto(idUsuario, idLaberinto))) {
            throw new NoExisteLaberintoParaUsuario(idUsuario, idLaberinto)
        }
    }

    def validarExistenciaDeHabitacionParaUsuario(Integer idHabitacion, Integer idUsuario){
        if(!(existeLaHabitacion(idHabitacion, idUsuario))) {
            throw new NoExisteHabitacionParaElUsuario(idHabitacion, idUsuario)
        }

    }

    def validarExistenciaDeAccionEnHabitacion(Integer idUsuario, Integer idHabitacion, Integer idAccion){
        if(!(existeLaAccion(idUsuario, idHabitacion, idAccion))){
            throw new NoExisteAccionParaHabitacion(idHabitacion, idAccion)
        }
    }

    def validarJuegoYaIniciadoParaUsuario(Integer idUsuario){
        if(existeJuegoParUsuario(idUsuario)){
            throw new UsuarioYaTieneJuegoActivo()
        }
    }

    def existeJuegoParUsuario(Integer idUsuario){
        juegos.exists[juego | juego.usuario.id == idUsuario]
    }

    def existeElUsuario(Integer idDeUsuario){
        usuarios.exists[usuario| usuario.id == idDeUsuario]
    }

    def existeElLaberinto(Integer idUsuario, Integer idLaberinto){
        getLaberintosByUsuarioId(idUsuario).exists[laberinto| laberinto.id == idLaberinto]
    }

    def existeLaHabitacion(Integer idHabitacion, Integer idUsuario){
        false
        // TODO implementar
    }

    def existeLaAccion(Integer idUsuario, Integer idHabitacion, Integer idAccion){
        false
        // TODO implementar
    }

    def getLaberintosByUsuarioId(Integer idUsuario){
        usuarios.findFirst[usuario | usuario.id == idUsuario].laberintos
    }

    def getLaberintoByUsuarioIdLaberintoId(Integer idUsuario, Integer idLaberinto){
        getLaberintosByUsuarioId(idUsuario).findFirst[laberinto | laberinto.id == idLaberinto]
    }

    def getUsuarioById(Integer idUsuario){
        usuarios.findFirst[usuario| usuario.id == idUsuario]
    }

    new(){
        usuarios = armarUsuarios()
    }

    private def armarUsuarios(){
        var pepe = new UsuarioJugador(1, 'pepe', laberintosDePepe)
        newArrayList(pepe)
    }

    private def laberintosDePepe(){
        newArrayList(new CastilloLaberinto().CASTILLO)
    }
}