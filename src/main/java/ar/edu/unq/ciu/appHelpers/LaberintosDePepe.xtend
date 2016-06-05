package ar.edu.unq.ciu.appHelpers

import java.util.HashMap
import java.util.List

class LaberintosDePepe {

    public List<HashMap<String, Object>> LABERINTOS = laberintosDePepe()

    private def laberintosDePepe(){

        var labCastilloMap = new HashMap<String, Object>
        var labPiramideMap = new HashMap<String, Object>
        var labTuberiasMap = new HashMap<String, Object>

        labCastilloMap.put('id', '1')
        labCastilloMap.put('nombre', 'castillo')
        labCastilloMap.put('pathImg', 'un/path')
        labCastilloMap.put('habitaciones', habitacionesDelCastillo())

        labPiramideMap.put('id', '2')
        labPiramideMap.put('nombre', 'piramide')
        labPiramideMap.put('pathImg', 'un/path')
        labPiramideMap.put('habitaciones', habitacionesDeLaPiramide())

        labTuberiasMap.put('id', '3')
        labTuberiasMap.put('nombre', 'tuberias')
        labTuberiasMap.put('pathImg', 'un/path')
        labTuberiasMap.put('habitaciones', habitacionesDeLasTuberias())

        newArrayList(labCastilloMap, labPiramideMap, labTuberiasMap)
    }

    def habitacionesDelCastillo(){
        var habitacionInicialMap = new HashMap<String, Object>
        var pasilloOscuroMap = new HashMap<String, Object>
        var habitacionFinalMap = new HashMap<String, Object>

        habitacionInicialMap.put('id', '1')
        habitacionInicialMap.put('nombre', 'habitacion inicial')
        habitacionInicialMap.put('isInicial', 'true')
        habitacionInicialMap.put('isFinal', 'false')
        habitacionInicialMap.put('acciones', accionesDeHabitacionInicial())
        habitacionInicialMap.put('items', itemsDeHabitacionInicial())
        habitacionInicialMap.put('pathImagen', 'un/path')

        pasilloOscuroMap.put('id', '2')
        pasilloOscuroMap.put('nombre', 'pasillo oscuro')
        pasilloOscuroMap.put('isInicial', 'false')
        pasilloOscuroMap.put('isFinal', 'false')
        pasilloOscuroMap.put('acciones', accionesDelPasilloOscuro())
        pasilloOscuroMap.put('items', itemsPasilloOscuro())
        pasilloOscuroMap.put('pathImagen', 'un/path')

        habitacionFinalMap.put('id', '3')
        habitacionFinalMap.put('nombre', 'Habitacion final')
        habitacionFinalMap.put('isInicial', 'false')
        habitacionFinalMap.put('isFinal', 'true')
        habitacionFinalMap.put('acciones', accionesDeHabitacionFinal())
        habitacionFinalMap.put('items', itemsDeHabitacionFinal())
        habitacionFinalMap.put('pathImagen', 'un/path')

        newArrayList(habitacionInicialMap, pasilloOscuroMap, habitacionFinalMap)
    }

    def accionesDeHabitacionInicial(){
        var moverseDeHabitacionMap = new HashMap<String, Object>
        var agarrarHierro = new HashMap<String, Object>

        moverseDeHabitacionMap.put('id', '1')
        moverseDeHabitacionMap.put('nombre', 'Pasar a siguiente habitacion')
        moverseDeHabitacionMap.put('tipo', 'mover')

        agarrarHierro.put('id', '2')
        agarrarHierro.put('nombre', 'Agarrar hierro')
        agarrarHierro.put('tipo', 'agarrar')

        newArrayList(moverseDeHabitacionMap, agarrarHierro)
    }

    def itemsDeHabitacionInicial(){
        var hierro = new HashMap<String, String>

        hierro.put('id', '1')
        hierro.put('nombre', 'Hierro largo')

        newArrayList(hierro)
    }

