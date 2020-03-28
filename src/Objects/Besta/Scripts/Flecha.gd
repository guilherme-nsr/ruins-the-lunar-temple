extends Area2D

const VELOCIDADE = -800
var movimento = Vector2.ZERO
var direcao = 1

func _ready():
	pass # Replace with function body.
	
func _on_HitDetector_body_entered(body):
	if body.get_filename().get_file() == "Player.tscn":
		body.morrer()

func mudar_direcao_flecha(dir):
	direcao = dir
	if dir == -1:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true

func _physics_process(delta):
	
	movimento.x = VELOCIDADE * delta * direcao
	translate(movimento)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
