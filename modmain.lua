GLOBAL.setmetatable(env, {__index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end})
Assets = {
    Asset("IMAGE", "images/mainscreen.tex"),
    Asset("ATLAS", "images/mainscreen.xml"),
    Asset("IMAGE", "images/multiplayermainscreen.tex"),
    Asset("ATLAS", "images/multiplayermainscreen.xml"),

    Asset("ATLAS", "images/bg_loading_loading_anime2.xml"),
	Asset("IMAGE", "images/loading_anime2.tex"),

    Asset("ANIM", "anim/ui_chest_3x3.zip"),
    Asset("ANIM", "anim/ui_chest_3x2.zip"),
    
    Asset("IMAGE", "images/playerstatus.tex"),
    Asset("ATLAS", "images/playerstatus.xml"), 
}
local backgrounds = { 
    "playersummary", 
    "serverlisting",
    "servercreation",
    "options",
    "mods",
    "wardrobe",
    "collection",
    "mysterybox", 
    "compendium",  
}
for k, v in ipairs(backgrounds) do     
    Assets[#Assets + 1] = Asset("IMAGE", "images/" .. v .. ".tex")
    Assets[#Assets + 1] = Asset("ATLAS", "images/" .. v .. ".xml")
end 


local function ImageSetup(inst)
    inst:SetVRegPoint(ANCHOR_MIDDLE)
    inst:SetHRegPoint(ANCHOR_MIDDLE)
    inst:SetVAnchor(ANCHOR_MIDDLE)
    inst:SetHAnchor(ANCHOR_MIDDLE)
    inst:SetScaleMode(SCALEMODE_FILLSCREEN)
    inst:MoveToBack()
end

AddClassPostConstruct("screens/redux/mainscreen", function(self)
    self.play_button:SetPosition(18, -200)    
    self.bg = self.fixed_root:AddChild(Image("images/mainscreen.xml", "mainscreen.tex"))
    ImageSetup(self.bg)
    self.title:Kill()
    self.presents_image:Kill()
    self.legalese_image:Kill()

end)

AddClassPostConstruct("screens/redux/multiplayermainscreen", function(self)   
    self.bg = self.fixed_root:AddChild(Image("images/multiplayermainscreen.xml", "multiplayermainscreen.tex"))
    ImageSetup(self.bg)
    if self.banner_root then self.banner_root:Kill() end
    if self.info_panel then self.info_panel:Kill() end
    if self.banner_front then self.banner_front:Kill() end
    self.letterbox:Kill()
    self.motd_panel:Kill()
    self.sidebar:Kill()
    self.logo:Kill()        
end)

for k, v in ipairs(backgrounds) do 
    AddClassPostConstruct("screens/redux/"..v.."screen", function(self)
        self.bg.bgplate.image:SetTexture(GLOBAL.resolvefilepath("images/"..v..".xml"), v..".tex")
        if v == "playersummary" then
            self.puppet:Kill()
            self.posse_root:Kill()
        end
    end)
end




local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local LOADING_BGS = {
    "loading_anime1",
    "loading_anime2",
--	"loading_anime3",
}

--local LOADING_BGSS = { 
--    "loading_anime2",
--}

if
    GetModConfigData("loadingcave") == true then

local abc = math.random(1,2)
--if abc == 1 then 

if abc == 1 then         
            if GLOBAL.Settings.loading_screen_keys ~= nil and not GLOBAL.TheNet:IsDedicated() then

                    table.insert(GLOBAL.Settings.loading_screen_keys, "loading_anime2")
                    table.insert(Assets, Asset("ATLAS", "images/bg_loading_loading_anime2.xml"))
                    table.insert(Assets, Asset("IMAGE", "images/loading_anime2.tex"))
                    
            
            end
  else --abc == 2 then
                    if GLOBAL.Settings.loading_screen_keys ~= nil and not GLOBAL.TheNet:IsDedicated() then
                        table.insert(GLOBAL.Settings.loading_screen_keys, "loading_anime2")    		        
                        table.insert(Assets, Asset("ATLAS", "images/bg_loading_loading_anime2.xml"))
                        table.insert(Assets, Asset("IMAGE", "images/loading_anime2.tex"))


                    
--					else
--						table.insert(GLOBAL.Settings.loading_screen_keys, "loading_anime3")
--						table.insert(Assets, Asset("ATLAS", "images/bg_loading_loading_anime3.xml"))
--						table.insert(Assets, Asset("IMAGE", "images/loading_anime3.tex"))
    end
       	        
end
end


if  GetModConfigData("Playerstatus") == true then
AddClassPostConstruct("screens/playerstatusscreen", function(self)--table人物列表界面
    --local ClientObjs = TheNet:GetClientTable() or {}
    local DoInit_old = self.DoInit
    self.DoInit = function(self)
        if DoInit_old ~= nil then
            DoInit_old(self)
        end
        if self.bg then
            self.bg:SetTexture("images/playerstatus.xml", "playerstatus.tex")
            self.bg:SetScale(1,1,1)
            --bg:MoveToBack()
        end
    end
end)
end

AddClassPostConstruct("screens/redux/wardrobepopupgridloadout", function(self)--换衣服
    for k, v in pairs(self.proot.children) do
        if (string.find(tostring(k), "Image")) then
            self.proot.children[k]:Kill()
        end
    end
    local bg = self.proot:AddChild(Image("images/serverlisting.xml", "serverlisting.tex"))
    bg:SetScale(.7)
    bg:SetPosition(0, 0)
    bg:SetTint(1, 1, 1, .43)
    bg:MoveToBack()
end)

modimport('wibuhoa')