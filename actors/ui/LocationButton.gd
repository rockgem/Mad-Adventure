extends Button


signal clicked(this_name)


export(String) var towards = ''



func _on_LocationButton_pressed():
	if towards != '':
		emit_signal("clicked", towards)
