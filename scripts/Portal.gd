extends Area2D


export(String) var towards: = ''
var is_active: bool = true

func _on_Portal_body_entered(body):
	if is_active:
		ManagerGame.portal_activate(towards)


func _on_Portal_body_exited(body):
	if is_active == false:
		is_active = true
