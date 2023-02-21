extends Node



const SAVE_PATH = 'user://player_data.json'

var is_from_portal: bool = false
var portal_towards: String = ''
var current_location: String = ''


var inv_items_slots: int = 20
var player_data: Dictionary = {
	'gold': 0,
	'inv_items': []
}


func _ready():
	OS.center_window()
	
	var f = File.new()
	if f.file_exists(SAVE_PATH):
		load_game()
	else:
		new_game()


func portal_activate(world_name: String):
	is_from_portal = true
	portal_towards = world_name
	get_tree().change_scene("res://scenes/%s.tscn" % world_name)


func save_game():
	var f = File.new()
	f.open(SAVE_PATH, f.WRITE)
	f.store_string(JSON.print(player_data))
	f.close()


func new_game():
	#generate 20 empty inv slots
	for i in inv_items_slots:
		player_data['inv_items'].append({})
	save_game()


func load_game():
	var f = File.new()
	f.open(SAVE_PATH, f.READ)
	player_data = parse_json(f.get_as_text())
	f.close()


func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST or what == NOTIFICATION_WM_FOCUS_OUT:
		save_game()
