extends Node3D

class_name Main

@export var PlayerPack: PackedScene
@export var NpcsPack: Array[PackedScene]

var Player


func Spawn_Npc(Spawn_Postion: Vector3, Spawn_Rotation: Vector3):
	pass

func Load_World():
	Player = PlayerPack.instantiate()
	add_child(Player)

func Load_MainMenu():
	pass

func _ready():
	Load_World()
