extends StaticBody2D

const FOGO = preload("res://src/Objects/Estatua_fogo/Fogo/Fogo.tscn")
var fogo_instanciado = false
var fogo

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if !fogo_instanciado:
		fogo = FOGO.instance()
		if $SpriteEstatua.flip_h:
			fogo.mudar_direcao(true)
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			fogo.mudar_direcao(false)
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= 1
		get_parent().add_child(fogo)
		fogo.global_position = $Position2D.global_position
		fogo_instanciado = true
	else:
		fogo.queue_free()
		fogo_instanciado = false

