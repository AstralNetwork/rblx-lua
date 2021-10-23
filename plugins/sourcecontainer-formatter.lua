--
local RS = game:GetService("ReplicatedStorage")
local SS = game:GetService("StudioService")
local UIS = game:GetService("UserInputService")
local RES = game:GetService("RunService")
local CHS = game:GetService("ChangeHistoryService")
local SEL = game:GetService("Selection")
local IS = game:GetService("InsertService")
--
local localservices = '\nlocal PS = game:GetService("Players") \nlocal RS = game:GetService("ReplicatedStorage") \nlocal RF = game:GetService("ReplicatedFirst") \n-- \nlocal player = PS.LocalPlayer \nlocal character = player.Character or player.CharacterAdded:Wait() \nlocal PlayerGui = player.PlayerGui \nlocal PlayerBackpack = player.Backpack'
local localservices_character = '\nlocal PS = game:GetService("Players") \nlocal RS = game:GetService("ReplicatedStorage") \nlocal RF = game:GetService("ReplicatedFirst") \n-- \nlocal player = PS.LocalPlayer \nlocal character = player.Character \nlocal PlayerGui = player.PlayerGui \nlocal PlayerBackpack = player.Backpack'
local serverservices = '\nlocal PS = game:GetService("Players") \nlocal SSS = game:GetService("ServerScriptService") \nlocal SS = game:GetService("ServerStorage") \nlocal RS = game:GetService("ReplicatedStorage") \nlocal RF = game:GetService("ReplicatedFirst") \nlocal L = game:GetService("Lighting")'
--
local toolbar = plugin:CreateToolbar("Script Format")
local Button = toolbar:CreateButton("Add services", "Easily format all the scripts to get easier access to services without having to define them.", "rbxasset://textures/face.png")
Button.ClickableWhenViewportHidden = true
--
function checkforscriptselected()
	for __, ist in pairs(SEL:Get()) do
		if ist:IsA("Script") or ist:IsA("LocalScript") or ist:IsA("ModuleScript") and ist.Name ~= "ignore" then
			return true
		end
	end
end
function setappendwarning(s)
	warn(s.Name.." successfully appended ".."- "..s.ClassName, s.LinkedSource)
end
	--
Button.Click:Connect(function()
	if checkforscriptselected() then for __, ist in pairs(SEL:Get()) do 
			if ist:IsA("LocalScript") and (ist.Name ~= "ignore" or ist.Disabled) then
				if ist:IsDescendantOf(game.StarterPlayer.StarterPlayerScripts) then 
					ist.Source = localservices.."\n"..ist.Source
					setappendwarning(ist)
				elseif ist:IsDescendantOf(game.StarterPlayer.StarterCharacterScripts) then 
					ist.Source = localservices_character.."\n"..ist.Source
					setappendwarning(ist)
				end
			elseif ist:IsA("Script") and (ist.Name ~= "ignore" or ist.Disabled) then
				ist.Source = serverservices.."\n"..ist.Source
				setappendwarning(ist)
			end 
		end	else 	for __, ist in pairs(game:GetDescendants()) do 
			if ist:IsA("LocalScript") and (ist.Name ~= "ignore" or ist.Disabled) then
				if ist:IsDescendantOf(game.StarterPlayer.StarterPlayerScripts) then 
					ist.Source = localservices.."\n"..ist.Source
					setappendwarning(ist)
				elseif ist:IsDescendantOf(game.StarterPlayer.StarterCharacterScripts) then 
					ist.Source = localservices_character.."\n"..ist.Source
					setappendwarning(ist)
				end
			elseif ist:IsA("Script") and (ist.Name ~= "ignore" or ist.Disabled) then
				ist.Source = serverservices.."\n"..ist.Source
				setappendwarning(ist)
			end
		end
	end
end)
