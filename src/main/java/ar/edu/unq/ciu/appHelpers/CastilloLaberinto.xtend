package ar.edu.unq.ciu.appHelpers

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionGanar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import java.util.List

class CastilloLaberinto {

    public Laberinto CASTILLO

    new(){

        // Acciones de habitacion final
        var ganar = new AccionGanar

        ganar.id = 5
        ganar.nombre = 'Ganaste'
        ganar.tipo= 'ganar'
        ganar.habilitar

        var List<Accion> accionesDeHabitacionFinal = newArrayList(ganar)

        // Items de la habitacion final
        var itemsDeHabitacionFinal = newArrayList()

        // Habitacion final
        var habitacionFinal = new Habitacion()

        habitacionFinal.id = 3
        habitacionFinal.nombre = 'Habitacion final'
        habitacionFinal.isInicial = false
        habitacionFinal.isFinal = true
        habitacionFinal.items = itemsDeHabitacionFinal
        habitacionFinal.acciones = accionesDeHabitacionFinal
        habitacionFinal.pathImagen = 'un/path'

        // Item hierro de habitaion inicial
        var hierro = new Item

        hierro.id = 1
        hierro.nombre = 'Hierro largo'

        var itemsDeHabitacionInicial = newArrayList(hierro)

        // Acciones del pasillo oscuro
        var usarHierro = new AccionUsar
        var moverseAHabitacionFinal = new AccionMover

        moverseAHabitacionFinal.id = 4
        moverseAHabitacionFinal.nombre = 'Pasar a siguiente habitacion'
        moverseAHabitacionFinal.tipo = 'mover'
        moverseAHabitacionFinal.habitacion = habitacionFinal

        usarHierro.id = 3
        usarHierro.nombre = 'Usar hierro como palanca en puerta'
        usarHierro.tipo = 'usar'
        usarHierro.item = hierro
        usarHierro.accion = moverseAHabitacionFinal
        usarHierro.habilitar

        var accionesDelPasilloOscuro = newArrayList(usarHierro, moverseAHabitacionFinal)

        //Items del pasillo oscuro
        var itemsPasilloOscuro = newArrayList()

        // Habitacion pasillo oscuro
        var pasilloOscuro = new Habitacion()

        pasilloOscuro.id = 2
        pasilloOscuro.nombre = 'Pasillo oscuro'
        pasilloOscuro.isInicial = false
        pasilloOscuro.isFinal = false
        pasilloOscuro.acciones = accionesDelPasilloOscuro
        pasilloOscuro.items = itemsPasilloOscuro
        pasilloOscuro.pathImagen = 'un/path'

        // Acciones de habitacion inicial
        var moverseAPasilloOscuro = new AccionMover()
        var agarrarHierro = new AccionAgarrar()

        moverseAPasilloOscuro.id = 1
        moverseAPasilloOscuro.nombre = 'Pasar a siguiente habitacion'
        moverseAPasilloOscuro.tipo = 'mover'
        moverseAPasilloOscuro.habilitar
        moverseAPasilloOscuro.habitacion = pasilloOscuro

        agarrarHierro.id = 2
        agarrarHierro.nombre = 'Agarrar hierro'
        agarrarHierro.tipo = 'agarrar'
        agarrarHierro.habilitar
        agarrarHierro.item = hierro

        var accionesDeHabitacionInicial = newArrayList(moverseAPasilloOscuro, agarrarHierro)

        // Habitaciones Inicial
        var habitacionInicial = new Habitacion()

        habitacionInicial.id = 1
        habitacionInicial.nombre = 'habitacion inicial'
        habitacionInicial.isInicial = true
        habitacionInicial.isFinal = false
        habitacionInicial.acciones = accionesDeHabitacionInicial
        habitacionInicial.items = itemsDeHabitacionInicial
        habitacionInicial.pathImagen = 'un/path'

        //Habitaciones del laberinto
        var habitacionesDelCastillo = newArrayList(habitacionInicial, pasilloOscuro, habitacionFinal)

        // Laberinto
        var castillo = new Laberinto
        castillo.id = 1
        castillo.nombre = "Castillo"
        castillo.habitaciones = habitacionesDelCastillo
        castillo.pathImagen = "un/path"

        this.CASTILLO = castillo
    }
}