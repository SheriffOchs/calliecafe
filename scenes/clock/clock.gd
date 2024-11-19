extends Node

@export var dayNumber = 0
@export var hourNumber = 0
@export var minuteNumber = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$DayControl/Days.text = str(dayNumber)
	$ClockBG/ClockControl/Hour.text = str(hourNumber)
	$ClockBG/ClockControl/Minutes.text = str(minuteNumber)
	
	var clockTimer = $ClockBG/ClockControl/Minutes/Timer
	clockTimer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	minuteNumber += 10
	if minuteNumber >= 60:
		minuteNumber = 0
		hourNumber += 1
	if hourNumber >= 24:
		dayNumber += 1
		hourNumber = 0
	$DayControl/Days.text = str(dayNumber)
	if minuteNumber == 0:
		$ClockBG/ClockControl/Minutes.text = "00"
	else:
		$ClockBG/ClockControl/Minutes.text = str(minuteNumber)
	
	if hourNumber < 10:
		$ClockBG/ClockControl/Hour.text = "0" + str(hourNumber)
	else:
		$ClockBG/ClockControl/Hour.text = str(hourNumber)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
