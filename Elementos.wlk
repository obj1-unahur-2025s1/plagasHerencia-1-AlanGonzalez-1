import Plagas.*

class Elemento {
  method bueno() = true
  method recibirAtaque(unaPlaga){
    unaPlaga.atacar(self)
  }
}

class Hogar  inherits Elemento{
  var property nivel
  var property confortOfrece
  override method bueno() = nivel <= (confortOfrece / 2)
  override method recibirAtaque(unaPlaga) {
    nivel = nivel + unaPlaga.nivelDaño()
  }}

class Huerta inherits Elemento {
  var property capacidadProduccion
  method cambiarNivel(nivel) {nivelHuerta.valor(nivel)}
  override method bueno() = capacidadProduccion > nivelHuerta.valor()
  override method recibirAtaque(unaPlaga) {
    capacidadProduccion = capacidadProduccion - (unaPlaga.nivelDaño() * 0.10)
    if(unaPlaga.transmiteEnfermedad()){
      capacidadProduccion = (capacidadProduccion - 10).max(0)
      }
    }
  }

object nivelHuerta {
    var property valor = 8
}

class Mascota inherits Elemento{
  var property nivelSalud
  override method bueno() = nivelSalud > 250
  method saludable() = nivelSalud
  override method recibirAtaque(unaPlaga) {
    if(unaPlaga.transmiteEnfermedad()){
      nivelSalud = (nivelSalud - unaPlaga.nivelDaño()).max(0)
    }
  } 
}

class Barrio {
  const elementos = []
  method agregarElemento(unElemento) { elementos.add(unElemento)}
  method sacarElemento(unElemento) { elementos.remove(unElemento)}
  method elementoBueno(elemento) = elemento.bueno()
  method copado() {
    const noBuenos = elementos.filter({e=>! e.bueno()}).size()
    const buenos = elementos.filter({e=>e.bueno()}).size()
    return buenos > noBuenos
  }
}

