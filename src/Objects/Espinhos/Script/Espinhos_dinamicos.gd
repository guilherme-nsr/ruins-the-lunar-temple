extends Area2D


var posicao_espinho
var espinho_descendo
var velocidade_espinho = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	posicao_espinho = $Espinhos.global_position
	espinho_descendo = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if espinho_descendo:
		posicao_espinho.y += velocidade_espinho
	else:
		posicao_espinho.y -= velocidade_espinho

	$Espinhos.global_position = posicao_espinho


func _on_Subir_area_entered(area):
	if area.get_filename().get_file() == "Espinhos.tscn":
		espinho_descendo = false


func _on_Descer_area_entered(area):
	if area.get_filename().get_file() == "Espinhos.tscn":
		espinho_descendo = true
