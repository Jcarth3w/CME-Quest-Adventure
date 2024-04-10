extends Node2D

@onready var current_page = 0
var pages = []
var completed_pages = 0


func _ready():
	for child in get_children():
		if child.name.contains("Page"):
			child.completed.connect(on_page_complete)
			pages.append(child)


func on_page_complete():
	completed_pages += 1
	if completed_pages == pages.size():
		print("You Fuckin Wonnn")


func _on_previous_pressed():
	if current_page == 0:
		pass
	else:
		pages[current_page].visible = false
		pages[current_page -1].visible = true
		current_page -= 1
		


func _on_next_pressed():
	if current_page == 4:
		pass
	else:
		pages[current_page].visible = false
		pages[current_page +1].visible = true
		current_page += 1
