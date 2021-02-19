local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_plm")

RegisterNetEvent("craft")
AddEventHandler("craft",function()

local craft_anim = {
  {"mini@repair", "fixing_a_ped",1}
}

local user_id = vRP.getUserId(player)

    user_id  = vRP.getUserId(source)
    player = vRP.getUserSource(user_id)
    if vRP.tryPayment(user_id,200) and vRP.tryGetInventoryItem(user_id,"item1",1,false) and vRP.tryGetInventoryItem(user_id,"item2",1,false) then
          vRPclient.playAnim(player,false,craft_anim,false)
            vRPclient.notify(player, "[~b~Hydraex~w~] ~b~Ai inceput sa craftezi fratele meu")
 		SetTimeout(6000,function()
 			vRPclient.notify(player, "[~b~Hydraex~w~] ~y~Transpiri...")
 			SetTimeout(4000,function()
 			vRP.giveInventoryItem(user_id,"item3",1,false)
      vRPclient.stopAnim(player, false)
       			vRPclient.notify(player, "[~b~Hydraex~w~] ~g~Ai reusit sa craftezi")
  end)
 		end)
  else vRPclient.notify(player, "[~b~Hydraex~w~] ~r~Nu ai tot ce trebuie boule")
  end

end)