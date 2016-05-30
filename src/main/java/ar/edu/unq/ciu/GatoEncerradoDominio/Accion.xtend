package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class Accion {

	Integer id
    String nombre
    String tipo

	abstract def void usarAccion()
	abstract def void usarAccion(Habitacion hab)
	abstract def Object respuesta(Habitacion hab, UsuarioJugador us, Inventario inv)
}