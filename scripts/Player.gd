extends KinematicBody2D



var vel = Vector2.ZERO
var move_speed = 200.0
var gravity = 900.0
var dir = 1



func _physics_process(delta):
	if is_on_floor() == false:
		vel.y += gravity * delta
	
	vel.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	
	dir = vel.x
	
	if dir < -0.5:
		$AnimatedSprite.flip_h = true
	if dir > 0.5:
		$AnimatedSprite.flip_h = false
	
	
	if vel != Vector2.ZERO:
		if is_on_floor():
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("falling")
	else:
		$AnimatedSprite.play("idle")
	
	
	if Input.is_action_just_pressed('ui_up') and is_on_floor():
		$AnimatedSprite.frame = 0
		$AnimatedSprite.play("jump")
		vel.y = -400.0
	
	
	vel = move_and_slide(Vector2(vel.x * move_speed, vel.y), Vector2.UP)
