[Back to Developer Documentation Menu](../developer.md)  
## Snooping
### Scripts used
* pastebin   
  * basic password door  
  http://pastebin.com/MXXArFGs
  * Snooping conversation on computer for tutorial  
  http://pastebin.com/Sf286YwQ  
  * Snooping conversation on computer for main building  
  http://pastebin.com/J5pv0Tdn

* git repo   
[tutorial-building-snooping.lua](../../snooping/tutorial-building-snooping.lua)  
[main-building-snooping.lua](../../snooping/main-building-snooping.lua)  

### Step-By-Step Quest Setup  
1. Create quest in global tab
2. Create either or both of the NPC snooping and Computer Snooping quests outlined below
3. Make quest complete dialog and set it to the NPC that the player must talk to in order to complete quest and set the availability to “When Active” and choose your quest

### NPC Snooping Step-By-Step
1. Create 2 NPCs with the NPC wand
2. On the advanced tab, set both NPCs’ role to “Conversation”
3. Edit the conversation to your needs, set delay between 40-60 for each line
4. Set Conversation availability to “When Active” and choose your quest

### Computer Snooping Step-By-Step
1. Edit lines 21-27 of http://pastebin.com/Sf286YwQ to create the conversation that you need
2. If there is no preliminary password, delete lines 1-14 and 31
3. Load the script onto the computer in the server with the `pastebin get Sf286YwQ startup` command and reboot computer

### Known Bugs
None
