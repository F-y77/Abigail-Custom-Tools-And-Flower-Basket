local assets =
{
    Asset("ANIM", "anim/player_ghost_withhat.zip"),
    Asset("ANIM", "anim/ghost_abigail_build.zip"),
    Asset("ANIM", "anim/ghost_abigail.zip"),
    Asset("SOUND", "sound/ghost.fsb"),
}

local prefabs =
{
    "abigail_attack_fx",
    "abigail_attack_fx_ground",
	"abigail_retaliation",
	"abigailforcefield",
	"abigaillevelupfx",
	"abigail_vex_debuff",
}

local brain = require("brains/abigailbrain")

local function UpdateGhostlyBondLevel(inst, level)
	local max_health = level == 100 and 20500*TUNING.AB_H_X
					or level == 99 and 20000*TUNING.AB_H_X
					or level == 98 and 18000*TUNING.AB_H_X
					or level == 97 and 16000*TUNING.AB_H_X
					or level == 96 and 14000*TUNING.AB_H_X
					or level == 95 and 12000*TUNING.AB_H_X
					or level == 94 and 10000*TUNING.AB_H_X
					or level == 93 and 9900*TUNING.AB_H_X
					or level == 92 and 9800*TUNING.AB_H_X
					or level == 91 and 9700*TUNING.AB_H_X
					or level == 90 and 9600*TUNING.AB_H_X
					or level == 89 and 9500*TUNING.AB_H_X
					or level == 88 and 9400*TUNING.AB_H_X
					or level == 87 and 9300*TUNING.AB_H_X
					or level == 86 and 9200*TUNING.AB_H_X
					or level == 85 and 9100*TUNING.AB_H_X
					or level == 84 and 9000*TUNING.AB_H_X
					or level == 83 and 8900*TUNING.AB_H_X
					or level == 82 and 8800*TUNING.AB_H_X
					or level == 81 and 8700*TUNING.AB_H_X
					or level == 80 and 8600*TUNING.AB_H_X
					or level == 79 and 8500*TUNING.AB_H_X
					or level == 78 and 8400*TUNING.AB_H_X
					or level == 77 and 8300*TUNING.AB_H_X
					or level == 76 and 8200*TUNING.AB_H_X
					or level == 75 and 8100*TUNING.AB_H_X
					or level == 74 and 8000*TUNING.AB_H_X
					or level == 73 and 7900*TUNING.AB_H_X
					or level == 72 and 7800*TUNING.AB_H_X
					or level == 71 and 7700*TUNING.AB_H_X
					or level == 70 and 7600*TUNING.AB_H_X
					or level == 69 and 7500*TUNING.AB_H_X
					or level == 68 and 7400*TUNING.AB_H_X
					or level == 67 and 7300*TUNING.AB_H_X
					or level == 66 and 7200*TUNING.AB_H_X
					or level == 65 and 7100*TUNING.AB_H_X
					or level == 64 and 7000*TUNING.AB_H_X
					or level == 63 and 6900*TUNING.AB_H_X
					or level == 62 and 6800*TUNING.AB_H_X
					or level == 61 and 6700*TUNING.AB_H_X
					or level == 60 and 6600*TUNING.AB_H_X
					or level == 59 and 6500*TUNING.AB_H_X
					or level == 58 and 6400*TUNING.AB_H_X
					or level == 57 and 6300*TUNING.AB_H_X
					or level == 56 and 6200*TUNING.AB_H_X
					or level == 55 and 6100*TUNING.AB_H_X
					or level == 54 and 6000*TUNING.AB_H_X
					or level == 53 and 5900*TUNING.AB_H_X
					or level == 52 and 5800*TUNING.AB_H_X
					or level == 51 and 5700*TUNING.AB_H_X
					or level == 50 and 5600*TUNING.AB_H_X
					or level == 49 and 5500*TUNING.AB_H_X
					or level == 48 and 5400*TUNING.AB_H_X
					or level == 47 and 5300*TUNING.AB_H_X
					or level == 46 and 5200*TUNING.AB_H_X
					or level == 45 and 5100*TUNING.AB_H_X
					or level == 44 and 5000*TUNING.AB_H_X
					or level == 43 and 4900*TUNING.AB_H_X
					or level == 42 and 4800*TUNING.AB_H_X
					or level == 41 and 4700*TUNING.AB_H_X
					or level == 40 and 4600*TUNING.AB_H_X
					or level == 39 and 4500*TUNING.AB_H_X
					or level == 38 and 4400*TUNING.AB_H_X
					or level == 37 and 4300*TUNING.AB_H_X
					or level == 36 and 4200*TUNING.AB_H_X
					or level == 35 and 4100*TUNING.AB_H_X
					or level == 34 and 3900*TUNING.AB_H_X
					or level == 33 and 3800*TUNING.AB_H_X
					or level == 32 and 3700*TUNING.AB_H_X
					or level == 31 and 3600*TUNING.AB_H_X
					or level == 30 and 3500*TUNING.AB_H_X
					or level == 29 and 3400*TUNING.AB_H_X
					or level == 28 and 3300*TUNING.AB_H_X
					or level == 27 and 3200*TUNING.AB_H_X
					or level == 26 and 3100*TUNING.AB_H_X
					or level == 25 and 3000*TUNING.AB_H_X
					or level == 24 and 2900*TUNING.AB_H_X
					or level == 23 and 2800*TUNING.AB_H_X
					or level == 22 and 2700*TUNING.AB_H_X
					or level == 21 and 2600*TUNING.AB_H_X
					or level == 20 and 2500*TUNING.AB_H_X
					or level == 11 and 2400*TUNING.AB_H_X
					or level == 11 and 2300*TUNING.AB_H_X
					or level == 19 and 2200*TUNING.AB_H_X
					or level == 18 and 2100*TUNING.AB_H_X
					or level == 17 and 2000*TUNING.AB_H_X
					or level == 16 and 1900*TUNING.AB_H_X
					or level == 15 and 1800*TUNING.AB_H_X
					or level == 14 and 1700*TUNING.AB_H_X
					or level == 13 and 1600*TUNING.AB_H_X
					or level == 12 and 1500*TUNING.AB_H_X
		            or level == 11 and 1400*TUNING.AB_H_X
		            or level == 10 and 1300*TUNING.AB_H_X 
		            or level == 9 and 1200*TUNING.AB_H_X
		            or level == 8 and 1100*TUNING.AB_H_X
		            or level == 7 and 1000*TUNING.AB_H_X
		            or level == 6 and 900*TUNING.AB_H_X
	                or level == 5 and 800*TUNING.AB_H_X
					or level == 4 and 700*TUNING.AB_H_X
					or level == 3 and 600*TUNING.AB_H_X
					or level == 2 and 300*TUNING.AB_H_X
					or 150*TUNING.AB_H_X

	local health_comp = inst.components.health
	if health_comp ~= nil then
		if health_comp:IsDead() then
			health_comp.maxhealth = max_health
		else
			local health_percent = health_comp:GetPercent()
			health_comp:SetMaxHealth(max_health)
			health_comp:SetPercent(health_percent, true)
		end


	    if inst._playerlink ~= nil and inst._playerlink.components.pethealthbar ~= nil then
	        inst._playerlink.components.pethealthbar:SetMaxHealth(max_health)
		end
