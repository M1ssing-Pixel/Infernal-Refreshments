extends Node

# Current Value States
var global_red: float
var global_blue: float
var global_green: float

# Demon Values
var demon_red: float
var demon_blue: float
var demon_green: float

var level_money: int
signal Update_Values()

func _ready():
	Datamanager.connect("send_can_values", _send_can_values)

# Update Can Values
func _send_can_values(red_val, blue_val, green_val, can_cost):
	global_red += red_val
	global_blue += blue_val
	global_green += green_val
	level_money -= can_cost
	
	# Clamp Values
	global_red = clampf(global_red,0,10)
	global_blue = clampf(global_blue,0,10)
	global_green = clampf(global_green,0,10)
	level_money = clampi(level_money,0,100)
	
	emit_signal("Update_Values", global_red, global_blue, global_green, level_money)
	Datamanager.current_money_held.emit(level_money)

# Get Demon values for level & Level Money Count
func _on_level_control_level_rules(get_red, get_blue, get_green, get_money, get_red_start, get_blue_start, get_green_start):
	# Level Rules
	demon_red = get_red
	demon_blue = get_blue
	demon_green = get_green
	level_money = get_money
	
	# Starting Values
	global_red = get_red_start
	global_blue = get_blue_start
	global_green = get_green_start
	
	Datamanager.current_money_held.emit(level_money)

# Win/Lose State
func _process(delta):
	if global_red == demon_red:
		if global_blue == demon_blue:
			if global_green == demon_green:
				print("You Win!")
	
	# Money Management
	if level_money <= 0:
		print("You Lose :c")
