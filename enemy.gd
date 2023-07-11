extends Node3D

var battle_scene = preload("res://battle_arena.tscn").instantiate()



var active = false

var master = Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		_come_here()

func _on_area_3d_body_entered(_body:Node3D):

	print(_body.name)

	if(_body.name == "Character"):

		var tween = get_tree().create_tween()
		active = true

		tween.tween_property($Sprite3D, "modulate", Color.GREEN, 2)



		master = _body
	


func _come_here():
	
	if Input.is_action_pressed("dash") and active == true:
		var tween = get_tree().create_tween()
	
		
		tween.tween_property(self, "global_position", master.global_position, 1)

		
		

	

func _transition():
	add_child(battle_scene)
