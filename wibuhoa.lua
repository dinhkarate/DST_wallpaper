
GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})
local require = GLOBAL.require
local Widget = require "widgets/widget"
local Image = require "widgets/image"
local screen_bgs_to_replace = {"options", "main", "mods", "serverlisting", "servercreation", "collection", "mysterybox", "playersummary", "serverslot", "purchasepack", "compendium", "characterbio", "wardrobe"}
local ANCHOR_MIDDLE = 0
local ANCHOR_RIGHT = 2
local SCALEMODE_FILLSCREEN = 1
local ANCHOR_TOP = 1
local SCALEMODE_PROPORTIONAL = 2
local TheNet = GLOBAL.TheNet
local RESOLUTION_X = 1280
local RESOLUTION_Y = 720
local TEMPLATES = require "widgets/redux/templates"
local LoadoutSelect = require "widgets/redux/loadoutselect"
local Menu = require "widgets/menu"
    
	function TEMPLATES.LeftSideBarBackground()--选人界面
		local bg = Widget("background")
	    bg.bgplate = bg:AddChild(TEMPLATES._CreateBackgroundPlate(Image("images/bg_loading_loading_anime2.xml", "bg_loading_loading_anime2.tex")))
	    bg:SetCanFadeAlpha(false)
		
		local sidebar_root = bg:AddChild(Widget("sidebar_root"))
	    sidebar_root:SetScaleMode(SCALEMODE_PROPORTIONAL)
	    sidebar_root:SetVAnchor(ANCHOR_MIDDLE)
	    sidebar_root:SetHAnchor(ANCHOR_MIDDLE)
		
		local sidebar = sidebar_root:AddChild(Image("images/bg_redux_dark_sidebar.xml", "dark_sidebar.tex"))
	    sidebar:SetCanFadeAlpha(false)
	    sidebar:SetVRegPoint(ANCHOR_MIDDLE)
	    sidebar:SetHRegPoint(ANCHOR_RIGHT)
	    sidebar:SetPosition(-300, 0)
	    sidebar:SetScale(.68, 1)
	    return bg
	end

for k, v in pairs(screen_bgs_to_replace) do 
    AddClassPostConstruct("screens/redux/"..v.."screen", function(self)

        if v ~= "main" and v ~= "serverslot" and v ~= "mods" and v ~= "compendium" and v ~= "serverlisting" and v ~= "options" and v ~= "collection" then
            self.bg.bgplate.image:SetTexture("images/bg_loading_loading_anime2.xml", "bg_loading_loading_anime2.tex")--其余界面
        end
    end)
end

AddClassPostConstruct("screens/redeemdialog", function(self)--兑换码
    if self.bg then
        self.bg.bgplate.image:SetTexture("images/bg_loading_loading_anime2.xml", "bg_loading_loading_anime2.tex")
    end
end)


AddClassPostConstruct("screens/redux/wardrobepopupgridloadout", function(self)--换衣服

        for k, v in pairs(self.proot.children) do
            if (string.find(tostring(k), "Image")) then
                self.proot.children[k]:Kill()
            end
        end
        local bg = self.proot:AddChild(Image("images/bg_loading_loading_anime2.xml", "bg_loading_loading_anime2.tex"))
        bg:SetScale(.7) 
        bg:SetPosition(0, 0)
        bg:SetTint(1, 1, 1, .43)
        bg:MoveToBack()
end)

