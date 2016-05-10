package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LaberintoMinificado {
    Integer id
    String nombre
    String pathImagen

    new(){
    }

    new(Integer id, String nombre, String pathImagen){
        this.id = id
        this.nombre = nombre
        this.pathImagen = pathImagen
    }
}