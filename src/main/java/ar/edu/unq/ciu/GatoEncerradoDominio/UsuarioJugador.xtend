package ar.edu.unq.ciu.GatoEncerradoDominio
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioJugador {

    Integer id
    String nombre
    List<Laberinto> laberintos

    new(){
    }

    new(Integer id, String nombre, List<Laberinto> laberintos){
        this.id = id
        this.nombre = nombre
        this.laberintos = laberintos
    }

}