import wollok.game.*
import granja.*
import cultivos.*
import personaje.*


object mercado {
	const property position = game.at(1,2)
	const property image = "mercado.png"

    method interactuar(personaje){
        personaje.vender()
    }
}