extends KinematicBody2D


var vel = Vector2.ZERO
var dir
var move_speed = 80.0
var gravity = 1800.0

var can_move: bool = true


func _physics_process(delta):
	if is_on_floor() == false:
		vel.y += gravity * delta
	
	if can_move:
		vel = move_and_slide(Vector2(vel.x * move_speed, vel.y), Vector2.UP)


func hit():
	can_move = false
	var dir = ManagerGame.player_global_ref.global_position.direction_to(global_position)
	
	var t = get_tree().create_tween()
	t.tween_method(self, 'move_and_slide', Vector2.ZERO, dir * 100, 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	yield(t, "finished")
	can_move = true
