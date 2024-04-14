extends Area2D

#Resources
@export var get_resource: Resource
var red_val: float
var blue_val: float
var green_val: float
var can_price: int

# Control Vars
@export var removal_particle: PackedScene
var check_mouse_state: bool = false
var get_parent_can: Sprite2D
var level_money: int

func _init():
	Datamanager.connect("current_money_held", _current_money_held)

func _ready():
	#Resources
	red_val = get_resource.red_value
	blue_val = get_resource.blue_value
	green_val = get_resource.green_value
	can_price = get_resource.can_price
	
	get_parent_can = get_parent()
	#print("R:",red_val," B:",blue_val," G:",green_val)

# Mouse is hovering or not
func _mouse_enter():
		if level_money >= can_price:
			check_mouse_state = true
			get_parent_can.get_material().set_shader_parameter("strength", true)
			get_parent_can.get_material().set_shader_parameter("outline_colour", Color.WHITE)
		else:
			check_mouse_state = true
			get_parent_can.get_material().set_shader_parameter("strength", true)
			get_parent_can.get_material().set_shader_parameter("outline_colour", Color.RED)
		
		# Play Select Sound
		var get_sfx_player = get_child(1)
		var get_sound = preload("res://Sounds/SFX_CanSelect.wav")
		get_sfx_player.stream = get_sound
		get_sfx_player.playing = true
		
		# Send Values for UI
		Datamanager.send_ui_values.emit(red_val, blue_val, green_val, can_price, true)

func _mouse_exit():
		check_mouse_state = false
		get_parent_can.get_material().set_shader_parameter("strength", false)
		Datamanager.send_ui_values.emit(red_val, blue_val, green_val, can_price, false)

# Check if player can afford new cans
func _current_money_held(get_current_money):
	level_money = get_current_money

#If Clicked, Send Values of this object
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed == true:
			# Play Fail Sound
			if  level_money < can_price && check_mouse_state == true:
				var get_sfx_player = get_child(1)
				var fail_sound = preload("res://Sounds/SFX_DenyedAction.wav")
				get_sfx_player.stream = fail_sound
				get_sfx_player.playing = true
			
			# Spawn Particle, send price increases, then delete parent
			elif check_mouse_state == true:
				Datamanager.send_can_values.emit(red_val, blue_val, green_val, can_price)
				
				var level_parent = get_parent_can.get_parent()
				var effect_instance: GPUParticles2D = removal_particle.instantiate()
				effect_instance.position = get_parent_can.position
				
				# Play fall sound
				var get_sfx_player = get_parent_can.get_parent().get_child(4)
				get_sfx_player.playing = true
				
				#Delete Can
				level_parent.add_child(effect_instance)
				effect_instance.emitting = true
				get_parent_can.queue_free()
