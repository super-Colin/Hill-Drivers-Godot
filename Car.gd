extends Node2D
#extends Skeleton2D
#extends RigidBody2D

var bodyPosition = Vector2.ZERO
# --- Car settings (Upgradable) ---
var width = 6
var suspentionHeight = 4
var tireSize = 3
var enginePower = 1000
var maxFuel = 100
# ---------------------------------

# ------ Current run vars ---------
var remainingFuel = 0
# ===
func resetCurrentRunVars():
	remainingFuel = maxFuel
# ---------------------------------

# ------- Physics vars ------------
# Acceleration
var forwardAcceleration = 0.0
var reverseAcceleration = 0.0
# ===

# ---------------------------------




func _ready():
	#$'.'.custom_integrator  = true
	#$'.'.can_sleep = false # This is the player after all...
	%Body.can_sleep = false # This is the player after all...
	%FrontTire.can_sleep = false # This is the player after all...
	%BackTire.can_sleep = false # This is the player after all...


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print($'Body'.global_position)
	bodyPosition = $'Body'.global_position
	pass


func _physics_process(_delta):
	#print($'.'.state)
	#_integrate_forces($'.'.state)
	if Input.is_action_pressed("Forward"):
		%FrontTire.apply_torque(getEngineInput())
		%BackTire.apply_torque(getEngineInput())
	else: if Input.is_action_pressed("Reverse"):
		%FrontTire.apply_torque(getEngineInput() * -0.5)
		%BackTire.apply_torque(getEngineInput() * -0.5)
	pass


func _integrate_forces(state):
	print("_integrate_forces")
	if Input.is_action_pressed("Forward"):
		print("going forward")
		%FrontTire.apply_torque(getEngineInput())
		%BackTire.apply_torque(getEngineInput())
	else: if Input.is_action_pressed("Reverse"):
		%FrontTire.apply_torque(getEngineInput() * -0.5)
		%BackTire.apply_torque(getEngineInput() * -0.5)
	#apply_torque(10000.0)
	print(state)


func getEngineInput()->float:
	return 100.0 * enginePower





func adjustCarToSpec():
	pass



