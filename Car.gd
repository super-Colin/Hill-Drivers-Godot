extends Node2D
#extends Skeleton2D
#extends RigidBody2D

var bodyPosition = Vector2.ZERO # This will be used for camera reference
# --- Car settings (Upgradable) ---
var width = 6
var suspentionHeight = 4
var suspensionStiffnessOuter = 64
var suspensionStiffnessMiddle = 20
var tireSize = 3
var tireFriction = 0.25
var enginePower = 1000
var engineFuel = 100
var engineMaxFuel = 100
var jumpJetFuel = 1000
var jetMaxFuel = 100
var jumpJetPower = 10000
# ---------------------------------

# ------ Current run vars ---------
var remainingFuel = 0
# ===
func resetCurrentRunVars():
	remainingFuel = engineMaxFuel
# ---------------------------------

# ------- Physics vars ------------
# Acceleration
var forwardAcceleration = 0.0
var reverseAcceleration = 0.0
# ===

# ---------------------------------




func _ready():
	_ChangeEnginePower(enginePower)
	_ChangeTireFriction(tireFriction)
	%Body.can_sleep = false # This is the player after all...
	%FrontTire.can_sleep = false # This is the player after all...
	%BackTire.can_sleep = false # This is the player after all...
	Events.ChangeEnginePower.connect(_ChangeEnginePower)
	Events.ChangeTireFriction.connect(_ChangeTireFriction)
	Events.ChangeSuspensionStiffness.connect(_ChangeSuspensionStiffness)
	Events.RefillFuel.connect(_refillFuel)


func _refillFuel():
	engineFuel = engineMaxFuel
	engineFuel = jetMaxFuel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	bodyPosition = $'Body'.global_position
	#drawSuspensionLines()




func _physics_process(_delta):
	if Input.is_action_pressed("Forward"):
		%FrontTire.apply_torque(adjustedEngineInput())
		%BackTire.apply_torque(adjustedEngineInput())
	else: if Input.is_action_pressed("Reverse"):
		%FrontTire.apply_torque(adjustedEngineInput() * -0.5)
		%BackTire.apply_torque(adjustedEngineInput() * -0.5)
	if Input.is_action_pressed("Up"):
		%Body.apply_central_force(Vector2(0,-useJumpJet()).rotated(%Body.rotation))


# Why doesn't this get called ... 
func _integrate_forces(_state):
	print("_integrate_forces")
	if Input.is_action_pressed("Forward"):
		print("going forward")
		%FrontTire.apply_torque(adjustedEngineInput())
		%BackTire.apply_torque(adjustedEngineInput())
	else: if Input.is_action_pressed("Reverse"):
		%FrontTire.apply_torque(adjustedEngineInput() * -0.5)
		%BackTire.apply_torque(adjustedEngineInput() * -0.5)

func useEngine():
	jumpJetFuel -= 1
	return adjustedEngineInput()

func adjustedEngineInput()->float:
	return 100.0 * enginePower


func useJumpJet():
	jumpJetFuel -= 1
	return adjustedjumpJetPower()


func adjustedjumpJetPower()->float:
	return 100.0 * jumpJetPower




func _ChangeEnginePower(newEnginePower):
	enginePower = newEnginePower

func _ChangeTireFriction(newTireFriction):
	tireFriction = newTireFriction
	%BackTire.physics_material_override.friction = newTireFriction
	%FrontTire.physics_material_override.friction = newTireFriction

func _ChangeSuspensionStiffness(newSuspensionStiffness):
	$SuspensionRear.stiffness = newSuspensionStiffness
	$SuspensionMiddleRearUpper.stiffness = newSuspensionStiffness
	$SuspensionMiddleFrontUpper.stiffness = newSuspensionStiffness
	$SuspensionFront.stiffness = newSuspensionStiffness
	suspensionStiffnessOuter = newSuspensionStiffness
	suspensionStiffnessMiddle = newSuspensionStiffness



func drawSuspensionLines():
	print($SuspensionRear.global_position)
	print(%Body.global_position)
	$SuspensionRearLine.set_point_position(0, $SuspensionRear.global_position)
	$SuspensionRearLine.set_point_position(1, %Body.global_position)
	$SuspensionFrontLine.set_point_position(0, $SuspensionFront.global_position)
	$SuspensionFrontLine.set_point_position(1, %Body.global_position)




func adjustCarToSpec():
	pass



