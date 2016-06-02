package ar.edu.unq.ciu.appHelpers

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Inventario
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.minificados.HabitacionMini
import ar.edu.unq.ciu.minificados.InventarioMini
import ar.edu.unq.ciu.minificados.LaberintoCompletoMinificado
import ar.edu.unq.ciu.minificados.LaberintoMinificado
import java.util.ArrayList
import java.util.List

class Minificador {

    def minificar(List<Laberinto> laberintos){
        val laberintosMinificados = new ArrayList<LaberintoMinificado>
        laberintos.forEach[laberinto | laberintosMinificados.add(
                    new LaberintoMinificado(laberinto.id, laberinto.nombre, laberinto.pathImagen)
            )]
        laberintosMinificados
    }
    
	def minicarLaberintoCompleto(Laberinto laberinto){
        var labMini = new LaberintoCompletoMinificado(laberinto.id, laberinto.nombre)
        labMini.habitaciones.addAll(minificarHabitaciones(laberinto.habitaciones))
        labMini.inventario = minificarInventario(laberinto.inventario)
        labMini
    }

    def minificarHabitaciones(List<Habitacion> habitaciones){
    	val habitacionesMinificadas = new ArrayList<HabitacionMini>
    	habitaciones.forEach[habitacion |
			habitacionesMinificadas.add(minificarHabitacion(habitacion))
    	]
		habitacionesMinificadas
    }
    
    def minificarHabitacion(Habitacion habitacion){
    	var habMini = new HabitacionMini()
    	habMini.id = habitacion.id
		habMini.nombre = habitacion.nombre
		habMini.acciones.addAll(habitacion.acciones)
		habMini.isFinal = habitacion.isFinal
		habMini.isInicial = habitacion.isInicial
		habMini
    }
    
    def minificarInventario(Inventario inv){
    	val inventarioMinificado = new InventarioMini(inv.id, inv.nombre, inv.descripcion)
    	inventarioMinificado.items.addAll(inv.items)
    	inventarioMinificado
    }
	
}