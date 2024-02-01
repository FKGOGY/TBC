extends Node

class_name Entity

var MaxHealth: int 
var CurrentHealth: int
var Armor: int
var Damage: int
var Accuracy: int
var Speed: int
var Dodge

var BleedResistance: int
var PoisonResistance: int
var StunResistance: int
var DebuffResistance: int

func _init():
	MaxHealth = 100
	CurrentHealth = MaxHealth
	Armor = 0
	Damage = 0
	Accuracy = 100
	Speed = 5
	Dodge = 10
	
	BleedResistance = 20
	PoisonResistance = 20
	StunResistance = 20
	DebuffResistance = 20