end

	local light_vals = TUNING.ABIGAIL_LIGHTING[level] or TUNING.ABIGAIL_LIGHTING[1]
	if light_vals.r ~= 0 then
		inst.Light:Enable(not inst.inlimbo)
		inst.Light:SetRadius(light_vals.r)
		inst.Light:SetIntensity(light_vals.i)
		inst.Light:SetFalloff(light_vals.f)
	else
		inst.Light:Enable(false)
	end
    inst.AnimState:SetLightOverride(light_vals.l)
end

local ABIGAIL_DEFENSIVE_MAX_FOLLOW_DSQ = TUNING.ABIGAIL_DEFENSIVE_MAX_FOLLOW * TUNING.ABIGAIL_DEFENSIVE_MAX_FOLLOW
local function IsWithinDefensiveRange(inst)
    return inst._playerlink and inst:GetDistanceSqToInst(inst._playerlink) < ABIGAIL_DEFENSIVE_MAX_FOLLOW_DSQ
end

local COMBAT_MUSHAVE_TAGS = { "_combat", "_health" }
local COMBAT_CANTHAVE_TAGS = { "INLIMBO", "noauradamage", "companion" }

local COMBAT_MUSTONEOF_TAGS_AGGRESSIVE = { "monster", "prey", "insect", "hostile", "character", "animal" }
local COMBAT_MUSTONEOF_TAGS_DEFENSIVE = { "monster", "prey" }

