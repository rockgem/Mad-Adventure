extends Node2D


func _ready():
	if ManagerGame.is_from_portal:
		
		for portal in $Portals.get_children():
			if portal.towards == ManagerGame.current_location:
				portal.is_active = false
				$YSort/Player.global_position = portal.global_position
				break
		
		ManagerGame.portal_towards = ''
		ManagerGame.is_from_portal = false
	
	ManagerGame.current_location = name
