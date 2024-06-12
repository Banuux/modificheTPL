extends Node

var points = 0
static var cur_level = 1

func add_point():
	points +=1
	print(points)
	

func get_coins():
	return points

func cur_level_to_next():
	cur_level += 1

func get_cur_level():
	return cur_level