local COMBAT_TARGET_DSQ = TUNING.ABIGAIL_COMBAT_TARGET_DISTANCE * TUNING.ABIGAIL_COMBAT_TARGET_DISTANCE

local function HasFriendlyLeader(inst, target)
    local leader = inst.components.follower.leader
    if leader ~= nil then
        local target_leader = (target.components.follower ~= nil) and target.components.follower.leader or nil

        if target_leader and target_leader.components.inventoryitem then
            target_leader = target_leader.components.inventoryitem:GetGrandOwner()
            -- Don't attack followers if their follow object has no owner
            if target_leader == nil then
                return true
            end
        end

        local PVP_enabled = TheNet:GetPVPEnabled()

        return leader == target or (target_leader ~= nil
                and (target_leader == leader or (target_leader:HasTag("player")
                and not PVP_enabled))) or
                (target.components.domesticatable and target.components.domesticatable:IsDomesticated()
                and not PVP_enabled) or
                (target.components.saltlicker and target.components.saltlicker.salted
                and not PVP_enabled)
    end

    return false
end

local function CommonRetarget(inst, v)
    return v ~= inst and v ~= inst._playerlink and v.entity:IsVisible()
            and v:GetDistanceSqToInst(inst._playerlink) < COMBAT_TARGET_DSQ
            and inst.components.combat:CanTarget(v)
            and v.components.minigame_participator == nil
            and not HasFriendlyLeader(inst, v)

end

local function DefensiveRetarget(inst)
    if inst._playerlink == nil then
        return nil
    elseif not IsWithinDefensiveRange(inst) then
        return nil
    else
        local ix, iy, iz = inst.Transform:GetWorldPosition()
        local entities_near_me = TheSim:FindEntities(
            ix, iy, iz, TUNING.ABIGAIL_DEFENSIVE_MAX_FOLLOW,
            COMBAT_MUSHAVE_TAGS, COMBAT_CANTHAVE_TAGS, COMBAT_MUSTONEOF_TAGS_DEFENSIVE
        )

        local leader = inst.components.follower.leader

        for _, v in ipairs(entities_near_me) do
            if CommonRetarget(inst, v)
                    and (v.components.combat.target == inst._playerlink or
                        inst._playerlink.components.combat.target == v or
                        v.components.combat.target == inst) then

                return v
            end
        end

        return nil
    end
end

local function AggressiveRetarget(inst)
    if inst._playerlink == nil then
        return nil
    else
        local ix, iy, iz = inst.Transform:GetWorldPosition()
        local entities_near_me = TheSim:FindEntities(
            ix, iy, iz, TUNING.ABIGAIL_COMBAT_TARGET_DISTANCE,
            COMBAT_MUSHAVE_TAGS, COMBAT_CANTHAVE_TAGS, COMBAT_MUSTONEOF_TAGS_AGGRESSIVE
        )

        local leader = inst.components.follower.leader

        for _, v in ipairs(entities_near_me) do
            if CommonRetarget(inst, v) then
                return v
            end
        end

        return nil
    end
end

