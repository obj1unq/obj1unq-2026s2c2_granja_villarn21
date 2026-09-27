import wollok.game.*
import cultivos.*
import personaje.*

object granja {
	const property cultivos = #{}
	const property cosecha = [] 
	method plantar(cultivo) {
		self.validarPlantar(personaje.position())
		cultivos.add(cultivo)
		game.addVisual(cultivo)
	}
	method validarPlantar(position) {
		if (self.hayCultivo(position)) {
			self.error("No se puede plantar")
		}
	}
	method hayCultivo(position) {
		return cultivos.any({cultivo => cultivo.position() == position})
	}
	method regar(){
		self.validarRiego()
		self.cultivoActual().regar()
	}
	method validarRiego(){
		if(not self.hayCultivo(personaje.position())){
			self.error("no tengo nada para regar")
		}
	}
	method cultivoActual(){
		return(cultivos.find({cultivo=> cultivo.position() == personaje.position()}))
	}
	method cosechar(){
		self.validarCultivo()
		const cultivo = self.cultivoActual()
		cultivo.cosechar()
		cultivos.remove(cultivo)
		cosecha.add(cultivo)
	}
	method validarCultivo(){
		if(not self.hayCultivo(personaje.position())){
			self.error("No hay planta para cosechar")
		}
	}
	method vender(){
		const total = self.totalAVender()
		cosecha.clear()
		return total 
	}
	method totalAVender(){
		return cosecha.sum({cosecha=> cosecha.precio()})
	}
	method cosechaAVender(){
		return cosecha.size()
	}
}