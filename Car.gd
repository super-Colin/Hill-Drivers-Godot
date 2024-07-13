extends RigidBody2D



var width = 6
var suspentionHeight = 4
var tireSize = 3
var enginePower = 100
var maxFuel = 100

var remainingFuel = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	#add_constant_torque(100000.0)
	can_sleep = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _physics_process(_delta):
	print(_delta)
	pass


func _integrate_forces(state):
	if Input.is_action_pressed("Gas"):
		print("going forward")
		state.apply_torque(getEngineInput())
	#else: if Input.is_action_pressed("Reverse"):
		
	#apply_torque(10000.0)
	#print(state)


func getEngineInput()->float:
	return 100.0 * enginePower





func adjustCarToSpec():
	pass



