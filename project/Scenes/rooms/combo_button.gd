extends StaticSceneButton

func _on_finished():
	get_parent().resume_room()
	disabled = true
