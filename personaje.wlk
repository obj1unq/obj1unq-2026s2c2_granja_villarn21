import wollok.game.*
import granja.*
import cultivos.*

object femenino{
	method prefijo() {
		return "f"
	}
	method otro() {
		return masculino
	}
}
object masculino{
	method prefijo() {
		return "m"
	}
	method otro() {
		return femenino
	}
}
object personaje{
	var property genero = femenino
	var property position = game.center()
	const propiedad = granja
    var oro = 0

	method  image() {
		return genero.prefijo() + "-player-" + self.estado() + ".png"
	} 
	method estado() {
		return if (self.estaSobreAlgo())  "abajo" else "normal" 
	}
	method estaSobreAlgo() {
		return not game.colliders(self).isEmpty()
	}
	method cambiarGenero() {
		genero = genero.otro()
	}

	method plantar(cultivo) {
		self.validarPlantar(cultivo)
		propiedad.plantar(cultivo, self.position())
	} 
	method validarPlantar(cultivo){
		if(granja.hayCultivo(self.position())){
			self.error("No se puede plantar aca")
		}
	}
    method vender(){
        oro = oro + granja.totalAVender()
        granja.vender() 
    }
    method text(){
        return oro.toString()
    }
    method cosechaAVender(){
        game.say(self, "Tengo " + granja.cosechaAVender() + " Plantas para vender por " + granja.totalAVender() + " monedas")
    }
}