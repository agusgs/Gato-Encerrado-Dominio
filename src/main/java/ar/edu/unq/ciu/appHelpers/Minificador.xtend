package ar.edu.unq.ciu.appHelpers

import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import java.util.List
import ar.edu.unq.ciu.minificados.LaberintoMinificado

class Minificador {

    def minificar(List<Laberinto> laberintos){
        val laberintosMinificados = new ArrayList<LaberintoMinificado>
        laberintos.forEach[laberinto | laberintosMinificados.add(
                    new LaberintoMinificado(laberinto.id, laberinto.nombre, laberinto.pathImagen)
            )]
        laberintosMinificados
    }
}