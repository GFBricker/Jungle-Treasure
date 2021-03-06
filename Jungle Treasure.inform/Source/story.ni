"Jungle Treasure" by gbricker19

instead of examining player:
	say "An adventurer in a classic jungle exploring clothes. Your current health is [present health of player]".
	
After reading a command:
	if the player’s command matches “take all”:
		say "Hmm, if the game was that easy it wouldn't be worth playing";
		stop the action.

After reading a command:
	if the player’s command matches “get all”:
		say "Hmm, if the game was that easy it wouldn't be worth playing";
		stop the action.
				
				
When play begins:
say "You have sailed from England around Cape Horn to the deep Peruvian jungle in search of ancient Incan Treasure. Your local guide points you towards an area of dense trees and tells you 'The treasure can be found in a hidden temple deep in the rainforest.' He cannot lead you to it since the tribesman will attack anyone who comes close to the temple containing the treasure. You should start looking for it now so you can return before it is dark.";
now left hand status line is "Exits: [exit list]";
now right hand status line is "[location]".
To say exit list:
	let place be location;
	repeat with way running through directions:
		let place be the room way from the location;
		if place is a room, say " [way] ";


[rooms]
Dock is a room. "Behind you is the boat that you came here on and the rest of its crew. To the east is Jungle.".

Jungle 1 is a room. It is east of dock. the printed name is "Jungle". "All around you is the Jungle. To the west is the dock. You can make out paths to the east and south.".

Jungle 2 is a room. It is east of Jungle 1. the printed name is "Jungle". "All around you is the Jungle. To the east there appears to be a stone structure but in front of it is a large tribesman, he does not look too friendly. You can make out paths to the west and south.".

Jungle 3 is a room. It is south of jungle 1 and west of jungle 4. the printed name is "Jungle". "All around you is the Jungle. You can make out paths to the east and north."

Jungle 4 is a room. It is south of jungle 2 and north of secret exit. the printed name is "Jungle". "All around you is the Jungle. You can make out paths to the west and north."

Temple entrance is a room. it is east of jungle 2. the description is "[if TE is 0]As you enter the temple the door slams down behind you trapping you in a block of rock.[end if] A little light coming in from holes in the roof allows you to make out buttons and a painting on one of the walls."

TE is a number variable. TE is 0.

an every turn rule: 
	if player is in temple entrance:
		increase TE by 1.

Hallway is a room. it is southeast of Temple Entrance. the description is "A fairly bare hallway with piles of sand strewn around."

Treasure Vault is a room. it is southwest of Hallway. the description is "A decorated vault with a Golden Totem on a pedestal in the middle of the room. This is just the type of treasure you have been looking for!"

Secret Exit is a room. it is west of Treasure vault. the description is "A room overhanging the jungle outside the temple, once you exit the temple you will not be able to return. Make sure you have everything you could want before leaving."

Junk is a room.

[one-way connection, not shown on top left as route]
South of Jungle 4 is nowhere.

instead of going east from Jungle 2:
	if TE is 0:
		continue the action;
	otherwise:
		say "The door came down behind you when you entered and continues to block the entrance to the temple."


west of temple entrance is nowhere


[Flower Puzzle]

