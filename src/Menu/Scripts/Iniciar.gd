tool
extends Button

export(String, FILE) var proxima_cena = ""

func _on_Iniciar_button_up():
	get_tree().change_scene(proxima_cena)

func _get_configuration_warning():
	return "A próxima cena deve ser setada" if proxima_cena == "" else ""