    def accionesDelPasilloOscuro(){
        var usarHierro = new HashMap<String, Object>
        var moverseDeHabitacionMap = new HashMap<String, Object>

        usarHierro.put('id', '3')
        usarHierro.put('nombre', 'Usar hierro como palanca en puerta')
        usarHierro.put('tipo', 'usar')

        moverseDeHabitacionMap.put('id', '4')
        moverseDeHabitacionMap.put('nombre', 'Pasar a siguiente habitacion')
        moverseDeHabitacionMap.put('tipo', 'mover')

        newArrayList(usarHierro, moverseDeHabitacionMap)
    }

    def itemsPasilloOscuro(){
        newArrayList()
    }

    def accionesDeHabitacionFinal(){
        var ganar = new HashMap<String, Object>

        ganar.put('id', '5')
        ganar.put('nombre', 'Ganar')
        ganar.put('tipo', 'ganar')

        newArrayList(ganar)
    }

    def itemsDeHabitacionFinal(){
        newArrayList()
    }


    def habitacionesDeLaPiramide(){
        var salaDelFaraonMap = new HashMap<String, Object>
        var calabozoMap = new HashMap<String, Object>
        var salidaDerrumbadaMap = new HashMap<String, Object>

        salaDelFaraonMap.put('id', '4')
        salaDelFaraonMap.put('nombre', 'Sala del faraon')
        salaDelFaraonMap.put('isInicial', 'true')
        salaDelFaraonMap.put('isFinal', 'false')
        salaDelFaraonMap.put('acciones', accionesSalaFaraon())
        salaDelFaraonMap.put('items', itemsSalaFaraon())
        salaDelFaraonMap.put('pathImagen', 'un/path')

        calabozoMap.put('id', '5')
        calabozoMap.put('nombre', 'Calabozo')
        calabozoMap.put('isInicial', 'false')
        calabozoMap.put('isFinal', 'false')
        calabozoMap.put('acciones', accionesCalabozo())
        calabozoMap.put('items', itemsCalabozo())
        calabozoMap.put('pathImagen', 'un/path')

        salidaDerrumbadaMap.put('id', '6')
        salidaDerrumbadaMap.put('nombre', 'salida derrumbada')
        salidaDerrumbadaMap.put('isInicial', 'false')
        salidaDerrumbadaMap.put('isFinal', 'true')
        salidaDerrumbadaMap.put('acciones', accionesSalidaDerrumbada())
        salidaDerrumbadaMap.put('items', itemsSalidaDerrumbada())
        salidaDerrumbadaMap.put('pathImagen', 'un/path')

        newArrayList(salaDelFaraonMap, calabozoMap, salidaDerrumbadaMap)
    }

    def accionesSalaFaraon(){
        var moverseDeHabitacionMap = new HashMap<String, Object>
        var agarrarEscarabajoMap = new HashMap<String, Object>

        moverseDeHabitacionMap.put('id', '6')
        moverseDeHabitacionMap.put('nombre', 'Pasar a siguiente habitacion')
        moverseDeHabitacionMap.put('tipo', 'mover')

        agarrarEscarabajoMap.put('id', '7')
        agarrarEscarabajoMap.put('nombre', 'Agarrar escarabajo de oro')
        agarrarEscarabajoMap.put('tipo', 'agarrar')

        newArrayList(moverseDeHabitacionMap, agarrarEscarabajoMap)
    }

    def itemsSalaFaraon(){
        var escarabajo = new HashMap<String, String>

        escarabajo.put('id', '2')
        escarabajo.put('nombre', 'Escarabajo de oro')

        newArrayList(escarabajo)
    }

    def accionesCalabozo(){
        var usarEscarabajoMap = new HashMap<String, Object>
        var moverseDeHabitacionMap = new HashMap<String, Object>

        usarEscarabajoMap.put('id', '8')
        usarEscarabajoMap.put('nombre', 'Usar escarabajo de oro en cerradura')
        usarEscarabajoMap.put('tipo', 'agarrar')

        moverseDeHabitacionMap.put('id', '9')
        moverseDeHabitacionMap.put('nombre', 'Pasar a siguiente habitacion')
        moverseDeHabitacionMap.put('tipo', 'mover')

        newArrayList(moverseDeHabitacionMap, usarEscarabajoMap)
    }

    def itemsCalabozo(){
        newArrayList()
    }

