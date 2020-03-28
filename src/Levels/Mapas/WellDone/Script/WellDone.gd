tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var proximoLevel: PackedScene

func _on_WellDone_body_entered(body):
	ir_proxima_fase()


func _get_configuration_warning():
	return "A próxima cena deve ser setada!" if not proximoLevel else ""

func ir_proxima_fase():
	get_parent().get_node('Temporizador').stop()
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(proximoLevel)
