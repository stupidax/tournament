extends TextureButton


signal atk(pLevel)
signal def(pLevel)
signal mag(pLevel)

var level = 0
var type = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func initAction(pName, pLevel):
	type = pName
	level = pLevel
	$level.text = str(pLevel)
	changeTexture(type)
	connect(type,get_node("/root/Fight"),"_on_"+type+"_pressed")


func changeTexture(pName):
	print("changed")
	texture_normal.resource_path = "res://assets/UI/icon/icon-"+pName+"_0.png"
	texture_pressed.resource_path = "res://assets/UI/icon/icon-"+pName+"_1.png"
	texture_disabled.resource_path = "res://assets/UI/icon/icon-"+pName+"_2.png"

func _on_action_pressed():
	emit_signal(type,level)

