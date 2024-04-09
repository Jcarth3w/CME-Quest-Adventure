extends StaticSceneButton

func on_finished():
	on_mouse_exited()
	get_parent().resume_room()
	disabled = true
