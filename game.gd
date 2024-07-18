extends Node2D

var cameraOffset = Vector2(500,-100)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Camera2D.position = $Car.bodyPosition + cameraOffset
	#print($Camera2D.position)
	#print($'Car'.global_position)  
	#print($Car.bodyPosition )
	pass



func makeCourse():
	get_tree()
	pass










