extends Node2D



var cameraOffset = Vector2(500,-100)


# Called when the node enters the scene tree for the first time.
func _ready():
	#%EnginePowerSlider.drag_ended.connect(func(_e):Events.ChangeEnginePower.emit(%EnginePowerSlider.value))
	%EnginePowerSlider/HSlider.drag_ended.connect(func(_e):Events.ChangeEnginePower.emit(%EnginePowerSlider/HSlider.value))
	%TireFrictionSlider/HSlider.drag_ended.connect(func(_e):Events.ChangeTireFriction.emit(%TireFrictionSlider/HSlider.value))
	%SuspensionStiffnessSlider/HSlider.drag_ended.connect(func(_e):Events.ChangeSuspensionStiffness.emit(%SuspensionStiffnessSlider/HSlider.value))
	%RefillFuelButton.pressed.connect(func():Events.refillFuel.emit())



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Camera2D.position = $Car.bodyPosition + cameraOffset
	#%DebugPanel/MarginContainer/EnginePower/HBoxContainer/EnginePowerSliderLabel.text = str($Car.enginePower)
	%EnginePowerSlider/Label.text = str($Car.enginePower)
	%TireFrictionSlider/Label.text = str($Car.tireFriction)
	%SuspensionStiffnessSlider/Label.text = str($Car.suspensionStiffnessOuter)

func printHi(_h):
	print("hi")
	print(_h)
	print(str(%TireFrictionSlider/HSlider.value))
	Events.ChangeTireFriction.emit(%TireFrictionSlider/HSlider.value)

func makeCourse():
	#get_tree()
	pass










