extends KinematicBody2D



var vel = Vector2.ZERO
var move_speed = 900.0
var gravity = 2000.0




func _physics_process(delta):
	if is_on_floor() == false:
		vel.y += gravity * delta
	
	vel.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	
	if Input.is_action_just_pressed('ui_up') and is_on_floor():
		vel.y = -1000.0
	
	
	vel = move_and_slide(Vector2(vel.x * move_speed, vel.y), Vector2.UP)
