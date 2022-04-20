# tw_autogen
 
This is an autogenerator program to create all the necessary files to set up a development environment, to make creating Lua mods for Total War significantly easier. This process uses the script documentation provided by Creative Assembly, translates their HTML files to Lua files, and uses a Lua plugin to incorporate pretty good error checking.

All information on how to install and set this up to follow.

**NOTE:** This is very much in-progress, and will see a few following updates. I'm assuming basic adequacy with VSCode and Lua, I can't handhold the entire way through right now until my tutorial series is finished.

# Setup

First things first, you need to download [Visual Studio Code](https://code.visualstudio.com/). You should also download [Rusted Pack File Manager](https://github.com/Frodo45127/rpfm/releases/latest) and [GitHub Destkop](https://desktop.github.com/) if you haven't already, as well as create a GitHub account. The latter is optional, but very convenient for controlling your versioning and source of your Lua files.

After opening Visual Studio Code, click the "Extensions" button on the left-hand sidebar, and look up ["vscode-lua"](https://marketplace.visualstudio.com/items?itemName=sumneko.lua). Search for the extension created by Sumneko, and download it.

I also recommend the following plugins, while you're at it:
- [Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks), so you can quickly return to important spots in your code.
- [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner), which I use to test non-TW Lua code (for instance, this autogenerator).
- [Duplicate selection or line](https://marketplace.visualstudio.com/items?itemName=geeebe.duplicate), because it's wild that you can't natively duplicate a line in VSCode.
- [Lines of Code](https://marketplace.visualstudio.com/items?itemName=lyzerk.linecounter) so you can get some statistics about how much you've written.
- [TODO Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree) so you can quickly find todo items you have left in your code.

If you haven't already, using RPFM, set up your "MyMod" folder. Set it wherever - mine is S:/modding, where S is my SSD backup drive. RPFM will then create a subfolder for each game, and a subfolder for each mod within each game - ie., S:/modding/warhammer3/mod_configuration_tool.

## Downloading Files
Within this repository, navigate to output -> your game. If you're modding Warhammer 3, go to output/wh3. You can use the [github directory downloader](https://download-directory.github.io/) to download just that folder. Navigate to your MyMod folder, create a new folder (I call my tw_autogen), and paste the contents of the .zip file from the directory downloader into there.

[!Your directory should look something like this!](/assets/doc-01.png)
Your directory should end up looking like this.

## Using Files
Within Visual Studio Code, when you're working on a mod, you should either use File -> Open Folder, or File -> New Workspace. If you don't know what a Workspace is, I don't care to teach you, but you'll know what I mean if you do.

Within your opened folder, either create or open up the .vscode/ folder, and either create or open up settings.json. To enable debugging, paste in the following:
```
{
    "Lua.workspace.library": [
        "S:/modding/tw_autogen/output/wh3/all.lua",
        "S:/modding/tw_autogen/output/wh3/tw_events_and_interfaces.lua",
        "S:/modding/tw_autogen/output/wh3/campaign/",
        "S:/modding/tw_autogen/output/wh3/frontend/",
        "S:/modding/tw_autogen/output/wh3/battle/"
    ]
}
```

If the file is already there, add in the lines between the {}'s but don't interrupt them. VSCode will yell at you if you goof up.

If you're only doing a battle mod, erase the /campaign/ and /frontend/ folders; if you're doing a campaign mod, erase the /battle/ and /frontend/ folders; and so on.

## All Set!
With the output files on your computer, and the Visual Studio Code plugin aware of what folder those files are in, you will now get automatic warnings of various types, the plugin will autocomplete for you, and you can basically access the documentation from directly within VSCode.

Enjoy!

# Assisting Me
If you'd like to help with this project, feel free to make a pull request to fix up any of the standing issues. You can also make an overrides/ file, which are used to "fix" any incorrect definitions from the documentations files. You can see examples therein.