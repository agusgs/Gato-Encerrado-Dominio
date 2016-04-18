package ar.edu.unq.ciu.GatoEncerradoAppModel

import org.eclipse.xtend.lib.annotations.Accessors

import org.uqbar.commons.utils.Observable
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion

@Accessors
@Observable
class AgregarAccionAppModel {

    Laberinto laberinto
    Habitacion habitacion
    Accion accionUsar
}
