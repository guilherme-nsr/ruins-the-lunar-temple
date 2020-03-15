extends KinematicBody2D

const CIMA = Vector2.UP
const GRAVIDADE = 20
const VELOCIDADE = 200
const FORCA_PULO = -550

var movimento = Vector2()
var pulando = false
var agachado = false

func _physics_process(delta):
	
	movimento.y += GRAVIDADE

	if Input.is_action_pressed("mover_direita"):
		$PlayerSprite.flip_h = false
		$PlayerShape.rotation_degrees = 0
		if pulando == false:
			$PlayerSprite.play("Correndo")
		
		movimento.x = VELOCIDADE
	elif Input.is_action_pressed("mover_esquerda"):
		$PlayerSprite.flip_h = true
		$PlayerShape.rotation_degrees = 0
		if pulando == false:
			$PlayerSprite.play("Correndo")
		
		movimento.x = -VELOCIDADE
	elif Input.is_action_pressed("agachar"):
		movimento.x = 0
		
		$PlayerSprite.play("Agachando")
		$PlayerShape.rotation_degrees = 90
		agachado = true
	else:
		movimento.x = 0
		if pulando == false:
			$PlayerSprite.play("Parado")
			$PlayerShape.rotation_degrees = 0
		
		
	if is_on_floor():
		if Input.is_action_pressed("pular"):
			$PlayerSprite.play("Pulando")
			movimento.y = FORCA_PULO
			pulando = true
		else:
			pulando = false
	
	movimento = move_and_slide(movimento, CIMA)
	
