package ar.edu.unq.ciu.appHelpers

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Inventario
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Resultado
import ar.edu.unq.ciu.minificados.AccionMinificada
import ar.edu.unq.ciu.minificados.HabitacionMinificada
import ar.edu.unq.ciu.minificados.LaberintoCompletoMinificado
import ar.edu.unq.ciu.minificados.LaberintoMinificado
import java.util.ArrayList
import java.util.List

class Minificador {

    def minificar(Resultado resultado){
        resultado.minificate
    }

    def minificar(List<Laberinto> laberintos){
        val laberintosMinificados = new ArrayList<LaberintoMinificado>
        laberintos.forEach[laberinto | laberintosMinificados.add(
                    new LaberintoMinificado(laberinto.id, laberinto.nombre, laberinto.pathImagen)
            )]
        laberintosMinificados
    }

	def minificar(Laberinto laberinto){
        var laberintoMinificado = new LaberintoCompletoMinificado()

        laberintoMinificado.id = laberinto.id
        laberintoMinificado.nombre = laberinto.nombre
        laberintoMinificado.habitacionesMinificadas = minificarHabitaciones(laberinto.habitaciones)

        laberintoMinificado
    }

    def minificarHabitaciones(List<Habitacion> habitaciones){
    	val habitacionesMinificadas = new ArrayList<HabitacionMinificada>

    	habitaciones.forEach[habitacion |
			habitacionesMinificadas.add(minificarHabitacion(habitacion))
    	]

		habitacionesMinificadas
    }
    
    def minificarHabitacion(Habitacion habitacion){
    	var habitacionMinificada = new HabitacionMinificada()

    	habitacionMinificada.id = habitacion.id
		habitacionMinificada.nombre = habitacion.nombre
		habitacionMinificada.acciones = minificarAcciones(habitacion.acciones)
		habitacionMinificada.isFinal = habitacion.isFinal
		habitacionMinificada.isInicial = habitacion.isInicial
        habitacionMinificada.pathImagen = habitacion.pathImagen

		habitacionMinificada
    }

    def minificarAcciones(List<Accion> acciones){
        val accionesMinificadas = new ArrayList<AccionMinificada>

        acciones.forEach[accion |
            accionesMinificadas.add(minificarAccion(accion))
        ]

        accionesMinificadas
    }

    def minificarAccion(Accion accion){
        val accionMinificada = new AccionMinificada()

        accionMinificada.id = accion.id
        accionMinificada.nombre = accion.nombre

        accionMinificada
    }

    def minificarInventario(Inventario inv){
//    	val inventarioMinificado = new InventarioMini(inv.id, inv.nombre, inv.descripcion)
//
//    	inventarioMinificado.items.addAll(inv.items)
//    	inventarioMinificado
    }
}