extends Node2D

signal playerDeath
signal playerScorePoint(amount)

func _ready():
	for child in get_children():
		child.connect("playerDeath", pd)
		child.connect("playerScorePoint", psp)
		
func pd():
	playerDeath.emit()
	
func psp(v):
	playerScorePoint.emit(v)
