extends CharacterBody3D
@onready var player: CharacterBody3D = $player
@onready var nav_agent = $NavigationAgent3D

var SPEED = 3.5

func _physics_process(_delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	look_at(next_location)
	
	nav_agent.set_velocity(new_velocity)
	
func update_target_location(target_location):
	nav_agent.set_target_position(target_location)

func _on_navigation_agent_3d_target_reached():
	print("in range")

func _on_navigation_agent_3d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity, .25)
	move_and_slide()
