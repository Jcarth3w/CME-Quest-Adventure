extends StaticSceneButton

func on_finished():
	get_parent().resume_room()
	disabled = true
