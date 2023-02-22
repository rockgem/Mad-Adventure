tool
extends EditorPlugin


var main_panel_instance = preload("res://addons/storytimez/scenes/StorytimezMain.tscn").instance()



func _enter_tree():
#	get_editor_interface().get_editor_viewport().add_child(main_panel_instance)
	print(get_editor_interface().get_editor_viewport().get_children())
	make_visible(false)


func _exit_tree():
	if main_panel_instance:
		main_panel_instance.queue_free()


func has_main_screen():
	return true


func make_visible(visible):
	if main_panel_instance:
		main_panel_instance.visible = visible


func get_plugin_name():
	return "Storytimez"


func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")