local function StartForceField(inst)
	if not inst.sg:HasStateTag("dissipate") and not inst:HasDebuff("forcefield") and (inst.components.health == nil or not inst.components.health:IsDead()) then
		local elixir_buff = inst:GetDebuff("elixir_buff")
		inst:AddDebuff("forcefield", elixir_buff ~= nil and elixir_buff.potion_tunings.shield_prefab or "abigailforcefield")
	end
end

local function OnAttacked(inst, data)
    if data.attacker == nil then
        inst.components.combat:SetTarget(nil)
    elseif not data.attacker:HasTag("noauradamage") then
        if not inst.is_defensive then
            inst.components.combat:SetTarget(data.attacker)
        elseif inst:IsWithinDefensiveRange() and inst._playerlink:GetDistanceSqToInst(data.attacker) < ABIGAIL_DEFENSIVE_MAX_FOLLOW_DSQ then
            -- Basically, we avoid targetting the attacker if they're far enough away that we wouldn't reach them anyway.
            inst.components.combat:SetTarget(data.attacker)
        end
    end

	if inst:HasDebuff("forcefield") then
		if data.attacker ~= nil and data.attacker ~= inst._playerlink and data.attacker.components.combat ~= nil then
			local elixir_buff = inst:GetDebuff("elixir_buff")
			if elixir_buff ~= nil and elixir_buff.prefab == "ghostlyelixir_retaliation_buff" then
				local retaliation = SpawnPrefab("abigail_retaliation")
				retaliation:SetRetaliationTarget(data.attacker)
				inst.SoundEmitter:PlaySound("dontstarve/characters/wendy/abigail/shield/on")
			else
				inst.SoundEmitter:PlaySound("dontstarve/characters/wendy/abigail/shield/on")
			end
		end
    end

    StartForceField(inst)
end

local function OnBlocked(inst, data)
    if data ~= nil and inst._playerlink ~= nil and data.attacker == inst._playerlink then
		if inst.components.health ~= nil and not inst.components.health:IsDead() then
			inst._playerlink.components.ghostlybond:Recall()
		end
	end
end

local function OnDeath(inst)
    inst.components.aura:Enable(false)
	inst:RemoveDebuff("ghostlyelixir")
	inst:RemoveDebuff("forcefield")
end

local function OnRemoved(inst)
    inst:BecomeDefensive()
end

local function auratest(inst, target)
    if target == inst._playerlink then
        return false
    end

	if target.components.minigame_participator ~= nil then
		return false
	end

    if (target:HasTag("player") and not TheNet:GetPVPEnabled()) or target:HasTag("ghost") or target:HasTag("noauradamage") then
        return false
    end

    local leader = inst.components.follower.leader
    if leader ~= nil
        and (leader == target
            or (target.components.follower ~= nil and
                target.components.follower.leader == leader)) then
        return false
    end

    if inst.is_defensive and not IsWithinDefensiveRange(inst) then
        return false
    end

    if inst.components.combat.target == target then
        return true
    end

    if target.components.combat.target ~= nil
        and (target.components.combat.target == inst or
            target.components.combat.target == leader) then
        return true
    end

    local ismonster = target:HasTag("monster")
    if ismonster and not TheNet:GetPVPEnabled() and 
       ((target.components.follower and target.components.follower.leader ~= nil and 
         target.components.follower.leader:HasTag("player")) or target.bedazzled) then
        return false
    end

    if target:HasTag("companion") then
        return false
    end

    return ismonster or target:HasTag("prey")
end

