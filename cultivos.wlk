import wollok.game.*
import granja.*

object maiz {
	var esBebe = true 
	var property position = game.center()
  method image(){
	return "maiz_" + self.estado() + ".png"
  }
  method estado(){
	return if(esBebe){"bebe"}else{"adulto"}
  }
  method regar(){
    if(esBebe){esBebe = false}
  }
  method cosechar(){
    self.validarCosecha()
    game.removeVisual(self)
  }
  method validarCosecha(){
    if(esBebe){
        self.error("No se puede cosechar todavia")
    }
  }
  method precio(){
    return 150
  }
}
object trigo {
  var evolucion = 0
  var property position = game.center()
  method image(){
	return "trigo_" + evolucion + ".png"
  }
  method regar(){if(evolucion <= 2){evolucion = evolucion +1}else{evolucion = 0}}
  method cosechar(){
    self.validarCosecha()
    game.removeVisual(self)
  }
  method validarCosecha(){
    if(evolucion < 2){
        self.error("No se puede cosechar todavia")
    }
  }
  method precio(){
    return (evolucion - 1) * 100
  }
}

object tomaco {
  var property position = game.center()
  method image(){
	return "tomaco" + ".png"
  }
  method regar(){
    const siguientePos = self.siguientePos()
    if(not granja.hayCultivo(siguientePos)){
        position = siguientePos
    }
  }
  method siguientePos(){
    return if(position.y() == (game.height() -1)){
         game.at(position.x(), 0)
    }else{
        position.up(1)
    }
  }
  method cosechar(){
    game.removeVisual(self)
  }
  method precio(){
    return 80
  }
}