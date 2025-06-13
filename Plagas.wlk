import Elementos.*
class Plaga {
    var property poblacion
    method transmiteEnfermedad() = poblacion >= 10
    method atacar(elemento) {
        poblacion = poblacion + (poblacion * 0.10)
        elemento.recibirAtaque(self)
    }
}

class PlagaCucaracha inherits Plaga {
    var property pesoPromedio
    method nivelDaño() = poblacion / 2
    override method transmiteEnfermedad() = super() && pesoPromedio >= 10
    override method atacar(elemento) {
        super(elemento)
        pesoPromedio = pesoPromedio + 2
    }
    
}

class PlagaPulgas inherits Plaga {
    method nivelDaño() =  poblacion * 2
}

class PlagaGarrapata inherits PlagaPulgas{
    override method atacar(elemento){
        super(elemento)
        poblacion = poblacion + (poblacion * 0.20)
    }
}

class PlagaMosquitos inherits Plaga {
    method nivelDaño() = poblacion
    override method transmiteEnfermedad() = super() && poblacion % 3 == 0
}