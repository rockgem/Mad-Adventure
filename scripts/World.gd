extends Node2D


#### IMPORTANT NOTE ######################################
# the system which enables the game to transition the player towards another map
# relies heavily on the World's node.name, for example each map needs to be very specific
# World and World2 are essentially different map
# recommended usage: when creating a new map, rename the scene into like 'Town' and also dont forget to
# rename the root node to 'Town' as well to avoid confusion.
##########################################################


func _ready():
	$YSort/Player/Camera2D.limit_top = $CamLimits/TL.global_position.y
	$YSort/Player/Camera2D.limit_left = $CamLimits/TL.global_position.x
	$YSort/Player/Camera2D.limit_right = $CamLimits/BR.global_position.x
	$YSort/Player/Camera2D.limit_bottom = $CamLimits/BR.global_position.y
	
	
	if ManagerGame.is_from_portal:
		
		for portal in $Portals.get_children():
			if portal.towards == ManagerGame.current_location:
				portal.is_active = false
				$YSort/Player.global_position = portal.global_position
				break
		
		ManagerGame.is_from_portal = false
	
	ManagerGame.current_location = name
