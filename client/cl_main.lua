Main = {
    me = PlayerPedId,
    Loop = 2500
}

CreateThread(function()
    while true do
        Wait(Main.Loop)
        Main.Ped = Main.me()
        if IsPedInAnyVehicle(Main.Ped, false) then
            local veh = GetVehiclePedIsIn(Main.Ped,false)
            if GetPedInVehicleSeat(veh, -1) ~= 0 and not Config.NoBrake[GetVehicleClass(veh)] then
                Main.Loop = 10
                local vehSpeed = math.ceil(GetEntitySpeed(veh) * 3.6)
                if HasEntityCollidedWithAnything(veh) and vehSpeed >= Config.BreakSpeed  then
                    local chance = math.random(0,3)
                    BreakOffVehicleWheel(veh,chance,true,false,true,false)
                    Main.Loop = 2500
                end
                if HasEntityCollidedWithAnything(veh) and vehSpeed >= Config.BreakSpeed - 10  then
                    local chance = math.random(0,3)
                    SetVehicleTyreBurst(veh,chance,true)
                    Main.Loop = 2500
                end
                if HasEntityCollidedWithAnything(veh) and vehSpeed >= Config.BreakSpeed - 30  then
                    local chance = math.random(0,3)
                    SetVehicleTyreBurst(veh,chance,false)
                    Main.Loop = 2500
                end
            end
        else
            Main.Loop = 2500
        end
    end
end)