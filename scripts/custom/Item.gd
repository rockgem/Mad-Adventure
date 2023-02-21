extends Reference
class_name Item

enum ITEM_TYPE{
	SWORD,
	ARMOR,
	CONSUMABLE
}



var props: Dictionary = {
	'id': 'sword_1',
	'name': 'Sword',
	'type': ITEM_TYPE.CONSUMABLE
}
