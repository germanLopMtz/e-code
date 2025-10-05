extends Control

func _ready():
	$VBoxContainer/Empezar.grab_focus()

func _unhandled_input(event):
	# Si se presiona cualquier tecla (excepto ratón)
	if event is InputEventKey and event.pressed:
		_on_empezar_pressed()

func _on_empezar_pressed():
	get_tree().change_scene_to_file("res://escenarios/rancho.tscn")
