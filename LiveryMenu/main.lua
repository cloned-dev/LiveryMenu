RMenu.Add('LiveryMenu', 'MainMenu', RageUI.CreateMenu(cfg.menuname, cfg.menusub, 1350, 10)) 

RMenu.Add('LiveryMenu', 'OptionsMenu', RageUI.CreateSubMenu(RMenu:Get('LiveryMenu', 'MainMenu'), cfg.menuname, cfg.menusub, 1350, 10))


RageUI.CreateWhile(1.0, RMenu:Get('LiveryMenu', 'MainMenu'), nil, function()
    RageUI.IsVisible(RMenu:Get('LiveryMenu', 'MainMenu'), true, false, true, function()

        RageUI.Button("Livery Options" , nil, {RightLabel = "→→→",}, true, function(Hovered, Active, Selected)
        
        end, RMenu:Get('LiveryMenu', 'OptionsMenu'))
        
       end, function()
    end)
    LiveryOptions()  -- [Function for Opening the Actual Livery Number Menu] 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsControlPressed(0, cfg.control, true) and IsPedInAnyVehicle(GetPlayerPed(-1), false) then -- [What Bind Triggers the Menu to open. Deafult : 121 (Insert)] - Can be Edited in Config

            RageUI.Visible(RMenu:Get("LiveryMenu", "MainMenu"), true)

        end
    end
end)

function LiveryOptions() -- [Livery Options Function]
    RageUI.IsVisible(RMenu:Get('LiveryMenu', 'OptionsMenu'), true, false, true, function()

        print(tostring(GetVehicleLiveryCount(Vehicle)))
        local Vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

        for LiveryCount = 1, GetVehicleLiveryCount(Vehicle) do
  
            RageUI.Button("Livery #" .. tostring(LiveryCount) , nil, {RightLabel = "→→→",}, true, function(Hovered, Active, Selected)
                if Selected then
                    SetVehicleLivery(Vehicle, LiveryCount)        
                end
            end)
        end
        end, function()
    end)
end

