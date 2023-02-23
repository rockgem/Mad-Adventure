extends Node


signal npc_clicked
signal player_movement_stop(boolean)
signal dialog_activated(data)
signal pop_scene_to_ui(packed_scene)
signal npc_shop_activated


var is_from_portal: bool = false
var portal_towards: String = ''
var current_location: String = ''

var inv_items_slots: int = 20

var player_data: Dictionary = {
	'gold': 99999,
	'inv_items': []
}

var player_global_ref = null

onready var collection = Firebase.Firestore.collection('users')


func _ready():
	OS.center_window()


func portal_activate(world_name: String):
	is_from_portal = true
	get_tree().change_scene("res://scenes/%s.tscn" % world_name)


func save_game():
	var task: FirestoreTask = collection.update(Firebase.Auth.auth['localid'], player_data)
	var doc: FirestoreDocument = yield(task, "update_document")


func new_game():
	#generate 20 empty inv slots
	for i in inv_items_slots:
		player_data['inv_items'].append({})
	
	var task: FirestoreTask = collection.add(Firebase.Auth.auth['localid'], player_data)
	var doc: FirestoreDocument = yield(task, "add_document")


func load_game():
	var task: FirestoreTask = collection.get(Firebase.Auth.auth['localid'])
	var doc: FirestoreDocument = yield(task, "get_document")


func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST or what == NOTIFICATION_WM_FOCUS_OUT:
		return
#		save_game()
