extends Node3D
#hmmmm idk what to put here
#n word
class_name Mainio_

@onready var SoundManager: SoundManager_ = $"[SoundManager]"
@onready var DefaultPlayerSpawn = $Player_defaultSpawnPoint

@export var NpcsPack: Array[PackedScene]
@export var PlayerPack: PackedScene

var Player


func _ready():
	Load_World()



func Load_MainMenu():
	pass

func Load_World():
	Player = PlayerPack.instantiate()
	add_child(Player)
	Player.position = DefaultPlayerSpawn.position
	Player.rotation = DefaultPlayerSpawn.rotation
	DefaultPlayerSpawn.visible = false
	print("LIFE IS WELL. GOD IS GOOD")

func Spawn_Npc(Spawn_Position: Vector3, Spawn_Rotation: Vector3):
	pass

