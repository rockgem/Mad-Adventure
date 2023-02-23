extends Node


signal npc_clicked

signal dialog_activated(data)


const SAVE_PATH = 'user://player_data.json'

var is_from_portal: bool = false
var portal_towards: String = ''
var current_location: String = ''

var inv_items_slots: int = 20
var player_data: Dictionary = {
	'gold': 0,
	'inv_items': []
}

var player_global_ref = null

onready var collection = Firebase.Firestore.collection('users')


func _ready():
	OS.center_window()
	
#	var f = File.new()
#	if f.file_exists(SAVE_PATH):
#		load_game()
#	else:
#		new_game()


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
	
	save_game()


func load_game():
	var task: FirestoreTask = collection.get(Firebase.Auth.auth['localid'])
	var doc: FirestoreDocument = yield(task, "get_document")


func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST or what == NOTIFICATION_WM_FOCUS_OUT:
		save_game()
