extends Control



func _ready():
	Firebase.Auth.connect("auth_request", self, 'on_auth_request')
	Firebase.Auth.connect("request_completed", self, 'on_request_completed')
	Firebase.Auth.connect("login_succeeded", self, 'on_login_succeeded')
	Firebase.Auth.connect("signup_succeeded", self, 'on_signup_succeeded')
	Firebase.Auth.connect("signup_failed", self, 'on_signup_failed')
	Firebase.Auth.connect("userdata_received", self, 'on_userdata_received')
	Firebase.Auth.connect("token_refresh_succeeded", self, 'on_token_refresh_succeeded')
	
	Firebase.Auth.check_auth_file()


func login_to_game():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func on_auth_request(result_code: int, result_content):
	if result_code == ERR_DOES_NOT_EXIST:
		$SignupControl.show()


func on_signup_succeeded(auth_result):
	Firebase.Auth.save_auth(auth_result)
	login_to_game()
	ManagerGame.new_game()


func on_signup_failed(code, message):
	get_node('%EmailSignupPanel').get_node("VBoxContainer/Error").text = message
	get_node('%EmailSignupPanel').get_node("VBoxContainer/Error").show()


func on_login_succeeded(auth_result):
	login_to_game()
	ManagerGame.load_game()


func on_token_refresh_succeeded(auth_result):
	login_to_game()
	ManagerGame.load_game()


func on_request_completed():
	pass




func _on_Anon_pressed():
	$SignupControl.hide()
	Firebase.Auth.login_anonymous()


func _on_Email_pressed():
	get_node('%EmailSignupPanel').show()


func _on_SignupEmail_pressed():
	var e = get_node('%EmailField').text
	var p = get_node('%PassField').text
	Firebase.Auth.signup_with_email_and_password(e, p)


func _on_Cancel_pressed():
	get_node('%EmailSignupPanel').hide()







