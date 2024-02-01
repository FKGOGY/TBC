class_name Player extends Entity

var InCombat: bool
var InShop: bool
var Standing: bool
var Inventory: Array

func _init():
	
	InCombat = false
	InShop = false
	Standing = false
	Inventory = []

func FindItem(item_name):
	var index: int = 0
	for i in Inventory:
		if i == item_name:
			return index
		else:
			index = index + 1
	
	return -1

func DisplayInventory():
	for i in Inventory:
		print(i)
