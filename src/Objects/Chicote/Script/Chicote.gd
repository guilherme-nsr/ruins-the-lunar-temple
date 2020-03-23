extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$tempo_de_vida.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func mudar_direcao():
	$CollisionShape2D.position *= -1

func _on_tempo_de_vida_timeout():
	queue_free()
