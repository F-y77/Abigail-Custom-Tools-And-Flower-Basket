local assets =
{
    Asset("ANIM", "anim/abigail_flower.zip"),
    Asset("ANIM", "anim/abigail_flower_rework.zip"),

	Asset("INV_IMAGE", "abigail_flower_level0"),
	Asset("INV_IMAGE", "abigail_flower_level2"),
	Asset("INV_IMAGE", "abigail_flower_level3"),
	

    Asset("INV_IMAGE", "abigail_flower_old"),		-- deprecated, left in for mods
    Asset("INV_IMAGE", "abigail_flower2"),			-- deprecated, left in for mods
    Asset("INV_IMAGE", "abigail_flower_haunted"),	-- deprecated, left in for mods
    Asset("INV_IMAGE", "abigail_flower_wilted"),	-- deprecated, left in for mods
}

local function UpdateGroundAnimation(inst)
	local x, y, z = inst.Transform:GetWorldPosition()
    local players = {}
	if not POPULATING then
		for i, v in ipairs(AllPlayers) do
			if v:HasTag("ghostlyfriend") and not IsEntityDeadOrGhost(v) and v.components.ghostlybond ~= nil and v.entity:IsVisible() and (v.sg == nil or not v.sg:HasStateTag("ghostbuild")) then
				local dist = v:GetDistanceSqToPoint(x, y, z)
				if dist < TUNING.ABIGAIL_FLOWER_PROX_DIST then
					table.insert(players, {player = v, dist = dist})
				end
			end
		end
	end

	if #players > 1 then
		table.sort(players, function(a, b) return a.dist < b.dist end)
	end

	local level = players[1] ~= nil and players[1].player.components.ghostlybond.bondlevel or 0
	if inst._bond_level ~= level then
		if inst._bond_level == 0 then
			inst.AnimState:PlayAnimation("level"..level.."_pre")
			inst.AnimState:PushAnimation("level"..level.."_loop", true)
			inst.SoundEmitter:PlaySound("dontstarve/characters/wendy/abigail/haunted_flower_LP", "floating")
		elseif inst._bond_level > 0 and level == 0 then
			inst.AnimState:PlayAnimation("level"..inst._bond_level.."_pst")
			inst.AnimState:PushAnimation("level0_loop", true)
            inst.SoundEmitter:KillSound("floating")
		else
			inst.AnimState:PlayAnimation("level"..level.."_loop", true)
			inst.SoundEmitter:PlaySound("dontstarve/characters/wendy/abigail/haunted_flower_LP", "floating")
		end
	end

	inst._bond_level = level
end

local function topocket(inst, owner)
	if inst._ongroundupdatetask ~= nil then
		inst._ongroundupdatetask:Cancel()
		inst._ongroundupdatetask = nil
	end
end

local function toground(inst)
	inst._bond_level = -1 --to force the animation to update
	UpdateGroundAnimation(inst)
	if inst._ongroundupdatetask == nil then
		inst._ongroundupdatetask = inst:DoPeriodicTask(0.5, UpdateGroundAnimation)
	end
end

local function OnEntitySleep(inst)
	if inst._ongroundupdatetask ~= nil then
		inst._ongroundupdatetask:Cancel()
		inst._ongroundupdatetask = nil
	end
end

local function OnEntityWake(inst)
	if not inst.inlimbo and inst._ongroundupdatetask == nil then
		inst._ongroundupdatetask = inst:DoPeriodicTask(0.5, UpdateGroundAnimation, math.random()*0.5)
	end
end

local function GetElixirTarget(inst, doer, elixir)
	return (doer ~= nil and doer.components.ghostlybond ~= nil) and doer.components.ghostlybond.ghost or nil
end

