extends Control



func _ready():
	$UID.text = Firebase.Auth.auth['localid']


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/World.tscn")
