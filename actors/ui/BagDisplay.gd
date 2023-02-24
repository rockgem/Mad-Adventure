extends Panel


var item: Item = null


func display_item(data):
	item = Item.new()
	item.props = data.duplicate()
	
	$Icon.texture = load("res://assets/items/%s.png" % data)


func remove_item():
	$Icon.texture = null
	item = null
