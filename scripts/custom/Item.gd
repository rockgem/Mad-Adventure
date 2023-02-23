extends Reference
class_name Item

enum ITEM_TYPE{
	SWORD,
	ARMOR,
	CONSUMABLE
}



var props: Dictionary = {
	'id': '',
	'name': '',
	'type': ITEM_TYPE.CONSUMABLE
}

func init_item(id: String, name: String, type: int):
	self.props['id'] = id
	self.props['name'] = name
	self.props['type'] = type
