extends Node3D

class_name Main_

@onready var SoundManager: SoundManager_ = $"[SoundManager]"

@export var NpcsPack: Array[PackedScene]
@export var PlayerPack: PackedScene

var Player


func ready():
	Load_World()



func Load_MainMenu():
	pass

func Load_World():
	Player = PlayerPack.instantiate()
	add_child(Player)

func Spawn_Npc(Spawn_Position: Vector3, Spawn_Rotation: Vector3):
	Player.position = Spawn_Position
	Player.rotation = Spawn_Rotation

