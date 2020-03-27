extends StaticBody2D

var abrir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if abrir:
		global_position.y -= 1.0

func ativar():
	abrir = true
	$Timer.start()


func _on_Timer_timeout():
	set_process(false)
