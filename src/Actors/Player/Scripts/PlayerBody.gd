extends KinematicBody2D

const CIMA = Vector2.UP
const GRAVIDADE = 1700.0
const VELOCIDADE = 200.0
const FORCA_PULO = -550.0
const FORCA_DESLIZAR_PADRAO = 300.0

var movimento = Vector2()
var pulando = false
var agachado = false
var forca_deslizar = FORCA_DESLIZAR_PADRAO

func _physics_process(delta):

	movimento.y += GRAVIDADE * delta
	if Input.is_action_pressed("agachar") and Input.is_action_pressed("mover_direita") and !pulando:
		$PlayerSprite.flip_h = false
		$PlayerShape.scale = Vector2(1, 0.5)
		$PlayerSprite.play("Agachando")
		
		movimento.x = VELOCIDADE + forca_deslizar
		if movimento.x >= 0.0:
			forca_deslizar -= 10
	elif Input.is_action_pressed("agachar") and Input.is_action_pressed("mover_esquerda") and !pulando:
		$PlayerSprite.flip_h = true
		$PlayerShape.scale = Vector2(1, 0.5)
		$PlayerSprite.play("Agachando")
		
		movimento.x = -VELOCIDADE - forca_deslizar
		if movimento.x <= 0.0:
			forca_deslizar -= 10
	elif Input.is_action_pressed("mover_direita"):
		$PlayerSprite.flip_h = false
		$PlayerShape.scale = Vector2(1, 1)
		if pulando == false:
			$PlayerSprite.play("Correndo")
		
		movimento.x = VELOCIDADE
		forca_deslizar = FORCA_DESLIZAR_PADRAO
	elif Input.is_action_pressed("mover_esquerda"):
		$PlayerSprite.flip_h = true
		$PlayerShape.scale = Vector2(1, 1)
		if pulando == false:
			$PlayerSprite.play("Correndo")
		
		movimento.x = -VELOCIDADE
		forca_deslizar = FORCA_DESLIZAR_PADRAO
	elif Input.is_action_pressed("agachar"):
		movimento.x = 0.0
		
		$PlayerSprite.play("Agachando")
		$PlayerShape.scale = Vector2(1, 0.5)
		agachado = true
		forca_deslizar = FORCA_DESLIZAR_PADRAO
	else:
		forca_deslizar = FORCA_DESLIZAR_PADRAO
		movimento.x = 0.0
		if pulando == false:
			$PlayerSprite.play("Parado")
			$PlayerShape.scale = Vector2(1, 1)
		
		
	if is_on_floor():
		if Input.is_action_pressed("pular"):
			$PlayerSprite.play("Pulando")
			movimento.y = FORCA_PULO
			pulando = true
		else:
			pulando = false
		
		
	movimento = move_and_slide(movimento, CIMA)
	


func _on_Timer_timeout():
	$PlayerSprite.play("Morrendo")
	set_physics_process(false)
	get_tree().get_nodes_in_group("cronometro")[0].stop()
	get_parent().reduzir_um_seg_cronometro()
	get_parent().mudar_texto("Você morreu.")
