extends Drop



func action():
	return {String(name) : String(current_item.name)}
