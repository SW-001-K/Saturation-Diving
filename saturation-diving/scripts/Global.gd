extends Node

var character : CharacterBody3D
var debug : Debug
signal interacted
signal dayEnd #function that handles day interactions. I know, stupid name, I'll regret it 
signal requestLogInfo
signal alert
var dayEnded : bool 
var dayCount = 1




# Called when the node enters the scene tree for the first time.
