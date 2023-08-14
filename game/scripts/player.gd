extends EntitieBase

class_name Player_

@onready var player_model = $PlayerModel
@onready var LookAtObject = $LookAtObject
@onready var camera_mount = $camera_mount
@onready var animation_tree = $AnimationTree

@export var sens_horizontal = 0.3
@export var sens_vertical = 0.3

const JUMP_VELOCITY = 4.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_locked = false
var running = false
var running_speed = 4.5
var SPEED = 3.0
var walking_speed = 3.5


func SetDefaults():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	maxHp = 100
	Hp = 100
	ChangeState("State_Idle")


func _input(event):
	if event is InputEventMouseMotion:
		player_model.rotate_y(deg_to_rad(event.relative.x*sens_horizontal))
		rotate_y(deg_to_rad(-event.relative.x*sens_horizontal))
		camera_mount.rotate_x(deg_to_rad(-event.relative.y*sens_vertical))

func State_Idle():
	var BlendNumber: float = 0
	if Input.is_action_pressed("run"):
		SPEED = running_speed
		running = true
	else:
		SPEED = walking_speed
		running = false

	if not is_on_floor():
		velocity.y -= gravity * deltaCheck

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		BlendNumber += 0.5
		if(running):
			BlendNumber += 0.5
		LookAtObject.look_at(position + direction)
		var Rot: Vector3 = player_model.rotation
		var DirRot: Vector3 = LookAtObject.rotation
		player_model.rotation = Vector3(0, lerp_angle(Rot.y, DirRot.y, 0.08) , 0)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	animation_tree.set("parameters/StateMachine/BlendSpace1D/blend_position", lerp(animation_tree.get("parameters/StateMachine/BlendSpace1D/blend_position"), BlendNumber, 0.20))
