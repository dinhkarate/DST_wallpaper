name = "Wallpaper: Elaina"
author = "dinhkarate"
version = "1.3"
description = "Maybe your waifu could have a wallpaper in the future, just leave her name below the comment"
forumthread = ""
api_version = 10 
dst_compatible = true 
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex" 

configuration_options =
{
  {
    name = "Playerstatus",
    label = "Elaina (when press TAB ingame)",
    options =
    {
               {description = "ON", data = true},
			   {description = "OFF", data = false},
    },
    default = true
  },

  {
    name = "loadingcave",
    label = "Elaina (when travel between cave and overworld)",
    options =
    {
               {description = "ON", data = true},
			   {description = "OFF", data = false},
    },
    default = true
  },
}