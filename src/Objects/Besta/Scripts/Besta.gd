extends StaticBody2D

const FLECHA = preload("res://src/Objects/Besta/Flecha.tscn")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var flecha = FLECHA.instance()
	if $Sprite.flip_h:
		flecha.mudar_direcao_flecha(1)
	else:
		flecha.mudar_direcao_flecha(-1)

	get_parent().get_parent().add_child(flecha)
	flecha.position = $Position2D.global_position
