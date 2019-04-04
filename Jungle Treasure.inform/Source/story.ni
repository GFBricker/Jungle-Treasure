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

[Flower Puzzle]

[Backpack from Marisa's Jungle Search]
The backpack is a thing in Dock. Understand "bookbag" or "bag" or "book bag" or "pack" or "back pack" as backpack. It is wearable. It is a container. It is closed and openable. The description is "Your backpack is 

[line break]It is [if the backpack is open]open[otherwise]closed[end if]."

Gloves is a thing in the backpack. Gloves is wearable. The description is "".

Machete is a thing in the backpack. 

Understand "machete [something]" as cutting. 

instead of taking Purple Flower:
	if gloves is not worn:
		end the story;
		say "[bold type]You died from touching a poisonous flower!";
	if gloves is worn:
		continue the action.

Purple Flower is a thing. it is in Jungle 1

Dart is a thing. it is in the backpack. the description is "".

Poisonous Dart is a Thing. the description is "".

Blow Pipe is a thing. Blow Pipe can be loaded or unloaded. it is unloaded.

Combining it with is an action applying to two carried things. Understand "Combine [something] with [something]" or "mix [something] with [something]" as Combining it with.

instead of combining Dart with Purple Flower:
	move Poisonous Dart to player;
	move Purple flower to junk;
	move Dart to Junk;
	say "you coat the dart in the toxins of the flower and create a poisonous dart.".

instead of combining Purple flower with dart:
	move Poisonous Dart to player;
	move Purple flower to junk;
	move Dart to Junk;
	say "you coat the dart in the toxins of the flower andcreate a poisonous dart.".

Tribesman is a person. Tribesman is in Jungle 2. Present health of Tribesman is 100.


[Combat with help from BL's Assasin]

present health of player is 100

Attacking it with is an action applying to two things. Understand "attack [something] with [something]" and "hit [something] with [something]" as attacking it with.

A person has a number called max health.
A person has a number called present health.


The max health of a person is usually 100.

The max health of the player is usually 100.

The present health of a person is usually 1.

Definition: a person is dead if his present health is less than 1.

After printing the name of a dead person (this is the I see dead people rule):
    if the person is dead for at least 1 turn, say "[apostrophe]s dead body" instead.

Instead of taking inventory (this is the new inventory listing rule):
if the number of things enclosed by the player is 0, say "You don[apostrophe]t seem to have anything at the moment.[line break](Health: [present health of the player])[line break]" instead;
say "You are carrying: [line break]"; list the contents of the player, with newlines, indented; say "(Health: [present health of the player])[line break]".

Check examining the player (this is the report health rule):
    say "You [status of the player]. (Health: [the present health of the player])[line break]" instead.

To say status of the player:
	let x be the present health of the player;
	if x is 100:
		say "are in perfect health";
	otherwise if x is at most 10:
		say "are near death";
	otherwise if x is at most 20:
		say "are in serious condition";
	otherwise if x is at most 30:
        		say "have taken quite a beating";
    	otherwise if x is at most 60:
      	  	say "have definitely been better, but you could be worse";
    	otherwise if x is at most 70:
        		say "are a little beaten up";
    	otherwise if x is at most 80:
        		say "can almost hide the fact that you have been in a fight";
    	otherwise if x is at most 90:
        		say "have some scrapes and bruises, but you have looked worse";
    	otherwise:
        		say "are a little banged up, but still good-looking".


Check attacking it with: 
	if the second noun is not carried by the player:
		say "You're not holding [the second noun]." instead.
		
Report attacking it with: 
	say "Attacking that doesn't do anything."
	
throwing is an action applying to one thing.
understand "chuck [things]" as throwing. 
understand "heave [things]" as throwing. 
understand "throw [things]" as throwing.
understand "toss [things]" as throwing.
understand "hurl [things]" as throwing. 
understand "pitch [things]" as throwing.

understand "throw [something] at [something]" as throwing it at.

killing is an action applying to one thing.
understand the command "kill" as something new.
understand "kill [things]" as killing.

check throwing something at a second noun
(this is the can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

[Tribesman Interaction combat related]
instead of throwing Dart at Tribesman:
	if the player carries dart:
		if the player is in Jungle 2:
			decrease present health of the Tribesman by 5;
			say "You throw the dart at the Tribesman but he simply pulls it out of his skin as if it were a mosquito sting. The Tribesman's health has been decreased by 5. His current health is [the present health of the Tribesman].[line break]";
		otherwise:
			say "You try to throw the dartat the tribesman, but he is too far away.";
			move dart to location;
	otherwise:
		say "you are not carrying a dart"	

instead of throwing Dart:
	if the player carries dart:
		if the player is in Jungle 2:
			decrease present health of the Tribesman by 5;
			say "You throw the dart at the Tribesman but he simply pulls it out of his skin as if it were a mosquito sting. The Tribesman's health has been decreased by 5. His current health is [the present health of the Tribesman].[line break]";
		otherwise:
			say "You throw the dart at nothing in particular. It is now on the ground.";
	otherwise:
		say "you are not carrying a dart"	
	

Instead of going east from Jungle 2:
	if Tribesman is dead:
		continue the action;
	otherwise:
		decrease present health of player by 10;
		say "[line break]The Tribesman blocks your way into the Temple, as you try to move past he pushes you roughly away from the entrance. Your health has been decreased by 10. Your current health is [the present health of the player].[line break]".
		
[Tribesman interaction everything else]