extends MiniGame

var answers: Dictionary = {}


func _ready():
	answers["andragogy"] = $Word1
	answers["social learning"] = $Word2
	answers["cognitivism"] = $Word3
	answers["constructivism"] = $Word4
	answers["experiential learning"] = $Word5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_exit_button_pressed():
	visible = false


func _on_check_button_pressed():
	check_answer()


func check_answer():
	if $UserText.text in answers: 
		answers.get($UserText.text).visible = true
	$UserText.clear()
