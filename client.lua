local gsrTimer = 0
local gsrPositive = false
local plyPed = PlayerPedId()
local gsrTestDistance = 5

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
            plyPed = PlayerPedId()
            if IsPedSwimmingUnderWater(plyPed) then
                Citizen.Wait(10000)
                if gsrPositive then
                    chance = math.random(1, 3)
                    if chance ~= 1 then
                        Notify("~g~Success! ~w~Residue ~g~was ~w~cleaned off.")
                        gsrTimer = 0
                        gsrPositive = false;
                    else
                        Notify("~r~Failed! ~w~Residue was ~r~not ~w~cleaned off.")
                        gsrTimer = Config.GSRAutoClean
                        Citizen.CreateThread(GSRThreadTimer)
                end
            end
        end
        if IsPedShooting(plyPed) then
            if gsrPositive then
                gsrTimer = Config.GSRAutoClean
            else
                gsrPositive = true
                gsrTimer = Config.GSRAutoClean
                Citizen.CreateThread(GSRThreadTimer)
            end
        end
    end
end)

RegisterCommand(Config.TestGSR, function()
    local playerCoords = GetEntityCoords(plyPed)
    for _, player in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(player)
        local targetId = GetPlayerServerId(player)
        local distance = #(playerCoords-GetEntityCoords(targetPed))
        if targetPed ~= plyPed then
            if distance <= gsrTestDistance then
                TriggerServerEvent('GSR:PlayerTest', targetId)
            else
                Notify("~r~Could Not Find Subject")
            end
        end
    end
end)

RegisterCommand(Config.cleargsr, function()
    if gsrPositive then
        Notify("~b~Cleaning...")
        Citizen.Wait(10000)
        chance = math.random(1, 3)
        if chance ~= 1 then
            Notify("~g~Success! ~w~Residue ~g~was ~w~cleaned off.")
            gsrTimer = 0
            gsrPositive = false;
        else
            Notify("~r~Failed! ~w~Residue was ~r~not ~w~cleaned off.")
            gsrTimer = Config.GSRAutoClean
            Citizen.CreateThread(GSRThreadTimer)
        end
    end
end)

RegisterCommand(Config.forceclean, function()
    if Config.Perms.restricted then
        if TriggerServerEvent('GSR:PermCheck') then
            Notify("~g~Success! ~w~Residue ~g~was ~w~cleaned off.")
            gsrTimer = 0
            gsrPositive = false;
            TriggerServerEvent("GSR:ForceClean")
        else
            Notify('~r~Failed! You do not have permission to do that!')
        end
    else
        Notify("~g~Success! ~w~Residue ~g~was ~w~cleaned off.")
        gsrTimer = 0
        gsrPositive = false;
        TriggerServerEvent("GSR:ForceClean")
    end
end)

RegisterNetEvent("GSR:Not1fy")
AddEventHandler("GSR:Not1fy", function(notHandler)
    Notify(notHandler)
end)

RegisterNetEvent("GSR:TestHandler")
AddEventHandler("GSR:TestHandler", function(tester)
    if gsrPositive then
        TriggerServerEvent("GSR:TestCallback", tester, true)
    elseif not gsrPositive then
        TriggerServerEvent("GSR:TestCallback", tester, false)
    end
end)

function GSRThreadTimer()
    while gsrPositive do
        Citizen.Wait(1000)
        if gsrTimer == 0 then
            gsrPositive = false
        else
            gsrTimer = gsrTimer - 1
        end
    end
end

-- Jordan's Notify System
function Notify(string) 
    SetNotificationTextEntry("STRING") 
    AddTextComponentString('~y~[ROCKET_GSR] ' .. string) 
    DrawNotification(false, true) 
end