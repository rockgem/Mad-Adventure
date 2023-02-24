extends Control



func _ready():
	Firebase.Auth.connect("auth_request", self, 'on_auth_request')
	Firebase.Auth.connect("login_succeeded", self, 'on_login_succeeded')
	Firebase.Auth.connect("signup_succeeded", self, 'on_signup_succeeded')
	Firebase.Auth.connect("userdata_received", self, 'on_userdata_received')
	Firebase.Auth.connect("token_refresh_succeeded", self, 'on_token_refresh_succeeded')
	
	Firebase.Auth.check_auth_file()


func login_to_game():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func on_auth_request(result_code: int, result_content):
	if result_code == ERR_DOES_NOT_EXIST:
		Firebase.Auth.login_anonymous()


func on_signup_succeeded(auth_result):
	Firebase.Auth.save_auth(auth_result)
	login_to_game()
	ManagerGame.new_game()


func on_login_succeeded(auth_result):
	login_to_game()
	ManagerGame.load_game()


func on_token_refresh_succeeded(auth_result):
	login_to_game()
	ManagerGame.load_game()
