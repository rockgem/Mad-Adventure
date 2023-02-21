extends Node





func add_item_to_bag(data: Item):
	ManagerGame.player_data['inv_items'].append(data.props)
