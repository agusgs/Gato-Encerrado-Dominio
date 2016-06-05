package ar.edu.unq.ciu.GatoEncerradoDominio
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class UsuarioJugador {

    Integer id
    String nombre
    List<Laberinto> laberintos
    List<Laberinto> laberintosGanados

    new(){
    	laberintos = new ArrayList<Laberinto>
    	laberintosGanados = new ArrayList<Laberinto>
    }

    new(Integer id, String nombre, List<Laberinto> laberintos){
        this.id = id
        this.nombre = nombre
        this.laberintos = laberintos
        this.laberintosGanados = new ArrayList<Laberinto>()
    }

    def ganasteUnLaberinto(Laberinto laberinto){
        this.laberintosGanados.add(laberinto)
    }

}