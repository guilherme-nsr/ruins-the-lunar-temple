extends Area2D

var player_presente
export var grupo_alavanca_nome = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_presente and Input.is_action_just_pressed("ação"):
		$SpriteAlavanca.flip_h = true
		get_tree().get_nodes_in_group(grupo_alavanca_nome)[0].ativar()
		set_process(false)


func _on_Alavanca_body_entered(body):
	if body.get_filename().get_file() == "Player.tscn":
		player_presente = true


func _on_Alavanca_body_exited(body):
	if body.get_filename().get_file() == "Player.tscn":
		player_presente = false