local function UpdateDamage(inst)
    local buff = inst:GetDebuff("elixir_buff")

	local phase = (buff ~= nil and buff.prefab == "ghostlyelixir_attack_buff") and "night" or TheWorld.state.phase
	inst.components.combat.defaultdamage = (TUNING.ABIGAIL_DAMAGE[phase] or TUNING.ABIGAIL_DAMAGE.day) / TUNING.ABIGAIL_VEX_DAMAGE_MOD -- so abigail does her intended damage defined in tunings.lua

    inst.attack_level = phase == "day" and 1
						or phase == "dusk" and 2
						or 3

    -- If the animation fx was already playing we update its animation
    local level_str = tostring(inst.attack_level)
    if inst.attack_fx and not inst.attack_fx.AnimState:IsCurrentAnimation("attack" .. level_str .. "_loop") then
        inst.attack_fx.AnimState:PlayAnimation("attack" .. level_str .. "_loop", true)
    end

    if inst.attack_fx_ground and not inst.attack_fx_ground.AnimState:IsCurrentAnimation("attack" .. level_str .. "_ground_loop") then
        inst.attack_fx_ground.AnimState:PlayAnimation("attack" .. level_str .. "_ground_loop", true)
    end
end

local function AbigailHealthDelta(inst, data)
	if inst._playerlink ~= nil then
		if data.oldpercent > data.newpercent and data.newpercent <= 0.25 and not inst.issued_health_warning then
			inst._playerlink.components.talker:Say(GetString(inst._playerlink, "ANNOUNCE_ABIGAIL_LOW_HEALTH"))
			inst.issued_health_warning = true
		elseif data.oldpercent < data.newpercent and data.newpercent > 0.33 then
			inst.issued_health_warning = false
		end
	end
end

local function DoAppear(sg)
	sg:GoToState("appear")
end

local function AbleToAcceptTest(inst, item)
    return false, item.prefab == "reviver" and "ABIGAILHEART" or nil
end

local function OnDebuffAdded(inst, name, debuff)
    if inst._playerlink ~= nil and inst._playerlink.components.pethealthbar ~= nil and name == "elixir_buff" then
        inst._playerlink.components.pethealthbar:SetSymbol(debuff.prefab)
    end
end

local function OnDebuffRemoved(inst, name, debuff)
    if inst._playerlink ~= nil and inst._playerlink.components.pethealthbar ~= nil and name == "elixir_buff" then
		inst._playerlink.components.pethealthbar:SetSymbol(0)
	end
end

local function on_ghostlybond_level_change(inst, player, data)
	if not inst.inlimbo and data.level > 1 and not inst.sg:HasStateTag("busy") and (inst.components.health == nil or not inst.components.health:IsDead()) then
		inst.sg:GoToState("ghostlybond_levelup", {level = data.level})
	end

	UpdateGhostlyBondLevel(inst, data.level)
end

local function BecomeAggressive(inst)
    inst.AnimState:OverrideSymbol("ghost_eyes", "ghost_abigail_build", "angry_ghost_eyes")
    inst.is_defensive = false
    inst._playerlink:AddTag("has_aggressive_follower")
    inst.components.combat:SetRetargetFunction(0.5, AggressiveRetarget)
end

local function BecomeDefensive(inst)
    inst.AnimState:ClearOverrideSymbol("ghost_eyes")
    inst.is_defensive = true
	if inst._playerlink ~= nil then
	    inst._playerlink:RemoveTag("has_aggressive_follower")
	end
    inst.components.combat:SetRetargetFunction(0.5, DefensiveRetarget)
end

local function onlostplayerlink(inst)
	inst._playerlink = nil
end

local function ApplyDebuff(inst, data)
	local target = data ~= nil and data.target
	if target ~= nil then
        target:AddDebuff("abigail_vex_debuff", "abigail_vex_debuff")

        local debuff = target:GetDebuff("abigail_vex_debuff")
        local skin_build = inst:GetSkinBuild()
        if skin_build ~= nil and debuff ~= nil then
            debuff.AnimState:OverrideItemSkinSymbol("flower", skin_build, "flower", inst.GUID, "abigail_attack_fx" )
        end
	end
end

