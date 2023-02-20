extends Node



const SAVE_PATH = 'user://player_data.json'



var inv_items_slots: int = 20
var player_data: Dictionary = {
	'gold': 0,
	'inv_items': []
}


func _ready():
	var f = File.new()
	if f.file_exists(SAVE_PATH):
		load_game()
	else:
		new_game()


func save_game():
	var f = File.new()
	f.open(SAVE_PATH, f.WRITE)
	f.store_string(JSON.print(player_data))
	f.close()


func new_game():
	pass


func load_game():
	var f = File.new()
	f.open(SAVE_PATH, f.READ)
	player_data = parse_json(f.get_as_text())
	f.close()


func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST or NOTIFICATION_WM_FOCUS_OUT:
		save_game()
