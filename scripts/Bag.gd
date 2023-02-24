extends Tabs

onready var list = get_node('%InvList')

func _ready():
	pass


func refresh_list():
	for child in list.get_children():
		child.remove_item()
	
	var count = 0
	for dict in ManagerGame.player_data['inv_items']:
		if dict != {}:
			list.get_child(count).display_item(dict)
		
		count += 1
