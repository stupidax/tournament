extends Node2D
export(PackedScene) var Mob

#Game var
var waveNumber = 0

#Player var
var playerHP = 200
var playerAtq = 10
var playerMag = 20
var playerPower = 0
var playerFocus = 2
var playerDead = false
var playerXp = 0
var playerLevel = 1

#Mob var
var mobHP = 0
var mobAtq = 0
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
	$Timer_power_player.wait_time = 0.1 / playerFocus
	$UI/cont_Full/cont_HP/HP_player.text = str(playerHP)
	$UI/cont_Full/cont_HP/bar_HP_player.max_value = playerHP
	$UI/cont_Full/cont_HP/bar_HP_player.value = playerHP
	$UI/cont_Full/cont_Xp/level.text = str(playerLevel)
	$UI/cont_Full/cont_Xp/bar_xp.value = playerXp

func regainPower():
	if !mobDead :
		mobPower += mobFocus
		$UI/cont_Full/cont_power/bar_power_mob.value = mobPower
		$UI/cont_Full/cont_power/power_mob.text = str(mobPower)
	if !playerDead : 
		$UI/cont_Full/cont_power/bar_power_player.value += 0.1
		playerPower = floor($UI/cont_Full/cont_power/bar_power_player.value)
		$UI/cont_Full/cont_power/power_player.text = str(playerPower)
		
	

func newMob():
	var vNewMob = Mob.instance()


func _on_Timer_power_player_timeout():
		regainPower()
