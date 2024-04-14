extends Node

var update_money
var played_demon_sound: bool

func _ready():
	Datamanager.connect("send_ui_values", _send_ui_values)
	played_demon_sound = false

func _on_game_manager_update_values(get_red, get_blue, get_green, get_money):
	%TextRed.text = str("[center]", get_red, " / 10")
	%TextBlue.text = str("[center]", get_blue, " / 10")
	%TextGreen.text = str("[center]", get_green, " / 10")
	update_money = get_money
	%MoneyText.text = str(update_money)

func _on_level_control_level_rules(get_red, get_blue, get_green, get_money, get_red_start, get_blue_start, get_green_start):
	%DemonText.text = str(get_red, "\n" , get_blue, "\n", get_green)
	%MoneyText.text = str(get_money)
	update_money = get_money
	
	# Starting Values
	%TextRed.text = str("[center]", get_red_start, " / 10")
	%TextBlue.text = str("[center]", get_blue_start, " / 10")
	%TextGreen.text = str("[center]", get_green_start, " / 10")

func _send_ui_values(red_val, blue_val, green_val, can_price, active_val) -> void:
	if active_val == true:
		%DrinkRefText.text = str("R = ", red_val, "\nB = ", blue_val, 
								"\nG = ", green_val, "\nPrice = ", can_price)
	else:
		%DrinkRefText.text = str("R = ???\nB = ???\nG = ???\nPrice = ???")

# Turn off Vicotry Layer
func _on_game_manager_change_level():
	#Fix this crap code later lol
	var victory_layer = get_parent().get_parent().get_parent().get_child(2)
	victory_layer.visible = true
	
	if played_demon_sound == false:
		var demon_sfx = $"../../../../FallSFX/DemonSFX"
		demon_sfx.play()
		played_demon_sound = true
