extends CharacterBody3D

class_name EntitieBase

var CurrentState: String = "null"
var deltaCheck = 0.001
var Hp = 100
var a_Main: Mainio_ = null
var maxHp = 100


func _ready():
	a_Main = get_node("/root/Main")
	call("SetDefaults")


func ChangeState(StateName:String):
	CurrentState = StateName

func _process(delta):
	deltaCheck = delta
	if(CurrentState != "null"):
		call(CurrentState)

func StopFuntions():
	set_process(false)

func StartFunctions():
	set_process(true)

func TakeDamage(damage: float):
	Hp -= damage;
	if(Hp <= 1):
		pass
#This is where death should be started upon too much loss of health
