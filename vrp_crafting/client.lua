vRP = Proxy.getInterface("vRP")

local function textFain(text, secconds)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(text)
	DrawSubtitleTimed(secconds * 1000, 1)
end

local function drawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*130
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.2*scale, 0.5*scale)
        SetTextFont(6)
        SetTextProportional(1)
		SetTextColour( 1,1, 1, 255 )
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
	    World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end
local function drawInfo(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
while true do
    Wait(1)
    DrawMarker(21, 472.74597167968,-1311.6267089844,28.51615600586+0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 181, 204, 255,false, true, 20, false)
    if GetDistanceBetweenCoords(472.74597167968,-1311.6267089844,28.51615600586, GetEntityCoords(GetPlayerPed(-1)))  < 1 then
    	textFain("~w~Apasa ~b~[E] ~w~pentru a crafta!",1)
      if IsControlJustPressed(1, 51) then
      TriggerServerEvent("craft")
      Wait(6000)
      Citizen.CreateThread(function()
      StartScreenEffect('MenuMGHeistIn', 0, true)
      Wait(3000)
      StopScreenEffect('MenuMGHeistIn')
  end)
      Wait(5000)
    end
    end
    end
end)
