extends Panel


var item: Item = null


func display_item(data: Dictionary):
	if data.empty():
		return
	
	item = Item.new()
	item.props = data.duplicate()
	
	if item.props['stack'] > 1:
		$Amount.text = 'x' + str(item.props['stack'])
		$Amount.show()
	
	$Icon.texture = load("res://assets/items/%s.png" % item.props['id'])


func remove_item():
	$Icon.texture = null
	item = null
	$Amount.hide()
