local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local PlayerData = {}
local CurrentActionData = {}
local lastTime = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)

-- Start of Bullet Proof Vest

RegisterNetEvent('esx_extraitems:bulletproof')
AddEventHandler('esx_extraitems:bulletproof', function()
	local playerPed = GetPlayerPed(-1)
	local dict = "friends@"
      local playerped = GetPlayerPed(PlayerId())
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
      end
      if Config.UseAnim then
	TaskPlayAnim(playerped, dict, "pickupwait", 8.0, -16.0, -1, 1, 0, false, false, false)
        Citizen.Wait(3000)
	ClearPedTasks(GetPlayerPed(-1))
	else
--	SetPedComponentVariation(playerPed, 9, 27, 9, 2) -- enable if you want person to wear armour after using
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
end
end)

-- End of Bullet Proof Vest
-- Start of Weapon Clip

RegisterNetEvent('esx_extraitems:clipcli')
AddEventHandler('esx_extraitems:clipcli', function()
	ped = GetPlayerPed(-1)
	if IsPedArmed(ped, 4) then
		hash = GetSelectedPedWeapon(ped)
		if hash ~= nil then
			Citizen.Wait(6500)
			AddAmmoToPed(GetPlayerPed(-1), hash,250)
			ESX.ShowNotification(_U("clip_use"))
		else
			ESX.ShowNotification(_U("clip_no_weapon"))
		end
	else
		ESX.ShowNotification(_U("clip_not_suitable"))
	end
end)

-- End of Weapon Clip
