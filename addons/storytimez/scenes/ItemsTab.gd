tool
extends Tabs

var id_block_refs = []


func _ready():
	pass


func _on_NewProperty_pressed():
	var dup = get_node('%PropertiesBox').duplicate()
	
	id_block_refs.append(dup)
	
	get_node('%CreationPanel').get_node("VBoxContainer").add_child_below_node(get_node('%Bef'), dup)


func _on_Cancel_pressed():
	for block in id_block_refs:
		block.queue_free()
	
	id_block_refs.clear()
	
	get_node('%Tab').show()
	get_node('%CreationPanel').hide()


func _on_Create_pressed():
	var f = EditorFileDialog.new()
	
	get_node('%Tab').hide()
	get_node('%CreationPanel').show()
