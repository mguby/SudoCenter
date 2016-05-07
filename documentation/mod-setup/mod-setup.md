# Mod Setup
This documentation covers how to get mods and what to do with them. This does not cover how to get the MinecraftEdu initially setup, since that was provided to us when we started the server.

* Most mods can be found at [Curse website](http://minecraft.curseforge.com/mc-mods?filter-game-version=2020709689%3A367&filter-sort=popularity). In addition to browsing for mods on the [Curse website](http://minecraft.curseforge.com/mc-mods?filter-game-version=2020709689%3A367&filter-sort=popularity), you can also use a search engine to find other sites that have mods or better documentation on how to use a mod.    
 To do this, use the keywords “forge mod” to get the best results.

* Once you’ve found a mod you’d like to install, make sure to add it to the mods folder in both the server and your client.
  * Server Mods Folder: `minecraftedu\servertool\server\mods\1.7.10`
  * Client Mods Folder: `\minecraftedu\minecraft\mods\1.7.10`

* If you keep crashing or suspect there is some sort of error happening, you can check the logs for stack traces. Logs are located in `\minecraftedu\servertool\server\logs`. You will want to look at `latest.log` for any **[SEVERE]** or **[Server thread/SEVERE]** messages.

* At the end of this project, the Minecraft version we were using was Minecraft 1.7.10. As such, you should search for mods for that Minecraft version. Sometimes a mod will not work because the version of Forge that the server uses may be a bit older than the mod requires. If that happens, try looking for a slightly older version of that mod.
