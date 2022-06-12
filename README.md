# Arma-3---Air-Crew-Rescue
### January 2021
![Crash Site](https://user-images.githubusercontent.com/25553633/173253348-51e892d2-c898-47c4-b899-e967e0635244.png)
> Local forces guard the crash site
> 

![Camp Discovery](https://user-images.githubusercontent.com/25553633/173253118-8d29f44f-9a01-466f-b9f2-cc5672b459e3.png)
> Discovering an enemy "site"
> 
![Camp Secured](https://user-images.githubusercontent.com/25553633/173253120-b6e44241-3fc8-4d82-b3da-7916e0c4b0b4.png)
> Clearing an enemy "site"

## Setting
A 1-16 player scenario where you command a joint German/Czech force tasked with finding and securing a downed helicopter in Chernarus. However, when you find the helicopter you find the crew have been taken. Track them down and bring them back to safety.
## Features
My most feature rich mission so far!
It features:
- Scripted introduction cutscene; fade in, music and intro text.
- A completely custom system to balance player squads depending on how many people are playing. In singleplayer the whole group of 16 is assigned to the player, but in multiplayer teams are balanced to spread AI members under player command.
- A custom system for identifying enemy sites, that tracks whether sites have been cleared.
- A custom respawning system that creates new respawn sites at cleared sites.
- Radio reinforcement system, updated and refined; offmap reinforcements are spawned dynamically, where units and vehicles are selected from a config file and evaluated for validity on the fly.
- Collection system for tracking the number of dead aircrew discovered.
- Hostage rescue system that adapts adds rescued hostages to the player group with numerous checks to adapt to player group sizes.
- System for tracking survivor casualties and mutates mission completion requirements accordingly.
- System for tracking if players were responsible for survivor deaths and that dynamically changes mission debriefing text to call out "criminal" players.

## Notes
This was the first mission I published to the Steam workshop for the general public rather than just for my private group. I really wanted to expand on some of the systems I had already used in other scenarios. Notably the reinforcement system, which I successfully adapted for this scenario and made much more dynamic and potentially providing infinite possibilities when it comes to replaying. The other major system I wanted to experiment with was a better way of allowing players to respawn, as the long walking times in Arma are often a source of frustration. To that end, I created the "site" system which functions as a side objective system where the player can discover enemy campsites, clear them, then create a new respawn location closer to the action.