    def accionesSalidaDerrumbada(){
        var ganarMap = new HashMap<String, Object>

        ganarMap.put('id', '10')
        ganarMap.put('nombre', 'Pasar a siguiente habitacion')
        ganarMap.put('tipo', 'ganar')

        newArrayList(ganarMap)
    }

    def itemsSalidaDerrumbada(){
        newArrayList()
    }

    def habitacionesDeLasTuberias(){
        var camaraOxidadaMap = new HashMap<String, Object>
        var cloacasMap = new HashMap<String, Object>
        var tramoBajoAguaMap = new HashMap<String, Object>

        camaraOxidadaMap.put('id', '7')
        camaraOxidadaMap.put('nombre', 'Camara Oxidada')
        camaraOxidadaMap.put('isInicial', 'true')
        camaraOxidadaMap.put('isFinal', 'false')
        camaraOxidadaMap.put('acciones', accionesCamaraOxidada())
        camaraOxidadaMap.put('items', itemsCamaraOxidada())
        camaraOxidadaMap.put('pathImagen', 'un/path')

        cloacasMap.put('id', '8')
        cloacasMap.put('nombre', 'Cloacas')
        cloacasMap.put('isInicial', 'false')
        cloacasMap.put('isFinal', 'false')
        cloacasMap.put('acciones', accionesCloacas())
        cloacasMap.put('items', itemsCloacas())
        cloacasMap.put('pathImagen', 'un/path')

        tramoBajoAguaMap.put('id', '9')
        tramoBajoAguaMap.put('nombre', 'Tramo bajo agua')
        tramoBajoAguaMap.put('isInicial', 'false')
        tramoBajoAguaMap.put('isFinal', 'true')
        tramoBajoAguaMap.put('acciones', accionesTramoBajoElAgua())
        tramoBajoAguaMap.put('items', itemsTramoBajoElAgua())
        tramoBajoAguaMap.put('pathImagen', 'un/path')

        newArrayList(camaraOxidadaMap, cloacasMap, tramoBajoAguaMap)
    }

    def accionesCamaraOxidada(){
        var moverseDeHabitacionMap = new HashMap<String, Object>
        var agarrarLlaveOxidada = new HashMap<String, Object>

        moverseDeHabitacionMap.put('id', '11')
        moverseDeHabitacionMap.put('nombre', 'Pasar a siguiente habitacion')
        moverseDeHabitacionMap.put('tipo', 'mover')

        agarrarLlaveOxidada.put('id', '12')
        agarrarLlaveOxidada.put('nombre', 'Agarrar llave oxidada')
        agarrarLlaveOxidada.put('tipo', 'agarrar')

        newArrayList(moverseDeHabitacionMap, agarrarLlaveOxidada)
    }

    def itemsCamaraOxidada(){
        var llaveOxidada = new HashMap<String, String>

        llaveOxidada.put('id', '3')
        llaveOxidada.put('nombre', 'Llave oxidada')

        newArrayList(llaveOxidada)
    }

    def accionesCloacas(){
        var usarLlaveOxidada = new HashMap<String, Object>
        var moverseDeHabitacionMap = new HashMap<String, Object>

        usarLlaveOxidada.put('id', '13')
        usarLlaveOxidada.put('nombre', 'Usar llave oxiada en compuerta')
        usarLlaveOxidada.put('tipo', 'agarrar')

        moverseDeHabitacionMap.put('id', '14')
        moverseDeHabitacionMap.put('nombre', 'Pasar a siguiente habitacion')
        moverseDeHabitacionMap.put('tipo', 'mover')
        newArrayList(moverseDeHabitacionMap, usarLlaveOxidada)
    }

    def itemsCloacas(){
        newArrayList()
    }

    def accionesTramoBajoElAgua(){
        var ganarMap = new HashMap<String, Object>

        ganarMap.put('id', '15')
        ganarMap.put('nombre', 'Pasar a siguiente habitacion')
        ganarMap.put('tipo', 'ganar')

        newArrayList(ganarMap)
    }

    def itemsTramoBajoElAgua(){
        newArrayList()
    }

}