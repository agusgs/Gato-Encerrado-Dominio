package ar.edu.unq.ciu.gato_encerrado_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Jugador {
	
	Laberinto laberintoActual
	ArrayList<Laberinto> laberintosAbandonados
	ArrayList<Laberinto> laberintosSuperados
	
	
	new(){
		laberintosAbandonados = new ArrayList()
		laberintosSuperados = new ArrayList()
	}
	
	def jugar(Laberinto laberinto) {
		this.laberintoActual = laberinto
	}
	
	def abandonarLaberinto(Laberinto laberinto) {
		this.laberintoActual = null
		if(laberinto.getHabitacionActual().esFinal)
			this.laberintosSuperados.add(laberinto)
		else
			this.laberintosAbandonados.add(laberinto)
	}
	
}