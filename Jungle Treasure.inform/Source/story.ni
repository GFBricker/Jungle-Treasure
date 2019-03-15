"Jungle Treasure" by gbricker19

When play begins:
say "You have sailed from England around Cape Horn to the deep Peruvian jungle in search of ancient Incan Treasure. Your local guide points you towards an area of dense trees and tells you 'The treasure can be found in a hidden temple deep in the rainforest.' He can not lead you to it since the tribesman will attack anyone who comes close to the temple containing the treasure. You should start looking for it now so you can return before it is dark.";
now left hand status line is "Exits: [exit list]";
now right hand status line is "[location]".
To say exit list:
	let place be location;
	repeat with way running through directions:
		let place be the room way from the location;
		if place is a room, say " [way] ";
		if location is secret exit, say "".


[rooms]
Dock is a room. "Behind you is the boat that you came here on and the rest of its crew. To the east is Jungle.".

Jungle 1 is a room. It is east of dock. the printed name is "Jungle". "All around you is the Jungle. To the west is the dock. You can make out paths to the east and south.".

Jungle 2 is a room. It is east of Jungle 1. the printed name is "Jungle". "All around you is the Jungle. To the east there appears to be a stone structure but in front of it is a man wearing a mask,he does not look too friendly. You can make out paths to the west and south.".

Jungle 3 is a room. It is south of jungle 1 and west of jungle 4. the printed name is "Jungle". "All around you is the Jungle. You can make out paths to the east and north."

Jungle 4 is a room. It is south of jungle 2 and north of secret exit. the printed name is "Jungle". "All around you is the Jungle. You can make out paths to the west and north."

Temple entrance is a room. it is east of jungle 2.

Hallway is a room. it is southeast of Temple Entrance.

Treasure Vault is a room. it is southwest of Hallway.

Secret Exit is a room. it is west of Treasure vault.

Junk is a room.

[one-way connection, not shown on top left as route]
South of Jungle 4 is nowhere.

[combat]
[with help from BL's Assasin]
A person has a number called max health.
A person has a number called present health.


The max health of a person is usually 100.

The max health of the player is usually 100.

The present health of a person is usually 1.

Definition: a person is dead if his present health is less than 1.

Attacking it with is an action applying to two things. Understand "attack [something] with [something]" and "hit [something] with [something]" as attacking it with.

loading is an action applying to one thing. Understand "load [something]" as loading.

An every turn rule: 
	If the present health of the player is less than 1, end the story finally saying "You Died!".

[Flower Puzzle]

[Backpack from Marisa's Jungle Search]
The backpack is a thing in Dock. Understand "bookbag" or "bag" or "book bag" or "pack" or "back pack" as backpack. It is wearable. It is a container. It is closed and openable. The description is "Your backpack is 

[line break]It is [if the backpack is open]open[otherwise]closed[end if]."

Gloves is a thing in the backpack. Gloves is wearable. The description is "".

Machete is a thing in the backpack. 

Understand "machete [something]" as cutting. 



Purple Flower is a thing.

Dart is a thing. Dart can be poisonous or normal. It is normal.

Blow Pipe is a thing. Blow Pipe can be loaded or unloaded. it is unloaded.

Combining it with is an action applying to two carried things. Understand "Combine [something] with [something]" or "mix [something] with [something]" as Combining it with.

instead of combining Dart with Purple Flower:
	now Dart is Poisonous;
	move Purple flower to junk;
	say "you coat the dart in the toxins of the flower andcreate a poisonous dart.".

instead of combining Purple flower with dart:
	now Dart is Poisonous;
	move Purple flower to junk;
	say "you coat the dart in the toxins of the flower andcreate a poisonous dart.".




