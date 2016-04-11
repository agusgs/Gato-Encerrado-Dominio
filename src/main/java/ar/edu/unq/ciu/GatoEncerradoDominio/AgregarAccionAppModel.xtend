package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AgregarAccionAppModel {

    Laberinto laberinto
    Habitacion habitacion
}