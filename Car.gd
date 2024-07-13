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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _physics_process(_delta):
	pass


func _integrate_forces(state):
	apply_torque(10000.0)
	#print(state)
	pass






func adjustCarToSpec():
	pass



