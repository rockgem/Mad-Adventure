extends KinematicBody2D



var vel = Vector2.ZERO
var move_speed = 600.0
var gravity = 1800.0
var jump_force = 900.0
var dir = 1

var objs_nearby = [] # array of area2Ds or bodies

var can_move: bool = true

func _ready():
	ManagerGame.connect("player_movement_stop", self, 'on_player_movement_stop')
	
	ManagerGame.player_global_ref = self


func _physics_process(delta):
	if is_on_floor() == false:
		vel.y += gravity * delta
	
	if can_move:
		vel.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	
	dir = vel.x
	
	if dir < -0.5:
		$AnimatedSprite.flip_h = true
		$Aim.rotation_degrees = 180.0
	if dir > 0.5:
		$AnimatedSprite.flip_h = false
		$Aim.rotation_degrees = 0.0
	
	if can_move:
		if vel != Vector2.ZERO:
			if is_on_floor():
				$AnimatedSprite.play("run")
			elif is_on_floor() == false and vel.y < -0.5:
				$AnimatedSprite.play("falling")
		else:
			$AnimatedSprite.play("idle")
	
	
	if Input.is_action_just_pressed('ui_up') and is_on_floor():
		$AnimatedSprite.frame = 0
		$AnimatedSprite.play("jump")
		vel.y = -jump_force
	
	if can_move:
		vel = move_and_slide(Vector2(vel.x * move_speed, vel.y), Vector2.UP)


func _unhandled_input(event):
	if Input.is_action_just_pressed("attack") and is_on_floor():
		attack()


func attack():
	print('att')
	can_move = false
	
	for hurtbox in get_node('%Hitbox').get_overlapping_areas():
		hurtbox.get_parent().hit()
	
	$AnimatedSprite.play("attack")
	yield($AnimatedSprite, "animation_finished")
	can_move = true


func on_player_movement_stop(b: bool):
	can_move = !b #this might be fucking confusing


func _on_ObjDetection_area_entered(area):
	objs_nearby.append(area)
	print_debug(objs_nearby)


func _on_ObjDetection_area_exited(area):
	objs_nearby.erase(area)
	print_debug(objs_nearby)
