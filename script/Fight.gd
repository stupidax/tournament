extends Node2D
export(PackedScene) var Mob
export(PackedScene) var Action

#Game var
var waveNumber = 0

#Player var
var playerHP = 200
var playerAtk = 10
var playerMag = 20
var playerPower = 0
var playerFocus = 2
var playerDead = false
var playerXp = 0
var playerLevel = 1
var playerAtkTimeCD = 2
#Player action
var playerAction = ["atk"]

#Mob var
var mobHP = 0
var mobAtk = 0
var mobMag = 0
var mobPower = 0
var mobFocus = 0
var mobDead = true

# Called when the node enters the scene tree for the first time.
func _ready():
	initPlayerStat()



func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func initPlayerStat():
	#adjust player power timer
	$Timer_power_player.wait_time = 0.3 / playerFocus
	$UI/cont_Full/cont_HP/HP_player.text = str(playerHP)
	$UI/cont_Full/cont_HP/bar_HP_player.max_value = playerHP
	$UI/cont_Full/cont_HP/bar_HP_player.value = playerHP
	$UI/cont_Full/cont_Xp/level.text = str(playerLevel)
	$UI/cont_Full/cont_Xp/bar_xp.value = playerXp
	#test
	var ins_action = Action.instance()
	get_node(get_action_path("right")).add_child(ins_action)
	ins_action.initAction("atk",1,playerAtkTimeCD)
	var ins_action2 = Action.instance()
	get_node(get_action_path("left")).add_child(ins_action2)
	ins_action2.initAction("def",1,playerAtkTimeCD)
	
func regainPower():
	if !mobDead :
		mobPower += mobFocus
		$UI/cont_Full/cont_power/bar_power_mob.value = mobPower
		$UI/cont_Full/cont_power/power_mob.text = str(mobPower)
	if !playerDead : 
		$UI/cont_Full/cont_power/bar_power_player.value += 0.1
		if playerPower < floor($UI/cont_Full/cont_power/bar_power_player.value):
			playerPower = floor($UI/cont_Full/cont_power/bar_power_player.value)
			$UI/cont_Full/cont_power/power_player.text = str(playerPower)
			checkActionPowerCost()
		

func _on_atk_pressed(level):
	if playerPower >= level:
		playerPower -= level
		$UI/cont_Full/cont_power/bar_power_player.value -= 1
		playerPower = floor($UI/cont_Full/cont_power/bar_power_player.value)
		$UI/cont_Full/cont_power/power_player.text = str(playerPower)
	checkActionPowerCost()

func newMob():
	var vNewMob = Mob.instance()


func _on_Timer_power_player_timeout():
		regainPower()

func checkActionPowerCost():
	for i in get_node("UI/cont_Full/cont_icon/cont_left/margin_left/grid_left").get_children():
		if i.name.begins_with("action"):
			if playerPower >= i.level and !i.on_CD:
				i.disabled = false
			else:
				i.disabled = true
	for i in get_node("UI/cont_Full/cont_icon/cont_right/margin_right/grid_right").get_children():
		if i.name.begins_with("action"):
			if playerPower >= i.level and !i.on_CD:
				i.disabled = false
			else:
				i.disabled = true

func get_action_path(pPosition):
	if pPosition == "left":
		print("ok")
		return "UI/cont_Full/cont_icon/cont_left/margin_left/grid_left"
	if pPosition == "right":
		return "UI/cont_Full/cont_icon/cont_right/margin_right/grid_right"

