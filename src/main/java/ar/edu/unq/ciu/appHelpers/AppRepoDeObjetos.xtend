package ar.edu.unq.ciu.appHelpers

import ar.edu.unq.ciu.GatoEncerradoDominio.Juego
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioJugador
import ar.edu.unq.ciu.errores.NoExisteElUsuario
import ar.edu.unq.ciu.errores.NoExisteLaberintoParaUsuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.exceptions.ContraseniaIncorrecta

@Accessors
class AppRepoDeObjetos {

    List<UsuarioJugador> usuarios
    List<Juego> juegos

    def login(String usuario, String password){
        validarPassword(getUsuarioByName(usuario), password)
    }

    def validarPassword(UsuarioJugador usuario, String password){
        if(!(usuario.password == password)){
            throw new ContraseniaIncorrecta
        }
    }
    def getUsuarioByName(String nombreUsuario){
        usuarios.findFirst[usuario | usuario.nombre == nombreUsuario]
    }

    def laberintoDeUsuario(Integer idUsuario, Integer idLaberinto){
        validarExistenciaDeUsuario(idUsuario)
        validarExistenciaDeLaberintoParaUsuario(idUsuario, idLaberinto)

        getLaberintoByUsuarioIdLaberintoId(idUsuario, idLaberinto)
    }

    def iniciarJuego(Integer idUsuario, Integer idLaberinto){
        validarExistenciaDeUsuario(idUsuario)
        validarExistenciaDeLaberintoParaUsuario(idUsuario, idLaberinto)

        juegoNuevoParaUsuarioLaberinto(idUsuario, idLaberinto)
    }

    def juegoNuevoParaUsuarioLaberinto(Integer idUsuario, Integer idLaberinto){
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

    def existeJuegoParUsuario(Integer idUsuario){
        juegos.exists[juego | juego.usuario.id == idUsuario]
    }

    def existeElUsuario(Integer idDeUsuario){
        usuarios.exists[usuario| usuario.id == idDeUsuario]
    }

    def existeElLaberinto(Integer idUsuario, Integer idLaberinto){
        getLaberintosByUsuarioId(idUsuario).exists[laberinto| laberinto.id == idLaberinto]
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
        juegos = newArrayList()
    }

    private def armarUsuarios(){
        var pepe = new UsuarioJugador()
        pepe.setId(1)
        pepe.setNombre("pepe")
        pepe.setPassword("pass")
        pepe.setLaberintos(laberintosDePepe)
        newArrayList(pepe)
    }

    private def laberintosDePepe(){
        newArrayList(new CastilloLaberinto().CASTILLO)
    }
}