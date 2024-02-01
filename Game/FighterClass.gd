class_name Fighter extends Player

func Attack():
	pass

func Defend():
	Armor += 10
	Dodge += 10

func Heal():
	var index = FindItem("HealthPotion")
	if index == -1:
		return "You have no HealthPotion"
	else: 
		Inventory.remove_at(index)
		CurrentHealth += 15
		if CurrentHealth > MaxHealth:
			CurrentHealth = MaxHealth
	
