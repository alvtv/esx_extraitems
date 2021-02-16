# What is this?

This is an ESX based script that provides extra items for players to use.

# What does this include?

This includes the following items:

- Bulletproof Vests
- Weapon Ammo Clips

# How Do I install this?

- Add the folder to your [esx] directory, and add `start esx_extraitems` to your server.cfg.
- Run esx_extraitems.sql so that the items are in your database, or add them manually.
- That's it!

# How Have I changed this?

Only modification is removal of random objects that I've never seen used on any of the FiveM servers, and adds more configurations such as whether your character has to run an animation before the armor is equipped, or if it comes on instantly. This would have been a cool feature in the original version as sometimes the animations can bug out and the character can freeze. Another Configuration I have added is if the player should actually wear a component which is by default Black Bulletproof Armor.

I have removed the trigger events and the insertion of everything that isn't ammoclip/bulletproof-vest from the client & server sided files as well as the SQL file so that less Events are being called upon.

I have also removed the t0sic_loadingbar export, since this was not ideal and is also down to personal preference.

I removed firstaidkit aswell due to it performing the same function as esx_ambulancejob's "medikit".

# Dependancies 

es_extended (I recommend v1-final or lower, since v2 is still being developed to this date).
(NOT A DEPENDANCY): I recommend adding esx_shops so that playes have a way of accessing the items from this repository.

# Credits

The original version of this upload can be found at: https://github.com/mirrox1337/esx_extraitems

Credit to @mirrox1337, thanks!

# Support

If you need any support with this, you can find my Discord via my website @ https://alv.gg or on my GitHub Profile. Alternatively, you can join https://discord.gg/NTZG7BWQSV and open a support ticket. You could also DM me, Alv#9999 on Discord.
