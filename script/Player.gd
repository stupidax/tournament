extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		print("Attack !")
		play("attack")

func _on_attack():
	attack()

func _on_Player_animation_finished():
	if animation == "attack":
		play("idle")


func attack():
	play("attack")
	#playing sound attack
