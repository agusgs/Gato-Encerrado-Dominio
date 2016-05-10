package ar.edu.unq.ciu.controllers
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioJugador
import java.util.List
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class GatoEncerradoRepoDeObjetos {

    List<UsuarioJugador> usuarios

    new(){
        //TODO crear todo el laberinto aca, tiene que haber otro objeto que se encargue de minificar lo que este provee
        usuarios = newArrayList(new UsuarioJugador(1, 'pepe'), new UsuarioJugador(2, 'pepo'), new UsuarioJugador(3, 'pepa'))
    }

    def existeElUsuario(Integer idDeUsuario){
        usuarios.exists[usuario| usuario.id == idDeUsuario]
    }
}