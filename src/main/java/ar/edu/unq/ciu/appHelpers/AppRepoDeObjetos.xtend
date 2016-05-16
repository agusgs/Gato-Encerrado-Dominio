package ar.edu.unq.ciu.appHelpers
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioJugador
import java.util.List
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import ar.edu.unq.ciu.errores.NoExisteElUsuario
import java.util.HashMap
import java.util.Map

@Accessors
class AppRepoDeObjetos {

    List<UsuarioJugador> usuarios

    new(){
        usuarios = armarUsuarios()
    }

    private def armarUsuarios(){
        var pepe = new UsuarioJugador(1, 'pepe', laberintosDePepe)
        var pepo = new UsuarioJugador(2, 'pepo', laberintosDePepo)
        var pepa = new UsuarioJugador(3, 'pepa', laberintosDePepa)
        newArrayList(pepe, pepo, pepa)
    }

    private def laberintosDePepe(){
        var labCastillo = new HashMap<String, String>
        var labPiramide = new HashMap<String, String>
        var labTuberias = new HashMap<String, String>

        labCastillo.put('id', '1')
        labCastillo.put('nombre', 'castillo')
        labCastillo.put('pathImg', 'un/path')

        labPiramide.put('id', '2')
        labPiramide.put('nombre', 'piramide')
        labPiramide.put('pathImg', 'un/path')

        labTuberias.put('id', '3')
        labTuberias.put('nombre', 'tuberias')
        labTuberias.put('pathImg', 'un/path')

        armarLaberintos(newArrayList(labCastillo, labPiramide, labTuberias))
    }

    private def laberintosDePepo(){
        var labMansion = new HashMap<String, String>
        var labSotano = new HashMap<String, String>
        var labAbandonado = new HashMap<String, String>

        labMansion.put('id', '4')
        labMansion.put('nombre', 'mansion')
        labMansion.put('pathImg', 'un/path')

        labSotano.put('id', '5')
        labSotano.put('nombre', 'sotano')
        labSotano.put('pathImg', 'un/path')

        labAbandonado.put('id', '6')
        labAbandonado.put('nombre', 'abandonado')
        labAbandonado.put('pathImg', 'un/path')

        armarLaberintos(newArrayList(labMansion, labSotano, labAbandonado))
    }

    private def laberintosDePepa(){
        var labCasa = new HashMap<String, String>
        var labRuinasMayas = new HashMap<String, String>
        var labTuneles = new HashMap<String, String>

        labCasa.put('id', '7')
        labCasa.put('nombre', 'casa simple')
        labCasa.put('pathImg', 'un/path')

        labRuinasMayas.put('id', '8')
        labRuinasMayas.put('nombre', 'ruinas mayas')
        labRuinasMayas.put('pathImg', 'un/path')

        labTuneles.put('id', '9')
        labTuneles.put('nombre', 'tuneles de guerra')
        labTuneles.put('pathImg', 'un/path')

        armarLaberintos(newArrayList(labCasa, labRuinasMayas, labTuneles))
    }

    private def armarLaberintos(List<Map<String, String>> parametrosLaberinto){
        val laberintos = new ArrayList<Laberinto>()
        parametrosLaberinto.forEach[
            parametroLaberinto |
            var id = Integer.parseInt(parametroLaberinto.get('id'))
            var nombre = parametroLaberinto.get('nombre')
            var path = parametroLaberinto.get('pathImg')

            laberintos.add(new Laberinto(id, nombre, path))
        ]
        laberintos
    }

    def existeElUsuario(Integer idDeUsuario){
        usuarios.exists[usuario| usuario.id == idDeUsuario]
    }

    def laberintosDe(Integer usuarioId){
        validarExistenciaDe(usuarioId)
        usuarios.findFirst[usuario | usuario.id == usuarioId].laberintos
    }

    def validarExistenciaDe(Integer usuarioId){
        if(!(existeElUsuario(usuarioId))){
            throw new NoExisteElUsuario
        }
    }
}