local function getstatus(inst, viewer)
	local _bondlevel = inst._bond_level
	if inst.components.inventoryitem.owner then
		_bondlevel = viewer ~= nil and viewer.components.ghostlybond ~= nil and viewer.components.ghostlybond.bondlevel
	end
	--[[return bondlevel == 100 and "LEVEL100"
		or bondlevel == 99 and "LEVEL99"
		or bondlevel == 98 and "LEVEL98"
		or bondlevel == 97 and "LEVEL97"
		or bondlevel == 96 and "LEVEL96"
		or bondlevel == 95 and "LEVEL95"
		or bondlevel == 94 and "LEVEL94"
		or bondlevel == 93 and "LEVEL93"
		or bondlevel == 92 and "LEVEL92"
		or bondlevel == 91 and "LEVEL91"
		or bondlevel == 90 and "LEVEL90"
		or bondlevel == 89 and "LEVEL89"
		or bondlevel == 88 and "LEVEL88"
		or bondlevel == 87 and "LEVEL87"
		or bondlevel == 86 and "LEVEL86"
		or bondlevel == 85 and "LEVEL85"
		or bondlevel == 84 and "LEVEL84"
		or bondlevel == 83 and "LEVEL83"
		or bondlevel == 82 and "LEVEL82"
		or bondlevel == 81 and "LEVEL81"
		or bondlevel == 80 and "LEVEL80"
		or bondlevel == 79 and "LEVEL79"
		or bondlevel == 78 and "LEVEL78"
		or bondlevel == 77 and "LEVEL77"
		or bondlevel == 76 and "LEVEL76"
		or bondlevel == 75 and "LEVEL75"
		or bondlevel == 74 and "LEVEL74"
		or bondlevel == 73 and "LEVEL73"
		or bondlevel == 72 and "LEVEL72"
		or bondlevel == 71 and "LEVEL71"
		or bondlevel == 70 and "LEVEL70"
		or bondlevel == 69 and "LEVEL69"
		or bondlevel == 68 and "LEVEL68"
		or bondlevel == 67 and "LEVEL67"
		or bondlevel == 66 and "LEVEL66"
		or bondlevel == 65 and "LEVEL65"
		or bondlevel == 64 and "LEVEL64"
		or bondlevel == 63 and "LEVEL63"
		or bondlevel == 62 and "LEVEL62"
		or bondlevel == 61 and "LEVEL61"
		or bondlevel == 60 and "LEVEL60"
		or bondlevel == 59 and "LEVEL59"
		or bondlevel == 58 and "LEVEL58"
		or bondlevel == 57 and "LEVEL57"
		or bondlevel == 56 and "LEVEL56"
		or bondlevel == 55 and "LEVEL55"
		or bondlevel == 54 and "LEVEL54"
		or bondlevel == 53 and "LEVEL53"
		or bondlevel == 52 and "LEVEL52"
		or bondlevel == 51 and "LEVEL51"
		or bondlevel == 50 and "LEVEL50"
		or bondlevel == 49 and "LEVEL49"
		or bondlevel == 48 and "LEVEL48"
		or bondlevel == 47 and "LEVEL47"
		or bondlevel == 46 and "LEVEL46"
		or bondlevel == 45 and "LEVEL45"
		or bondlevel == 44 and "LEVEL44"
		or bondlevel == 43 and "LEVEL43"
		or bondlevel == 42 and "LEVEL42"
		or bondlevel == 41 and "LEVEL41"
		or bondlevel == 40 and "LEVEL40"
		or bondlevel == 39 and "LEVEL39"
		or bondlevel == 38 and "LEVEL38"
		or bondlevel == 37 and "LEVEL37"
		or bondlevel == 36 and "LEVEL36"
		or bondlevel == 35 and "LEVEL35"
		or bondlevel == 34 and "LEVEL34"
		or bondlevel == 33 and "LEVEL33"
		or bondlevel == 32 and "LEVEL32"
		or bondlevel == 31 and "LEVEL31"
		or bondlevel == 30 and "LEVEL30"
		or bondlevel == 29 and "LEVEL29"
		or bondlevel == 28 and "LEVEL28"
		or bondlevel == 27 and "LEVEL27"
		or bondlevel == 26 and "LEVEL26"
		or bondlevel == 25 and "LEVEL25"
		or bondlevel == 24 and "LEVEL24"
		or bondlevel == 23 and "LEVEL23"
		or bondlevel == 22 and "LEVEL22"
		or bondlevel == 21 and "LEVEL21"
		or bondlevel == 20 and "LEVEL20"
		or bondlevel == 19 and "LEVEL19"
		or bondlevel == 18 and "LEVEL18"
		or bondlevel == 17 and "LEVEL17"
		or bondlevel == 16 and "LEVEL16"
		or bondlevel == 15 and "LEVEL15"
		or bondlevel == 14 and "LEVEL14"
		or bondlevel == 13 and "LEVEL13"
	    or bondlevel == 12 and "LEVEL12"
		or bondlevel == 11 and "LEVEL11"
		or bondlevel == 10 and "LEVEL10"
		or bondlevel == 9 and "LEVEL9"
		or bondlevel == 8 and "LEVEL8"
		or bondlevel == 7 and "LEVEL7"
		or bondlevel == 6 and "LEVEL6"
		or bondlevel == 5 and "LEVEL5"
		or bondlevel == 4 and "LEVEL4"
	    or bondlevel == 3 and "LEVEL3"
		or bondlevel == 2 and "LEVEL2"
		or bondlevel == 1 and "LEVEL1"
		or nil
	end]]
