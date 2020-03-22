extends Node2D

var temporizador = 15


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reduzir_um_seg_cronometro():
	temporizador -= 1
	mudar_texto("00:0" + String(temporizador))

func mudar_texto(texto):
	get_tree().get_nodes_in_group("tempo")[0].text = texto

func _on_cronometro_timeout():
	reduzir_um_seg_cronometro()
