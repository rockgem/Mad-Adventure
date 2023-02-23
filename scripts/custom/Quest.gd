extends Reference
class_name Quest


var props: Dictionary = {
	'id': '',
	'title': '',
	'info': ''
}


func init_quest(id, title, info):
	self.props['id'] = id
	self.props['title'] = title
	self.props['info'] = info
