
<!-- toc -->

- [Man-In-The-Middle](#man-in-the-middle)
	- [Scripts used](#scripts-used)
	- [Step-By-Step Quest Setup](#step-by-step-quest-setup)
	- [Known Bugs](#known-bugs)

<!-- tocstop -->

## Man-In-The-Middle
### Scripts used
* pastebin  
  * password door   
  http://pastebin.com/Js2RbXRG
  * Michael’s computer for tutorial  
  http://pastebin.com/w89vMQhd
  * Drew’s computer for tutorial  
  http://pastebin.com/Yz5F0mFx  
  * Man-In-The-Middle tutorial  
  http://pastebin.com/jgzQZzej  
  * Man-In-The-Middle main building  
  http://pastebin.com/Qey07kTp

* git repo  
[tutorial-drew.lua](../../man-in-the-middle/tutorial-drew.lua)  
[tutorial-michael.lua](../../man-in-the-middle/tutorial-michael.lua)  
[tutorial-main.lua](../../man-in-the-middle/tutorial-main.lua)  
[main-building-appleberry-diary.lua](../../main-building-appleberry-diary.lua)  
[main-building-puce-diary.lua](../../main-building-puce-diary.lua)  
[main-building-main-script.lua](../../main-building-main-script.lua)  

### Step-By-Step Quest Setup
1. Create quest in global tab  
2. Create quest initiation dialog and set availability to “when not active” and choose your quest  
3. Use the script http://pastebin.com/jgzQZzej and alter the names and strings to change the dialog to your specific quest  

### Known Bugs
Dialogs that are dependent on each other do not work in repeatable quests
  * For example, if dialog 2 is supposed to only occur after dialog 1 has occurred, the player can skip straight to dialog 2 without doing dialog 1 when the quest is repeated. (No known fix)
