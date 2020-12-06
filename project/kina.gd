extends KinematicBody
signal qwe

var speed = 2
var acceleration = 9
var gravity = 0.015
var jump = 0.3


var mouse_sensitivity = 0.1

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 



func _ready():
	pass


func _physics_process(delta):
	




	
	direction = Vector3()
	
	move_and_slide(fall, Vector3.UP)
	
	if not is_on_floor():
		fall.y -= gravity
	elif is_on_floor():
		fall.y=0
		
	if Input.is_action_pressed("jump") and is_on_floor():
		fall.y = jump
		
	if Input.is_action_just_pressed("ui_cancel"):
		emit_signal("pause")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	
	if Input.is_action_pressed("ui_up"):
	
		direction -= transform.basis.z
	
	elif Input.is_action_pressed("ui_down"):
		
		direction += transform.basis.z
		
	if Input.is_action_pressed("ui_left"):
		
		direction -= transform.basis.x
		
	elif Input.is_action_pressed("ui_right"):
		
		direction += transform.basis.x

		
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta) 
	velocity = move_and_slide(velocity, Vector3.UP) 





