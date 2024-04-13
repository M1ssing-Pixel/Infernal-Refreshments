extends Node

var update_money

func _on_game_manager_update_values(get_red, get_blue, get_green, get_money):
	%TextRed.text = str("[center]", get_red, " / 10")
	%TextBlue.text = str("[center]", get_blue, " / 10")
	%TextGreen.text = str("[center]", get_green, " / 10")
	update_money = get_money
	%MoneyText.text = str(update_money)

func _on_level_control_level_rules(get_red, get_blue, get_green, get_money, get_red_start, get_blue_start, get_green_start):
	%DemonText.text = str(get_red, " ", get_blue, " ", get_green)
	%MoneyText.text = str(get_money)
	update_money = get_money
	
	# Starting Values
	%TextRed.text = str("[center]", get_red_start, " / 10")
	%TextBlue.text = str("[center]", get_blue_start, " / 10")
	%TextGreen.text = str("[center]", get_green_start, " / 10")
