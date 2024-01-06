extends Node2D

@export
var audio_stream: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_toggled(toggled_on):
	if toggled_on:
		audio_stream.play()
	else:
		audio_stream.stop()


func _on_h_slider_value_changed(value):
	var my_tone: AudioStreamMyTone = audio_stream.stream
	my_tone.hz = value