[Backpack from Marisa's Jungle Search]
The backpack is a thing in Dock. Understand "bookbag" or "bag" or "book bag" or "pack" or "back pack" as backpack. It is wearable. It is a container. It is closed and openable. The description is "Your backpack is a small hiking backpack intended for single day trips.[line break]It is [if the backpack is open]open[otherwise]closed[end if]."

Gloves is a thing in the backpack. Gloves is wearable. The description is "Thick wool gloves that will protect you from any outside harm."

Machete is a thing in the backpack. The description is "A large 12 inch knife intended for cutting through brush, could be used in combat.".

instead of taking Purple Flower:
	if gloves is not worn:
		end the story;
		say "[bold type]You died from touching a poisonous flower!";
	if gloves is worn:
		continue the action.

Purple Flower is a thing. it is in Jungle 4. the description is "A small Purple flower that smells horrible."

dart-count is a number variable. dart-count is 5. 

Dart is a thing. The printed name is "Dart x [dart-count]". it is in the backpack. The description is "A small throwing dart that can be used as a weapon. Maybe try [bold type]combining[roman type] with a certain substance.".

PD-count is a number variable. PD-count is 1.

Poisonous Dart is a Thing. The printed name is "Poisonous Dart x [PD-count]". the description is "A small throwing dart coated in poisonous juices that can be used as a weapon.".


Combining it with is an action applying to two carried things. Understand "Combine [something] with [something]" or "mix [something] with [something]" as Combining it with.

instead of combining Dart with Purple Flower:
	if dart-count is greater than 0:
		move Poisonous Dart to player;
		move Purple flower to junk;
		decrease dart-count by 1;
		say "you coat the dart in the toxins of the flower and create a poisonous dart.";
	otherwise:
		say "You don[apostrophe]t have any darts to make poisonous, you might want to get them out of your backpack or restart."

instead of combining Purple flower with dart:
	if dart-count is greater than 0:
		move Poisonous Dart to player;
		move Purple flower to junk;
		decrease dart-count by 1;
		say "you coat the dart in the toxins of the flower and create a poisonous dart.";
	otherwise:
		say "You don[apostrophe]t have any darts to make poisonous, you might want to get them out of your backpack or restart."
		
Tribesman is a person. Tribesman is in Jungle 2. Present health of Tribesman is 100. The description is "A very large intimidating local man with a spear and many tribal tattoos covering his body."


[Combat with help from BL's Assassin]

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

An every turn rule:
	if player is dead:
		say "You have died";
		End the story.

check throwing something at a second noun
(this is the can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

[Tribesman Interaction combat related]
instead of throwing Dart at Tribesman:
	if dart-count is 0:
		say "You have no darts left";
	otherwise:
		if the player is in Jungle 2:
			decrease present health of the Tribesman by 5;
			decrease dart-count by 1;
			say "You throw the dart at the Tribesman but he simply pulls it out of his skin as if it were a mosquito sting. The Tribesman's health has been decreased by 5. His current health is [the present health of the Tribesman].[line break]";
		otherwise:
			say "You try to throw the dart at the tribesman, but he is too far away.";
			move dart to location;

instead of throwing Poisonous Dart at Tribesman:
	if PD-count is 0:
		say "You are not carrying a poisonous dart";
	otherwise:
		if the player is in Jungle 2:
			decrease present health of the Tribesman by 100;
			decrease PD-count by 1;
			say "You throw the poisonous dart at the Tribesman, he pulls it out of his skin as if it were a mosquito sting. After a few seconds he drops to the floor. You have killed the tribesman and have free path into the temple! [line break]";
		otherwise:
			say "You try to throw the poisonous dart at the tribesman, and lose the dart in the process, he is too far away.";
			decrease PD-count by 1.
	

Instead of going east from Jungle 2:
	if Tribesman is dead:
		continue the action;
	otherwise:
		decrease present health of player by 10;
		say "[line break]The Tribesman blocks your way into the Temple, as you try to move past he pushes you roughly away from the entrance. Your health has been decreased by 10. Your current health is [the present health of the player].[line break]".

instead of attacking Tribesman with machete:
	if the player carries the machete:
		If the player is in jungle 2:
			decrease present health of the tribesman by 20;
			decrease present health of the player by 40;
			say "By hitting the tribesman with machete you have angered him greatly your blow lands dealing 20 damage. The Tribesman's current health is [the present health of the Tribesman].[line break]
			He swings back at you with his spear and deals 40 damage. Your current health is [the present health of the player].[line break]";
		Otherwise:
			say "You try to attack the tribesman with the machete but he is nowhere to be seen";
	otherwise:
		say "You are not carrying the machete".	

	
instead of throwing dart:
	decrease dart-count by 1;
	say "you randomly throw a dart and it lands in the shrubbery unable to be found again.".

[temple entrance puzzle]

instead of going to hallway from temple entrance:
	if Pork button is pressed:
		if Wind Button is pressed:
			if storm button is pressed:
				continue the action;
			otherwise: 
				say "There is a large stone door in the way.";
		otherwise: 
			say "There is a large stone door in the way.";
	otherwise: 
		say "There is a large stone door in the way."
	
buttons is scenery in temple entrance. the description is "There are six buttons on the wall a pork button, a wind button, a volcano button, a spear button, a storm button, and a red button with a looped arrow, maybe it's the reset button. To press a button say [bold type]press 'name' button.".

Painting is scenery in temple entrance. the description is "It seems to be a key for whatever buttons you have to press. It depicts a crashing wave, a firepit and spit on the beach, and a bird flying in the sky".

A pressy is a kind of thing. A pressy can be pressed or unpressed. It is usually unpressed.

Pork Button is scenery in temple entrance. Pork Button is a pressy.
Wind Button is scenery in temple entrance. Wind Button is a pressy.
Volcano Button is scenery in temple entrance. Volcano Button is a pressy.
Spear Button is scenery in temple entrance. Spear Button is a pressy.
Storm Button is scenery in temple entrance. Storm Button is a pressy.
Red Button is scenery in temple entrance. Red Button is a pressy.

pressing is an action applying to one thing. understand "press [pressy]" and "push [pressy]" as pressing


instead of pressing Pork Button:
	if pork button is unpressed:
		now the pork button is pressed;
		say "The pork button is pressed down and remains in that position after you lift your hand off.";
	otherwise:
		now Pork Button is unpressed;
		say "The pork button lifts up to the unpressed position"


instead of pressing Wind Button:
	if Wind button is unpressed:
		now the wind button is pressed;
		say "The wind button is pressed down and remains in that position after you lift your hand off.";
	otherwise:
		now Wind Button is unpressed;
		say "The wind button lifts up to the unpressed position"


instead of pressing volcano Button:
	if volcano button is unpressed:
		now the volcano button is pressed;
		say "The volcano button is pressed down and remains in that position after you lift your hand off.";
	otherwise:
		now volcano Button is unpressed;
		say "The volcano button lifts up to the unpressed position"


instead of pressing spear Button:
	if spear button is unpressed:
		now the spear button is pressed;
		say "The spear button is pressed down and remains in that position after you lift your hand off.";
	otherwise:
		now spear Button is unpressed;
		say "The spear button lifts up to the unpressed position"


instead of pressing Storm Button:
	if Storm button is unpressed:
		now the Storm button is pressed;
		say "The storm button is pressed down and remains in that position after you lift your hand off.";
	otherwise:
		now storm Button is unpressed;
		say "The storm button lifts up to the unpressed position"

Instead of pressing Red Button:
	now storm Button is unpressed;
	now spear Button is unpressed;
	now volcano Button is unpressed;
	now Wind Button is unpressed;
	now Pork Button is unpressed;
	say "You press the red button and all of the other buttons return to their unpressed position."

an every turn rule:
	if player is in temple entrance:
		if HW is 0:
			if Pork button is pressed:
				if Wind Button is pressed:
					if storm button is pressed:
						say "Suddenly the room begins to shake and a large stone door to your southeast begins to move out of the way revealing a hallway deeper into the temple."

HW is a number variable. HW is 0.

An every turn rule:
	if player is in Hallway:
		increase HW by 1.

[treasure puzzle]
sandbag is a thing in the backpack. Sandbag can be empty or full. Sandbag is empty. the printed name is "Sandbag([if sandbag is full]full[end if][if sandbag is empty]empty[end if])". the description is "[if sandbag is full]A bag full of sand.[end if][if sandbag is empty] An empty bag made for carrying sand.[end if]"

filling it with is an action applying to two things. Understand "fill [something] with [something]" and "pour [something] into [something]" and "dump [something] into [something]" and "put [something] in/into [something]" as filling it with.

switching it with is an action applying to two things. Understand "switch [something] with [something]" and "swap [something] with [something]" and "replace [something] with [something]" as switching it with.

instead of filling sandbag with sand:
	if player is in hallway:
		if sandbag is empty:
			now sandbag is full;
			say "You take the sand from the hallway floor and stuff it into the bag, now the bag is full";
		otherwise:
			say "The sandbag is already full";
	otherwise:
		say "There is no sand nearby to fill the bag with".


instead of switching totem with sandbag:
	if player is in Treasure vault:
		if sandbag is full:
			move totem to player;
			say "You switch the Sandbag with the Totem and nothing happens, you should get out of here before any other crazy things happen";
		otherwise:
			end the story;	
			say "You switched the empty sandbag for the totem but the empty sandbag was not nearly close to the same weight as the totem and the pedestal began to rise to the ceiling until the floor from underneath you dropped out and you plummeted to your presumed death.";
	Otherwise:
		say "You cannot see any totem"

instead of switching sandbag with totem:
	if player is in Treasure vault:
		if sandbag is full:
			move totem to player;
			say "You switch the Sandbag with the Totem and nothing happens, you should get out of here before any other crazy things happen";
		otherwise:
			end the story;	
			say "You switched the empty sandbag for the totem but the empty sandbag was not nearly close to the same weight as the totem and the pedestal began to rise to the ceiling until the floor from underneath you dropped out and you plummeted to your presumed death.";	
	Otherwise:
		say "You cannot see any totem"

instead of taking Totem:
	say "The pedestal begins to rise to the ceiling until the floor from underneath you drops out and you plummet to your presumed death.";
	end the story.	

sand is scenery in Hallway. The description is "Coarse sand laying on the side off the hallway.".

Gold Totem is a thing. Gold totem is in Treasure Vault. The description is "A beautiful jeweled gold totem of a llama. Most likely worth thousands of pounds.".

		
An every turn rule:
	If player is in Dock:
		If player has Gold Totem:
			End the story finally;
			say "You bring the totem back to the dock knowing that when you return to England your escapades will be greatly rewarded."

[HOW TO WIN

take backpack
open backpack
wear gloves
e
e
s
take purple flower
combine flower with dart
n
throw dart at tribesman
e
press storm
press wind
press pork
se
fill sandbag with sand
sw
switch totem with sandbag
w
n
n
w
w
WIN!]








[cheats for testing]
Yachting is an action applying to nothing. Understand "hehe" as yachting.

instead of yachting:
	move player to temple entrance;	

Sailing is an action applying to nothing. Understand "haha" as sailing.

instead of sailing:
	move player to hallway;
	now pork button is pressed;
	now wind button is pressed;
	now storm button is pressed.
	



		
		