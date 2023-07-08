extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#test
#deuxième test pour voir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _on_StartButton_button_up():
	get_tree().change_scene("res://scenes/Game/Fight.tscn")