local function linktoplayer(inst, player)
    inst.persists = false
    inst._playerlink = player

    BecomeDefensive(inst)

    inst:ListenForEvent("healthdelta", AbigailHealthDelta)
    inst:ListenForEvent("onareaattackother", ApplyDebuff)

    player.components.leader:AddFollower(inst)
    if player.components.pethealthbar ~= nil then
        player.components.pethealthbar:SetPet(inst, "", TUNING.ABIGAIL_HEALTH_LEVEL1)

        local elixir_buff = inst:GetDebuff("elixir_buff")
        if elixir_buff then
            player.components.pethealthbar:SetSymbol(elixir_buff.prefab)
        end
    end

    UpdateGhostlyBondLevel(inst, player.components.ghostlybond.bondlevel)
    inst:ListenForEvent("ghostlybond_level_change", inst._on_ghostlybond_level_change, player)
    inst:ListenForEvent("onremove", inst._onlostplayerlink, player)
end

local function OnExitLimbo(inst)
	local level = (inst._playerlink ~= nil and inst._playerlink.components.ghostlybond ~= nil) and inst._playerlink.components.ghostlybond.bondlevel or 1
	local light_vals = TUNING.ABIGAIL_LIGHTING[level] or TUNING.ABIGAIL_LIGHTING[1]
	inst.Light:Enable(light_vals.r ~= 0)
end

local function getstatus(inst)
	local bondlevel = (inst._playerlink ~= nil and inst._playerlink.components.ghostlybond ~= nil) and inst._playerlink.components.ghostlybond.bondlevel or 0
	return bondlevel == 100 and "LEVEL100"
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
		or "LEVEL1"
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("ghost")
    inst.AnimState:SetBuild("ghost_abigail_build")
    inst.AnimState:PlayAnimation("idle", true)
    inst.AnimState:SetBloomEffectHandle("shaders/anim_bloom_ghost.ksh")

    inst:AddTag("character")
    inst:AddTag("scarytoprey")
    inst:AddTag("girl")
    inst:AddTag("ghost")
    inst:AddTag("flying")
    inst:AddTag("noauradamage")
    inst:AddTag("notraptrigger")
    inst:AddTag("abigail")
    inst:AddTag("NOBLOCK")

    inst:AddTag("trader") --trader (from trader component) added to pristine state for optimization
	inst:AddTag("ghostlyelixirable") -- for ghostlyelixirable component

    MakeGhostPhysics(inst, 1, .5)

    inst.Light:SetIntensity(.6)
    inst.Light:SetRadius(5)
    inst.Light:SetFalloff(.6)
    inst.Light:Enable(false)
    inst.Light:SetColour(180 / 255, 195 / 255, 225 / 255)

    --It's a loop that's always on, so we can start this in our pristine state
    -- inst.SoundEmitter:PlaySound("dontstarve/ghost/ghost_girl_howl_LP", "howl")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst._playerlink = nil

    inst:SetBrain(brain)

    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
    inst.components.locomotor.walkspeed = TUNING.ABIGAIL_SPEED
    inst.components.locomotor.runspeed = TUNING.ABIGAIL_SPEED*1.5
    inst.components.locomotor.pathcaps = { allowocean = true, ignorecreep = true }
    inst.components.locomotor:SetTriggersCreep(false)

    inst:SetStateGraph("SGabigail")
	inst.sg.OnStart = DoAppear

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

	inst:AddComponent("debuffable")
	inst.components.debuffable.ondebuffadded = OnDebuffAdded
	inst.components.debuffable.ondebuffremoved = OnDebuffRemoved

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(TUNING.ABIGAIL_HEALTH_LEVEL1)
    inst.components.health:StartRegen(TUNING.ABIGAIL_HEALTH_REGEN, TUNING.ABIGAI_HEALTH_REGEN_TIME)
	inst.components.health.nofadeout = true
	inst.components.health.save_maxhealth = true

    inst:AddComponent("combat")
    inst.components.combat.playerdamagepercent = TUNING.ABIGAIL_DMG_PLAYER_PERCENT
	inst.components.combat:SetKeepTargetFunction(auratest)

    inst:AddComponent("aura")
    inst.components.aura.radius = TUNING.ABIGAI_AURA_RADIUS
    inst.components.aura.tickperiod = TUNING.ABIGAI_AURA_TICKPERIOD
    inst.components.aura.ignoreallies = true
    inst.components.aura.auratestfn = auratest

    inst.auratest = auratest

    ------------------
    --Added so you can attempt to give hearts to trigger flavour text when the action fails
    inst:AddComponent("trader")
    inst.components.trader:SetAbleToAcceptTest(AbleToAcceptTest)

	inst:AddComponent("ghostlyelixirable")

    inst:AddComponent("follower")
    inst.components.follower:KeepLeaderOnAttacked()
    inst.components.follower.keepdeadleader = true
	inst.components.follower.keepleaderduringminigame = true

	inst:AddComponent("timer")

    inst:ListenForEvent("attacked", OnAttacked)
    inst:ListenForEvent("blocked", OnBlocked)
    inst:ListenForEvent("death", OnDeath)
    inst:ListenForEvent("onremove", OnRemoved)
	inst:ListenForEvent("exitlimbo", OnExitLimbo)

    inst.BecomeDefensive = BecomeDefensive
    inst.BecomeAggressive = BecomeAggressive

    inst.IsWithinDefensiveRange = IsWithinDefensiveRange

    inst.LinkToPlayer = linktoplayer


    inst.is_defensive = true
    inst.issued_health_warning = false

    inst:WatchWorldState("phase", UpdateDamage)
	UpdateDamage(inst, TheWorld.state.phase)
	inst.UpdateDamage = UpdateDamage

	inst._on_ghostlybond_level_change = function(player, data) on_ghostlybond_level_change(inst, player, data) end
	inst._onlostplayerlink = function(player) onlostplayerlink(inst, player) end

    return inst
