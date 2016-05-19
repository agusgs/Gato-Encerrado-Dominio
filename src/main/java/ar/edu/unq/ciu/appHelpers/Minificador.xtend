package ar.edu.unq.ciu.appHelpers

import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import java.util.List
import ar.edu.unq.ciu.minificados.LaberintoMinificado
import ar.edu.unq.ciu.minificados.LaberintoMini
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.minificados.HabitacionMini
import ar.edu.unq.ciu.GatoEncerradoDominio.Inventario
import ar.edu.unq.ciu.minificados.InventarioMini

class Minificador {

    def minificar(List<Laberinto> laberintos){
        val laberintosMinificados = new ArrayList<LaberintoMinificado>
        laberintos.forEach[laberinto | laberintosMinificados.add(
                    new LaberintoMinificado(laberinto.id, laberinto.nombre, laberinto.pathImagen)
            )]
        laberintosMinificados
    }
    
	def minicarLaberintoCompleto(Laberinto laberinto){
        var labMini = new LaberintoMini(laberinto.id, laberinto.nombre)
        labMini.habitaciones.addAll(minificarHabitacion(laberinto.habitaciones))
        labMini.inventario = minificarInventario(laberinto.inventario)
        labMini
    }

    def minificarHabitacion(List<Habitacion> habitaciones){
    	val habitacionesMinificadas = new ArrayList<HabitacionMini>
    	habitaciones.forEach[habitacion |
    		var habMini = new HabitacionMini()
    		habMini.id = habitacion.id
			habMini.nombre = habitacion.nombre
			habMini.acciones.addAll(habitacion.acciones)
			habMini.isFinal = habitacion.isFinal
			habMini.isInicial = habitacion.isInicial
			habitacionesMinificadas.add(habMini)
    	]
		habitacionesMinificadas
    }
    
    def minificarInventario(Inventario inv){
    	val inventarioMinificado = new InventarioMini(inv.id, inv.nombre, inv.descripcion)
    	inventarioMinificado.items.addAll(inv.items)
    	inventarioMinificado
    }
}