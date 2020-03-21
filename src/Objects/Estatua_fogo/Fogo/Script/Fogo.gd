extends Area2D

export var origem_mapa = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func mudar_direcao(dir):
	if dir:
		$SpriteFogo.flip_h = true
		$SpriteFogo.position.x *= -1
		$CollisionShapeFogo.position.x *= -1
	else:
		$SpriteFogo.flip_h = false

func _on_Fogo_body_entered(body):
	if body.get_filename().get_file() == "Player.tscn":
		body.position = origem_mapa
