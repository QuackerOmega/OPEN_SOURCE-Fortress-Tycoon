if game:GetService("CoreGui"):FindFirstChild("nigboy | Made by QuackerOmega") ~= nil then
    game:GetService("CoreGui")["nigboy | Made by QuackerOmega"]:Destroy()
end

local pl = game.Players.LocalPlayer.Character.HumanoidRootPart

function ownty()
    for i,v in pairs(game.Workspace.Tycoons:GetChildren()) do
        if v.Name == game.Players.LocalPlayer.Team.Name then
            return v
        end
    end
end

-- Library

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("nigboy | Made by QuackerOmega", 5013109572)

-- themes
local themes = {
    Background = Color3.fromRGB(255, 0, 0),
    Glow = Color3.fromRGB(255, 4, 4),
    Accent = Color3.fromRGB(255, 0, 0),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(255, 0, 0),
    TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Main", 5012544693)
local section1 = page:addSection("Main")
local tps = page:addSection("Teleport To")
local section2 = page:addSection("Others")

-- misc
local misc = venyx:addPage("Misc", 5012544693)
local misc1 = misc:addSection("Misc")

-- theme
local theme = venyx:addPage("Settings", 5012544693)
local colors = theme:addSection("Colors")
local togglegui = theme:addSection("Toggle Gui")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end

togglegui:addKeybind("Toggle Keybind", Enum.KeyCode.V, function()
	venyx:toggle()
end, function()
	venyx:Notify("GUI", "Changed Keybind")
end)

-- credits
local credits = venyx:addPage("Credits", 5012544693)
local cred = credits:addSection("Credits")

section1:addToggle("Kill All", nil, function(value)
    spawn(function()
    getgenv().killall = value
    while true do
        if not getgenv().killall then break end
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                local A_1 = v.Character.Humanoid
                local A_2 = 10000
                local A_3 = "Pistol"
                local Event = game:GetService("ReplicatedStorage").TargetHitRequest
                Event:FireServer(A_1, A_2, A_3)
            end
        end
        wait()
    end
    end)
end)

section1:addToggle("Auto Buy", nil, function(value)
    spawn(function()
        getgenv().buy = value
    while true do
        if not getgenv().buy then break end
        for i,v in pairs(ownty().Buttons:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                local head = game.Players.LocalPlayer.Character.HumanoidRootPart
                firetouchinterest(head,v.Parent,0)
                wait()
                firetouchinterest(head,v.Parent,1)
            end
        end
        wait()
    end
    end)
end)

section1:addToggle("Get All Crates", nil, function(value)
    spawn(function()
        getgenv().Crates = value
    while true do
        if not getgenv().Crates then break end
        for i,v in pairs(game:GetService("Workspace").Crates:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                local head = game.Players.LocalPlayer.Character.HumanoidRootPart
                firetouchinterest(head,v.Parent,0)
                wait()
                firetouchinterest(head,v.Parent,1)
                wait(2)
            end
        end        
        wait()
    end
end)
end)

tps:addButton("Teleport To Tycoon", function()
    spawn(function()
        for i,v in pairs(ownty():GetChildren()) do
            if v.Name == "Base" then
                pl.CFrame = v.CFrame + Vector3.new(0,6,0)
            end
        end
    end)
end)

misc1:addSlider("WalkSpeed", 16, 16, 500, function(value)
	spawn(function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)
end)

misc1:addSlider("JumpPower", 20, 20, 500, function(value)
	spawn(function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end)
end)

section2:addButton("[RTHRO] Titan Script", function()    
    spawn(function()
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Character = LocalPlayer.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        function titan()
            for i,v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.Name == "Handle" or v.Name == "Head" then
                        if Character.Head:FindFirstChild("OriginalSize") then
                            Character.Head.OriginalSize:Destroy()
                        end
                    else
                        for i,cav in pairs(v:GetDescendants()) do
                            if cav:IsA("Attachment") then
                                if cav:FindFirstChild("OriginalPosition") then
                                    cav.OriginalPosition:Destroy()  
                                end
                            end
                        end
                        v:FindFirstChild("OriginalSize"):Destroy()
                        if v:FindFirstChild("AvatarPartScaleType") then
                            v:FindFirstChild("AvatarPartScaleType"):Destroy()
                        end
                    end
                end
            end
        end

        titan()
        wait(0.5)
        Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
        wait(1)

        titan()
        wait(0.5)
        Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
        wait(1)

        titan()
        wait(0.5)
        Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
        wait(1)

        titan()
        wait(0.5)
        Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
        wait(1)

        titan()
        wait(0.5)
        Humanoid:FindFirstChild("HeadScale"):Destroy()
        wait(1)
    end)
end)
cred:addButton("Made By Quacker", function()    
    spawn(function()
        game.StarterGui:SetCore("SendNotification", {Title = "Script By QuackerOmega", Text = "https://github.com/QuackerOmega", Icon = "", Duration = 3})
        setclipboard("https://github.com/QuackerOmega")
    end)
end)

venyx:SelectPage(venyx.pages[1], true)
