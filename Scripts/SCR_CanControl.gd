extends Area2D

#Resources
@export var get_resource: Resource
var red_val: float
var blue_val: float
var green_val: float
var can_price: int

@export var removal_particle: PackedScene
var check_mouse_state: bool = false

func _ready():
	red_val = get_resource.red_value
	blue_val = get_resource.blue_value
	green_val = get_resource.green_value
	can_price = get_resource.can_price
	print("R:",red_val," B:",blue_val," G:",green_val)

func _mouse_enter():
	check_mouse_state = true

func _mouse_exit():
	check_mouse_state = false

#If Clicked, Send Values of this object
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed == true:
			if check_mouse_state == true:
				Datamanager.Send_Can_Values.emit(red_val, blue_val, green_val, can_price)
				
				# Spawn Particle, then delete parent
				var invis_parent = get_parent()
				var level_parent = invis_parent.get_parent()
				var effect_instance: GPUParticles2D = removal_particle.instantiate()
				effect_instance.position = invis_parent.position
				
				level_parent.add_child(effect_instance)
				effect_instance.emitting = true
				
				invis_parent.queue_free()
	
	# Reload Scene
	if event is InputEventKey:
		if event.keycode == KEY_R:
			get_tree().reload_current_scene()
