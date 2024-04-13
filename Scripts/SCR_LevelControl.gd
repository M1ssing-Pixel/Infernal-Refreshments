extends Node

#Set Resources
@export var get_resource: Resource
var demon_red: float
var demon_blue: float
var demon_green: float

# Money
@export var level_money: int
@export var starting_red: float
@export var starting_blue: float
@export var starting_green: float

signal LevelRules()

func _ready():
	demon_red = get_resource.red_value
	demon_blue = get_resource.blue_value
	demon_green = get_resource.green_value
	
	emit_signal("LevelRules", demon_red, demon_blue, demon_green, level_money, starting_red, starting_blue, starting_green)
