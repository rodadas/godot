extends Label


var a =0


# Called when the node enters the scene tree for the first time.
func _ready():
	text=str(a)


func plusscore():
	a+=1
	text=str(a)
	
