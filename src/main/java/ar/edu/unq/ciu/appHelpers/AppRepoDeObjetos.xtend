package ar.edu.unq.ciu.appHelpers

import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioJugador
import ar.edu.unq.ciu.errores.NoExisteElUsuario
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.errores.NoExisteLaberintoParaUsuario

@Accessors
class AppRepoDeObjetos {

    List<UsuarioJugador> usuarios

    def laberinto(Integer idUsuario, Integer idLaberinto){
        validarExistenciaDeUsuario(idUsuario)
        validarExistenciaDeLaberintoParaUsuario(idUsuario, idLaberinto)

        laberintosDe(idUsuario).findFirst[laberinto | laberinto.id == idLaberinto]
    }

    def laberintosDe(Integer usuarioId){
        validarExistenciaDeUsuario(usuarioId)
        usuarios.findFirst[usuario | usuario.id == usuarioId].laberintos
    }

    def existeElUsuario(Integer idDeUsuario){
        usuarios.exists[usuario| usuario.id == idDeUsuario]
    }

    def validarExistenciaDeLaberintoParaUsuario(Integer idUsuario, Integer idLaberinto){
        if(!(existeElLaberinto(idUsuario, idLaberinto))){
            throw new NoExisteLaberintoParaUsuario(idUsuario, idLaberinto)
        }
    }

    def existeElLaberinto(Integer idUsuario, Integer idLaberinto){
        laberintosDe(idUsuario).exists[laberinto| laberinto.id == idLaberinto]
    }

    def validarExistenciaDeUsuario(Integer usuarioId){
        if(!(existeElUsuario(usuarioId))){
            throw new NoExisteElUsuario
        }
    }


    def accion(Integer idUsuario, Integer idHabitacion, Integer idAccion){
//        RepoUsuarios.getInstance.validarExisteUsuario(idUsuario)
//        RepoUsuarios.getInstance.validarExisteHabitacionParaUsuario(idHabitacion, idUsuario)
//        RepoUsuarios.getInstance.validarExisteAccionEnHabitacion(idHabitacion, idAction, idUsuario)
//
//        val habitacion = RepoUsuarios.getInstance.buscarHabitacion(idHabitacion, idUsuario)
//        val accion = RepoUsuarios.getInstance.buscarAccion(habitacion, idAction)
//
//        val accionRealizada = RepoUsuarios.getInstance.respuestaRealizarAccion(habitacion, accion, idUsuario)
        //TODO implementar correctamente esto
    }


    new(){
        usuarios = armarUsuarios()
    }

    private def armarUsuarios(){
        var pepe = new UsuarioJugador(1, 'pepe', laberintosDePepe)
        newArrayList(pepe)
    }

    private def laberintosDePepe(){
        armarLaberintos(new LaberintosDePepe().LABERINTOS)
    }


    private def armarLaberintos(List<HashMap<String, Object>> laberintosListMap){
        val laberintos = new ArrayList<Laberinto>()

        laberintosListMap.forEach[
            laberintoMap |

            laberintos.add(LaberintoFactory.para(laberintoMap).construir)
        ]
        laberintos
    }
}