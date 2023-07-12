extends TextureButton


signal atk(pLevel)
signal def(pLevel)
signal mag(pLevel)

var level = 0
var type = ""
var CD = 0
var on_CD = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if on_CD:
		$CD.value -= 1 #* delta
		if $CD.value == 0:
			on_CD = false

func initAction(pName, pLevel, pCD):
	CD = pCD
	type = pName
	level = pLevel
	$level.text = str(pLevel)
	changeTexture(type)
	connect(type,get_node("/root/Fight"),"_on_"+type+"_pressed")


func changeTexture(pName):
	if pName == "atk":
		var act0 = preload("res://assets/UI/icon/icon-atk_0.png")
		var act1 = preload("res://assets/UI/icon/icon-atk_1.png")
		var act2 = preload("res://assets/UI/icon/icon-atk_2.png")
#		texture_normal.resource_path = "res://assets/UI/icon/icon-"+pName+"_0.png"
#		texture_pressed.resource_path = "res://assets/UI/icon/icon-"+pName+"_1.png"
#		texture_disabled.resource_path = "res://assets/UI/icon/icon-"+pName+"_2.png"
		set_normal_texture(act0)
		set_pressed_texture(act1)
		set_disabled_texture(act2)
	elif pName == "def":
		var act0 = preload("res://assets/UI/icon/icon-def_0.png")
		var act1 = preload("res://assets/UI/icon/icon-def_1.png")
		var act2 = preload("res://assets/UI/icon/icon-def_2.png")
		set_normal_texture(act0)
		set_pressed_texture(act1)
		set_disabled_texture(act2)
	elif pName == "mag":
		var act0 = preload("res://assets/UI/icon/icon-mag_0.png")
		var act1 = preload("res://assets/UI/icon/icon-mag_1.png")
		var act2 = preload("res://assets/UI/icon/icon-mag_2.png")
		set_normal_texture(act0)
		set_pressed_texture(act1)
		set_disabled_texture(act2)

func _on_action_pressed():
	emit_signal(type,level)
	$CD.value = 100
	on_CD = true

