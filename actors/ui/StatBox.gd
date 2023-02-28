tool
extends HBoxContainer



export(String) var stat_name = 'Strength'
export(int) var value = 99


func _ready():
	$Label.text = stat_name
	$Value.text = str(value)
