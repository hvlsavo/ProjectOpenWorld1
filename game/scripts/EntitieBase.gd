extends CharacterBody3D

class_name EntitieBase

var maxHp = 100

var Hp = 100

var Main_: Game_Main = null

var CurrentState: String = "null"

var deltaCheck = 0.001

func _ready():
	Main_ = get_node("/root/Main")
	call("SetDefaults")

func StopFuntions():
	set_process(false)

func StartFunctions():
	set_process(true)

func _process(delta):
	deltaCheck = delta
	if(CurrentState != "null"):
		call(CurrentState)

func ChangeState(StateName:String):
	CurrentState = StateName

func TakeDamage(damage: float):
	Hp -= damage;
	if(Hp <= 1):
		pass
#This is where death should be started upon too much loss of health
