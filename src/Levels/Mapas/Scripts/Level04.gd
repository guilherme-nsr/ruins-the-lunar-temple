extends Node2D

var tempo = 45

# Called when the node enters the scene tree for the first time.
func _ready():
	update_time()

func reduzir_um_seg_cronometro():
	tempo -= 1
	update_time()
	
func update_time():
	get_tree().get_nodes_in_group("tempo")[0].text = String(tempo/60) + ":" + String(tempo%60)


func _on_Timer_timeout():
	if tempo <= 0:
		get_node("PlayerBody").morrer()
	else:
		reduzir_um_seg_cronometro()