end

-------------------------------------------------------------------------------

local function SetRetaliationTarget(inst, target)
	inst._RetaliationTarget = target
	inst.entity:SetParent(target.entity)
	local s = (1 / target.Transform:GetScale()) * (target:HasTag("largecreature") and 1.1 or .8)
	if s ~= 1 and s ~= 0 then
		inst.Transform:SetScale(s, s, s)
	end

	inst.detachretaliationattack = function(t)
		if inst._RetaliationTarget ~= nil and inst._RetaliationTarget == t then
			inst.entity:SetParent(nil)
			inst.Transform:SetPosition(t.Transform:GetWorldPosition())
		end
	end

	inst:ListenForEvent("onremove", inst.detachretaliationattack, target)
	inst:ListenForEvent("death", inst.detachretaliationattack, target)
end

local function DoRetaliationDamage(inst)
	local target = inst._RetaliationTarget
	if target ~= nil and target:IsValid() and not target.inlimbo and target.components.combat ~= nil then
		target.components.combat:GetAttacked(inst, TUNING.GHOSTLYELIXIR_RETALIATION_DAMAGE)
		inst:detachretaliationattack(target)
        inst.SoundEmitter:PlaySound("dontstarve/characters/wendy/abigail/shield/retaliation_fx")

	end
end

local function retaliationattack_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("abigail_shield")
    inst.AnimState:SetBuild("abigail_shield")
    inst.AnimState:PlayAnimation("retaliation_fx")
    inst.AnimState:SetBloomEffectHandle("shaders/anim_bloom_ghost.ksh")
    inst.AnimState:SetLightOverride(.1)
	inst.AnimState:SetFinalOffset(3)

    --It's a loop that's always on, so we can start this in our pristine state
    -- inst.SoundEmitter:PlaySound("dontstarve/ghost/ghost_girl_howl_LP", "howl")

	inst:AddTag("FX")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst._RetaliationTarget = nil
	inst.SetRetaliationTarget = SetRetaliationTarget
	inst:DoTaskInTime(12*FRAMES, DoRetaliationDamage)
	inst:DoTaskInTime(30*FRAMES, inst.Remove)

	return inst
end

-------------------------------------------------------------------------------

