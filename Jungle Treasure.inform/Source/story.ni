"Jungle Treasure" by gbricker19

When play begins:
say "You have sailed from England around Cape Horn to the deep Peruvian jungle in search of ancient Incan Treasure. Your local guide points you towards an area of dense trees and tells you 'The treasure can be found in a hidden temple deep in the rainforest.' He can not lead you to it since the tribesman will attack anyone who comes close to the temple containing the treasure. You should start looking for it now so you can return before it is dark.";
now left hand status line is "Exits: [exit list]";
now right hand status line is "[location]".
To say exit list:
	let place be location;
	repeat with way running through directions:
		let place be the room way from the location;
		if place is a room, say " [way] ".


[rooms]
Dock is a room. "Behind you is the boat that you came here on and the rest of its crew. To the east is Jungle.".

Jungle 1 is a room. It is east of dock. the printed name is "Jungle". "All around you is the Jungle. To the west is the dock. You can make out paths to the east and south.".

Jungle 2 is a room. It is east of Jungle 1. the printed name is "Jungle". "All around you is the Jungle. To the east there appears to be a stone structure but in front of it is a man wearing a mask,he does not look too friendly. You can make out paths to the west and south.".

Jungle 3 is a room. It is south of jungle 1 and west of jungle 4. the printed name is "Jungle". "All around you is the Jungle. You can make out paths to the east and north."

Jungle 4 is a room. It is south of jungle 2. the printed name is "Jungle". "All around you is the Jungle. You can make out paths to the west and north."

Temple entrance is a room. it is east of jungle 2.

Hallway is a room. it is southeast of Temple Entrance.

Treasure Vault is a room. it is southwest of Hallway.

Secret Exit is a room. it is south of jungle 4 and west of Treasure vault.

