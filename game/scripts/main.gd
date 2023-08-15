extends Node3D

class_name Main_

@onready var SoundManager: SoundManager_ = $"[SoundManager]"
@onready var DefaultPlayerSpawn = $Player_defaultSpawnPoint

@export var NpcsPack: Array[PackedScene]
@export var PlayerPack: PackedScene

var Player


func ready():
	Load_World()



func Load_MainMenu():
	pass

func Load_World():
	DefaultPlayerSpawn.visible = false
	Player = PlayerPack.instantiate()
	add_child(Player)
	Player.position = DefaultPlayerSpawn.position
	Player.rotation = DefaultPlayerSpawn.rotation

func Spawn_Npc(Spawn_Position: Vector3, Spawn_Rotation: Vector3):
	Player.position = Spawn_Position
	Player.rotation = Spawn_Rotation

