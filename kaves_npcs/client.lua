ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(5)
			for _, v in pairs(config.NPCs) do
				RequestModel(GetHashKey(v.model))
				while not HasModelLoaded(GetHashKey(v.model)) do
					Wait(1)
				end
				local npc = CreatePed(4, v.model, v.coords, v.heading,  false, true)
				local npctext = (v.coords)
				SetPedFleeAttributes(npc, 0, 0)
				SetPedDropsWeaponsWhenDead(npc, false)
				SetPedDiesWhenInjured(npc, false)
				SetEntityInvincible(npc , true)
				FreezeEntityPosition(npc, true)
				SetBlockingOfNonTemporaryEvents(npc, true)
			end
end)


function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 140)
end