local function do_hit_fx(inst)
	local fx = SpawnPrefab("abigail_vex_hit")
	fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function on_target_attacked(inst, target, data)
	if data ~= nil and data.attacker ~= nil and data.attacker:HasTag("ghostlyfriend") then
		inst.hitevent:push()
	end
end

local function buff_OnExtended(inst)
	if inst.decaytimer ~= nil then
		inst.decaytimer:Cancel()
	end
	inst.decaytimer = inst:DoTaskInTime(TUNING.ABIGAIL_VEX_DURATION, function() inst.components.debuff:Stop() end)
end

local function buff_OnAttached(inst, target)
	if target ~= nil and target:IsValid() and not target.inlimbo and target.components.combat ~= nil and target.components.health ~= nil and not target.components.health:IsDead() then
		target.components.combat.externaldamagetakenmultipliers:SetModifier(inst, TUNING.ABIGAIL_VEX_DAMAGE_MOD)

		inst.entity:SetParent(target.entity)
		inst.Transform:SetPosition(0, 0, 0)
		local s = (1 / target.Transform:GetScale()) * (target:HasTag("largecreature") and 1.6 or 1.2)
		if s ~= 1 and s ~= 0 then
			inst.Transform:SetScale(s, s, s)
		end

		inst:ListenForEvent("attacked", inst._on_target_attacked, target)
	end

	buff_OnExtended(inst)

    inst:ListenForEvent("death", function() inst.components.debuff:Stop() end, target)
end

local function buff_OnDetached(inst, target)
	if inst.decaytimer ~= nil then
		inst.decaytimer:Cancel()
		inst.decaytimer = nil

		if target ~= nil and target:IsValid() and target.components.combat ~= nil then
			target.components.combat.externaldamagetakenmultipliers:RemoveModifier(inst)
		end

		inst.AnimState:PushAnimation("vex_debuff_pst", false)
		inst:ListenForEvent("animqueueover", inst.Remove)
	end
end

local function abigail_vex_debuff_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	inst.AnimState:SetBank("abigail_debuff_fx")
	inst.AnimState:SetBuild("abigail_debuff_fx")

	inst.AnimState:PlayAnimation("vex_debuff_pre")
	inst.AnimState:PushAnimation("vex_debuff_loop", true)
	inst.AnimState:SetFinalOffset(3)

	inst:AddTag("FX")

	inst.hitevent = net_event(inst.GUID, "abigail_vex_debuff.hitevent")

	if not TheNet:IsDedicated() then
        inst:ListenForEvent("abigail_vex_debuff.hitevent", do_hit_fx)
	end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
	inst._on_target_attacked = function(target, data) on_target_attacked(inst, target, data) end

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(buff_OnAttached)
    inst.components.debuff:SetDetachedFn(buff_OnDetached)
    inst.components.debuff:SetExtendedFn(buff_OnExtended)

	return inst
end


-------------------------------------------------------------------------------

local function abigail_vex_hit_fn()
    local inst = CreateEntity()

	inst:AddTag("CLASSIFIED")
    --[[Non-networked entity]]
    inst.entity:AddTransform()
    inst.entity:AddAnimState()

	inst.AnimState:SetBank("abigail_debuff_fx")
	inst.AnimState:SetBuild("abigail_debuff_fx")

	inst.AnimState:PlayAnimation("vex_hit")
	inst.AnimState:SetFinalOffset(3)

	inst:AddTag("FX")

    inst.persists = false
	inst:ListenForEvent("animover", inst.Remove)

	return inst
end

return Prefab("abigail", fn, assets, prefabs),
	   Prefab("abigail_retaliation", retaliationattack_fn, {Asset("ANIM", "anim/abigail_shield.zip")} ),
	   Prefab("abigail_vex_debuff", abigail_vex_debuff_fn, {Asset("ANIM", "anim/abigail_debuff_fx.zip")}, {"abigail_vex_hit"} ),
	   Prefab("abigail_vex_hit", abigail_vex_hit_fn, {Asset("ANIM", "anim/abigail_debuff_fx.zip")} )
