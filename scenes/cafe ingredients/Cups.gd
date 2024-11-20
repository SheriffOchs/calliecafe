extends Node2D


enum SizeID {
	Kiddo,
	Small,
	Medium,
	Large,
	Route69
}




# Called when the node enters the scene tree for the first time.
func _ready():
	var hitbox = $Sprite2D/Area2D
	hitbox.input_event.connect(_on_area_2d_input_event)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		print("Clicked!")
		for size in SizeID:
			var SizeButton = Button.new()
			SizeButton.set_name(size)
			$HBoxContainer.add_child(SizeButton)
			SizeButton.text = str(size)