end

local function OnSkinIDDirty(inst)
	inst.skin_id = inst.flower_skin_id:value()

	inst:DoTaskInTime(0, function()
		local image_name = string.gsub(inst.AnimState:GetBuild(), "abigail_", "abigail_flower_")
		if not inst.clientside_imageoverrides[image_name] then
			   inst:SetClientSideInventoryImageOverride("bondlevel0", image_name..".tex", image_name.."_level0.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel2", image_name..".tex", image_name.."_level2.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel3", image_name..".tex", image_name.."_level3.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel4", image_name..".tex", image_name.."_level3.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel5", image_name..".tex", image_name.."_level3.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel6", image_name..".tex", image_name.."_level3.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel8", image_name..".tex", image_name.."_level3.tex")        
			   inst:SetClientSideInventoryImageOverride("bondlevel9", image_name..".tex", image_name.."_level3.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel10", image_name..".tex", image_name.."_level3.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel11", image_name..".tex", image_name.."_level3.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel12", image_name..".tex", image_name.."_level3.tex")
			   inst:SetClientSideInventoryImageOverride("bondlevel13", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel14", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel15", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel16", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel17", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel18", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel19", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel20", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel21", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel23", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel24", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel25", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel26", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel27", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel28", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel29", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel30", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel31", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel32", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel33", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel34", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel35", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel36", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel37", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel38", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel39", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel40", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel41", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel42", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel43", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel44", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel45", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel46", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel47", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel48", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel49", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel50", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel51", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel53", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel55", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel56", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel57", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel58", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel59", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel60", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel61", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel62", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel63", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel64", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel65", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel66", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel67", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel68", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel69", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel70", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel71", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel72", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel73", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel74", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel75", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel76", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel77", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel78", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel79", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel80", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel81", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel82", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel83", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel84", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel85", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel86", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel87", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel88", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel89", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel90", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel91", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel92", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel93", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel94", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel95", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel96", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel97", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel98", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel99", image_name..".tex", image_name.."_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel100", image_name..".tex", image_name.."_level3.tex")
			inst.clientside_imageoverrides[image_name] = true
		end
	end)
end

local function drawimageoverride(inst)
	local level = inst._bond_level or 0
	if level == 1 then
		return inst:GetSkinName() or "abigail_flower"
	else
		return (inst:GetSkinName() or "abigail_flower").."_level" ..tostring(level)
	end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("abigail_flower_rework")
    inst.AnimState:SetBuild("abigail_flower_rework")
    inst.AnimState:PlayAnimation("level0_loop")
    MakeInventoryPhysics(inst)

    inst.MiniMapEntity:SetIcon("abigail_flower.png")

    MakeInventoryFloatable(inst, "small", 0.15, 0.9)

	inst:AddTag("abigail_flower")
	inst:AddTag("give_dolongaction")
	inst:AddTag("ghostlyelixirable") -- for ghostlyelixirable component

               inst:SetClientSideInventoryImageOverride("bondlevel0", "abigail_flower.tex", "abigail_flower_level0.tex")
               inst:SetClientSideInventoryImageOverride("bondlevel2", "abigail_flower.tex", "abigail_flower_level2.tex")
               inst:SetClientSideInventoryImageOverride("bondlevel3", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel4", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel5", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel6", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel7", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel8", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel9", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel10", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel11", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel12", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel13", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel14", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel15", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel16", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel17", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel18", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel19", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel20", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel21", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel22", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel23", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel24", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel25", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel26", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel27", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel28", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel29", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel30", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel31", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel32", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel33", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel34", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel35", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel36", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel37", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel38", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel39", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel40", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel41", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel42", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel43", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel44", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel45", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel46", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel47", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel48", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel49", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel50", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel51", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel52", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel53", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel54", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel55", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel56", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel57", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel58", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel59", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel60", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel61", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel62", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel63", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel64", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel65", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel66", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel67", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel68", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel69", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel70", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel71", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel72", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel73", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel74", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel75", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel76", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel77", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel78", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel79", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel80", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel81", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel82", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel83", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel84", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel85", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel86", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel87", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel88", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel89", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel90", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel91", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel92", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel93", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel94", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel95", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel96", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel97", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel98", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel99", "abigail_flower.tex", "abigail_flower_level3.tex")
	           inst:SetClientSideInventoryImageOverride("bondlevel100", "abigail_flower.tex", "abigail_flower_level3.tex")
	inst.clientside_imageoverrides = {
		abigail_flower_flower_rework = true
	}

    inst.flower_skin_id = net_hash(inst.GUID, "abi_flower_skin_id", "abiflowerskiniddirty")
	inst:ListenForEvent("abiflowerskiniddirty", OnSkinIDDirty)
	OnSkinIDDirty(inst)

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst:AddComponent("lootdropper")

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

	inst:AddComponent("summoningitem")

	inst:AddComponent("ghostlyelixirable")
	inst.components.ghostlyelixirable.overrideapplytotargetfn = GetElixirTarget

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
	inst.components.burnable.fxdata = {}
    inst.components.burnable:AddBurnFX("campfirefire", Vector3(0, 0, 0))

    MakeSmallPropagator(inst)
    MakeHauntableLaunch(inst)

    inst:ListenForEvent("onputininventory", topocket)
    inst:ListenForEvent("ondropped", toground)

    inst.OnEntitySleep = OnEntitySleep
    inst.OnEntityWake = OnEntityWake

	inst._ongroundupdatetask = inst:DoPeriodicTask(0.5, UpdateGroundAnimation, math.random()*0.5)
	inst._bond_level = 0

    inst.drawimageoverride = drawimageoverride

    return inst
end


local assets_summonfx =
{
	Asset("ANIM", "anim/abigail_flower_rework.zip"),
    Asset("ANIM", "anim/wendy_channel_flower.zip"),
    Asset("ANIM", "anim/wendy_mount_channel_flower.zip"),
}

local assets_unsummonfx =
{
	Asset("ANIM", "anim/abigail_flower_rework.zip"),
    Asset("ANIM", "anim/wendy_recall_flower.zip"),
    Asset("ANIM", "anim/wendy_mount_recall_flower.zip"),
}

local assets_levelupfx =
{
	Asset("ANIM", "anim/abigail_flower_rework.zip"),
    Asset("ANIM", "anim/abigail_flower_change.zip"),
}

local function MakeSummonFX(anim, build, is_mounted)
    return function()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        inst:AddTag("FX")

		if is_mounted then
	        inst.Transform:SetSixFaced()
		else
	        inst.Transform:SetFourFaced()
		end

        inst.AnimState:SetBank(anim)
		if build ~= nil then
			inst.AnimState:SetBuild(build)
	        inst.AnimState:OverrideSymbol("flower", "abigail_flower_rework", "flower")
		else
	        inst.AnimState:SetBuild("abigail_flower_rework")
		end
        inst.AnimState:PlayAnimation(anim)
		inst.AnimState:SetFinalOffset(1)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.persists = false

        --Anim is padded with extra blank frames at the end
        inst:ListenForEvent("animover", inst.Remove)

        return inst
    end
end

return Prefab("abigail_flower", fn, assets),
	Prefab("abigailsummonfx", MakeSummonFX("wendy_channel_flower", "wendy_channel_flower", false), assets_summonfx),
	Prefab("abigailsummonfx_mount", MakeSummonFX("wendy_mount_channel_flower", "wendy_channel_flower", true), assets_summonfx),
	Prefab("abigailunsummonfx", MakeSummonFX("wendy_recall_flower", nil, false), assets_unsummonfx),
	Prefab("abigailunsummonfx_mount", MakeSummonFX("wendy_mount_recall_flower", nil, true), assets_unsummonfx),
	Prefab("abigaillevelupfx", MakeSummonFX("abigail_flower_change", nil, false), assets_levelupfx)
