PrefabFiles = {
	"flower_basket",
}

local assets=
{
    Asset("ATLAS", "images/inventoryimages/flower_basket.xml"),
    Asset("IMAGE", "images/inventoryimages/flower_basket.tex"),
}

AddMinimapAtlas("images/inventoryimages/flower_basket.xml")

local myrecipe = AddRecipe("flower_basket", -- name
{Ingredient("twigs", 6)}, -- ingredients Add more like so , {Ingredient("boards", 1), Ingredient("rope", 2), Ingredient("twigs", 1), etc}
GLOBAL.RECIPETABS.FARM, -- tab ( FARM, WAR, DRESS etc)
GLOBAL.TECH.NONE, -- level (GLOBAL.TECH.NONE, GLOBAL.TECH.SCIENCE_ONE, etc)
"flower_basket_placer", -- placer
1, -- min_spacing
nil, -- nounlock
nil, -- numtogive
nil, -- builder_tag
"images/inventoryimages/flower_basket.xml", -- atlas
"flower_basket.tex") -- image

GLOBAL.STRINGS.NAMES.FLOWER_BASKET = "花篮子" --It's name in-game
GLOBAL.STRINGS.RECIPE_DESC.FLOWER_BASKET = "花篮子能够存放四组花瓣。" --recipe description

AddPrefabPostInit("abigail", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return
	end
	if GetModConfigData("attackshadow") then
		inst:AddTag("crazy")
	end
end --打影怪
)

TUNING.DEATH_LEVEL = GetModConfigData("death_to_lv1")
TUNING.ABIGAI_AURA_RADIUS = GetModConfigData("攻击范围") --原版4
TUNING.ABIGAI_AURA_TICKPERIOD = GetModConfigData("AURA_TICKPERIOD") --原版1
TUNING.ABIGAIL_HEALTH_REGEN  = GetModConfigData("回血量")     --原版20                
TUNING.ABIGAI_HEALTH_REGEN_TIME = GetModConfigData("ABIGAI_HEALTH_REGEN_TIME")   --原版1

lightr = GetModConfigData("lightr")
lighti = GetModConfigData("lighti")
lightf = GetModConfigData("lightf")

TUNING.ABIGAIL_SPEED = GetModConfigData("speed")  --原版5
TUNING.ABIGAIL_DAMAGE_PER_SECOND = GetModConfigData("second_damge")   --原版20

timedamage = GetModConfigData("timedamage")

if GetModConfigData("ab_d_part") == 0 then
    TUNING.ABIGAIL_DAMAGE =
        {
            day = 15 * timedamage,
			dusk = 25 * timedamage,
			night = 40 * timedamage,
		}
else
    TUNING.ABIGAIL_DAMAGE =
        {
            day = 15 * GetModConfigData("daydamage"),
			dusk = 25 * GetModConfigData("duskdamage"),
			night = 40 * GetModConfigData("nightdamage"),
		}
end

TUNING.ABIGAIL_DMG_PERIOD =  GetModConfigData("damage_period")    --原版1.5
TUNING.ABIGAIL_DMG_PLAYER_PERCENT = GetModConfigData("damage_player_percent")    --原版是0.25

time_to_level_up = GetModConfigData("time_to_level_up")
TUNING.ABIGAIL_BOND_LEVELUP_TIME = time_to_level_up    --原版是1天 16x30=480=一天的量

TUNING.ABIGAIL_BOND_LEVELUP_TIME_MULT = GetModConfigData("time_mult")   --原版是四分之一升级天数，当场上有阿比盖尔的四花骨灰盒时，

TUNING.ABIGAIL_MAX_STAGE = 3  --3级

TUNING.ABIGAIL_LIGHTING =
{
	{l = 0.0, r = 0},
	{l = 0.1, r = 0.3*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
	{l = 0.5, r = 0.7*lightr, i = lighti, f = lightf},
}

TUNING.ABIGAIL_TAUNT = GetModConfigData("abigail_taunt")
TUNING.ABIGAIL_TAUNT_AURA = GetModConfigData("abigail_taunt_aura") --Original 15

TUNING.ABIGAIL_DEF_P = GetModConfigData("ab_def_p")

TUNING.AB_H_X = GetModConfigData("ab_h_x")

TUNING.ABIGAIL_DEFENSIVE_MAX_CHASE_TIME = GetModConfigData("defensive_max_chase_time") --3
TUNING.ABIGAIL_AGGRESSIVE_MAX_CHASE_TIME = GetModConfigData("agrresive_max_chase_time") --6

TUNING.ABIGAIL_FORCEFIELD_ABSORPTION = GetModConfigData("forcefield") --原版是1

TUNING.ABIGAIL_VEX_DURATION = GetModConfigData("vex_duration") --原版2 --ab has
TUNING.ABIGAIL_VEX_DAMAGE_MOD = GetModConfigData("vex_damage_mod") --原版1.1
TUNING.ABIGAIL_VEX_GHOSTLYFRIEND_DAMAGE_MOD = GetModConfigData("vex_ghoskyfriend_damage_mod") --原版1.4

TUNING.ABIGAIL_FLOWER_DECAY_TIME = GetModConfigData("flower_decay_time") --total_day_time * 3--480*3=1440
TUNING.ABIGAIL_FLOWER_PROX_DIST = 6*GetModConfigData("flower_prox_dist") --6*6

--新增的药水设置

TUNING.GHOSTLYELIXIR_SLOWREGEN_TICK_TIME = GetModConfigData("SLOWREGEN_TICK_TIME")
TUNING.GHOSTLYELIXIR_SLOWREGEN_HEALING = GetModConfigData("SLOWREGEN_HEALING")
TUNING.GHOSTLYELIXIR_SLOWREGEN_DURATION = GetModConfigData("SLOWREGEN_DURATION")

TUNING.GHOSTLYELIXIR_FASTREGEN_TICK_TIME = GetModConfigData("FASTREGEN_TICK_TIME")
TUNING.GHOSTLYELIXIR_FASTREGEN_HEALING = GetModConfigData("FASTREGEN_HEALING")
TUNING.GHOSTLYELIXIR_FASTREGEN_DURATION = GetModConfigData("FASTREGEN_DURATION")

TUNING.GHOSTLYELIXIR_DAMAGE_DURATION = GetModConfigData("DAMAGE_DURATION")

TUNING.GHOSTLYELIXIR_SPEED_DURATION = GetModConfigData("SPEED_DURATION")
TUNING.GHOSTLYELIXIR_SPEED_LOCO_MULT = GetModConfigData("SPEED_LOCO_MULT")

TUNING.GHOSTLYELIXIR_SHIELD_DURATION = GetModConfigData("SHIELD_DURATION")

TUNING.GHOSTLYELIXIR_RETALIATION_DURATION = GetModConfigData("RETALIATION_DURATION")

TUNING.GHOSTLYELIXIR_SPEED_PLAYER_GHOST_DURATION = GetModConfigData("SPEED_PLAYER_GHOST_DURATION")


local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH 

----感谢作者Electroely在Abigail Keybind的代码！祝你生活愉快！

local G = GLOBAL
local keybind = G["KEY_"..GetModConfigData("summonkey")]
local keybind2 = G["KEY_"..GetModConfigData("commandkey")]

local function IsInGameplay()
	return G.ThePlayer ~= nil and G.TheFrontEnd:GetActiveScreen().name == "HUD"
end

local function GetAbigail()
	if not G.ThePlayer:HasTag("ghostfriend_summoned") then return nil end
	for k, v in pairs(G.Ents) do
		if v.prefab == "abigail" and v.replica.follower and
			v.replica.follower:GetLeader() == G.ThePlayer then
				return v
			end
	end
	return nil
end

local function GetFlowerFromInventory()
	local items = G.ThePlayer.replica.inventory:GetItems()
	local backpack = G.ThePlayer.replica.inventory:GetEquippedItem(G.EQUIPSLOTS.BODY)
	local packitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	local flower = nil
	for k, v in pairs(items) do
		if v.prefab == "abigail_flower" then
			flower = v
		end
	end
	if flower ~= nil or packitems == nil then return flower end
	for k, v in pairs(packitems) do
		if v.prefab == "abigail_flower" then
			flower = v
		end
	end
	return flower
end

G.TheInput:AddKeyDownHandler(keybind, function()
	if not IsInGameplay() then return end
	local flower = GetFlowerFromInventory()
	local abigail = GetAbigail()
	if flower == nil then return end
	local rpc = nil
	local act = nil
	local target = nil
	if abigail ~= nil then
		rpc = G.RPC.ControllerUseItemOnSceneFromInvTile
		act = G.ACTIONS.CASTUNSUMMON
		target = abigail
	elseif G.ThePlayer:HasTag("ghostfriend_notsummoned") then
		rpc = G.RPC.ControllerUseItemOnSelfFromInvTile
		act = G.ACTIONS.CASTSUMMON
	else
		return
	end
	local buffact = G.BufferedAction(G.ThePlayer, target, act, flower)
	if not G.TheWorld.ismastersim then
		local function cb()
			G.SendRPCToServer(rpc, act.code, flower, target)
		end
		if G.ThePlayer.components.locomotor then
			buffact.preview_cb = cb
		else
			cb()
		end
	end
	G.ThePlayer.components.playercontroller:DoAction(buffact)
end)

G.TheInput:AddKeyDownHandler(keybind2, function()
	if not IsInGameplay() then return end
	local flower = GetFlowerFromInventory()
	local abigail = GetAbigail()
	if flower == nil or not G.ThePlayer:HasTag("ghostfriend_summoned") then return end
	if abigail ~= nil then
		act = G.ACTIONS.COMMUNEWITHSUMMONED
		local buffact = G.BufferedAction(G.ThePlayer, target, act, flower)
		if not G.TheWorld.ismastersim then
			local function cb()
				G.SendRPCToServer(G.RPC.ControllerUseItemOnSelfFromInvTile, act.code, flower, target)
			end
			if G.ThePlayer.components.locomotor then
				buffact.preview_cb = cb
			else
				cb()
			end
		end
		G.ThePlayer.components.playercontroller:DoAction(buffact)
	end
end)

if GetModConfigData("lang") == 0 then

 --升级说的话

  STRINGS.NAMES.ABIGAIL  = "阿比盖尔"
  STRINGS.CHARACTERS.GENERIC.DESCRIBE.ABIGAIL = " 可爱的小鬼魂(*╹▽╹*)。"
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL4 = " 阿比盖尔现在很虚弱，但他拥有了更多的可能。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL5 = " 绽放新生命吧！阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL6 = " 我想和阿比盖尔共舞。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL7 = " 我也曾经想像蝴蝶一样飞行，这必然美丽多样。有阳光的地方必然有土地，就像有温蒂的地方必然有阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL8 = " 如果我和阿比盖尔的人生一无所获，那是因为我们以为的爱将我们虚耗殆尽。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL9 = " 生命中有许多事，沉重哀婉至不可说。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL10 = " 在这难以安身的年代，岂敢奢言爱。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL11 = " 从不爱与忘怀之中，才能得到自由；对吗？阿比盖尔，但我不想忘记你，因为有你的片刻我才能找到自由的感觉。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL12 = " 生命在我面前无穷地开展。我只是嫌它太长了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL13 = " 你以为人的生存可以怎样怎样，到头来，打回原形，就像阿比盖尔一样。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL14 = " 生命是：你期待莲花，长出的却是肥大而香气扑鼻的芒果。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL15 = " 如同在裂空之下，我遇到了你。无所依傍。此生无所依傍。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL16 = " 我怀疑我心底什么地方，失去记忆与热情，正绵绵地下着雪。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL17 = " 你并不孤单，有我在呢，阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL18 = " 如果你的手触着我的背请不要留连并且划上浅浅的、美丽的胎记。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL19 = " 有时我想，爱不过是小恩小惠。我以为我可以独自过一生，我还是被打动了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL20 = " 就这样，生活那么大，可以挤掉任何言语，任何任何伟大而虚假的事物。我只是觉得倦，以为睡着了便没事。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL21 = " 念你细如冰裂，我只是无法惊动，惜你心密如尘，隔世岂能对镜相照，犹想你静默羞怯，我还是听到了你，并且心动而且离开。。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL22 = " 你给我狠狠地活着！难道你连这个愿望都无法满足我吗？ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL23 = " 命运的意思是，是处境选择你而不是其他。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL24 = " 如果没有灵魂，就不会感觉痛苦。但我活着就是为了感受阿比盖尔的灵魂，去感受生活的痛苦并乐在其中。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL25 = " 如果有灵魂，她怎会任由此身沉沦，腐烂，消失！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL26 = " 无论何人无论何时，人们总要在乌云周围寻索着浪漫的微光活下去。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL27 = " 人不是因为没有信念而失败，而是因为不能把信念化成行动，并且坚持到底。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL28 = " 无论天空如何阴霾，太阳一直都在，不在这里，就在那里。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL29 = " 所有的改变都是一种深思熟虑过后的奇迹，每瞬间奇迹都在发生。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL30 = " 熬过此关，便可少进，再进再困再熬再奋自有亨通精进之。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL31 = " 有一天回首往事的时候你会觉得，那些奋斗的岁月是你一生的精华。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL32 = " 我和阿比盖尔可以成为任何想成为的人！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL33 = " 生命的力量在于不顺从天意。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL34 = " 你可以不够强大，但是你不能没有梦想，如果你没有梦想将来你就只能为别人的梦想打工，这一路你可以哭，但你一定不能停。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL35 = " 后来很多人问我一个人也要踟蹰路上的心情，我想起的却不是孤单和路长，而是波澜壮阔的海洋和天空中闪耀的星光。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL36 = " 不管前方的路有多苦，只要方向正确，不管多么崎岖不平，都比站在原地更接近幸福。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL37 = " 成长吧，阿比盖尔；成长吧，温蒂。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL38 = " 有时候一点的信念，可以走很长的路。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL39 = " 草地上匆匆的脚步代表着我对你的思念。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL40 = " 阿比盖尔，花朵是我们共同的纪念，共同的见证。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL41 = " 把自己立成帆，才能招来风。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL42 = " 没有谁的生活会一直完美，但无论什么时候都要眼看前方，满怀希望就会所向披靡。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL43 = " 没救了，没救了，难道真的没救了嘛？，就算一无所有，至少你还有我啊！阿比盖尔！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL44 = " 生活是苦难的，我又划着我的断桨出发了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL45 = " 有些路很远，走下去会很累，可是，不走，又会后悔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL46 = " 我越来越相信，创造美好的代价是：努力，失望以及毅力，首先是疼痛，然后才是快乐。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL47 = " 阿比盖尔站起来！你不必为任何人倒下，你只能倒在我的怀里，听到了吗？ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL48 = " 心里的火永远不要灭，哪怕别人只能看到烟。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL49 = " 所谓无底深渊，下去也是前程万里。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL50 = " 今天，我很开心，因为有你在，阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL51 = " 阿比盖尔，你是我的小宝贝。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL52 = " 乖，不用害怕。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL53 = " 我一个人前行，却仿佛带着一万雄兵。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL54 = " 相信尘埃里会开出一朵花，因为曾有漫天星光，亮透胸膛。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL55 = " 一星陨落，黯淡不了灿烂星空；一花凋零，荒芜不了整个春天；因为，我迟早都会让你绽放！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL56 = " 人是为明天活着的，因为记忆中有朝阳晓露。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL57 = " 不努力，是会被合并同类项的，所以你要做那个被提取出来的公因式。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL58 = " 阿比盖尔，你在哪里，光就在哪里。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL59 = " 别去想那些乱七八糟的屁事了，阿比盖尔，有我陪在你身边。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL60 = " 我最喜欢摸你的头了...... "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL61 = " 你还是那么的活泼，我要是活泼点就好了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL62 = " 盖尔战士何在？诸君听令，给我杀！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL63 = " 嘿嘿嘿~你在这里啊！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL64 = " 打架的阿比盖尔来咯~ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL65 = " 阿比盖尔，快来保护我！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL66 = " 不管你是打架的阿比盖尔，还是默默陪在我身边的阿比盖尔，我都喜欢。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL67 = " 有你在的地方，就有光芒。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL68 = " 我喜欢你，阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL69 = " 啊~活蹦乱跳的阿比盖尔升级了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL70 = " 精灵来保护我了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL71 = " 绽放你的活力，阿比盖尔 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL72 = " 生命的意义，就是因为有了你。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL73 = " 死而复生！我们做到了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL74 = " 不能被欺负，不能让你们欺负我！"
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL75 = " 阿比盖尔，我们上。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL76 = " 我们不能被打倒在地，明天，胜利就在向我们招手。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL77 = " 我中意你，阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL78 = " 复活吧，阿比盖尔，你还没有死。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL79 = " 阿比盖尔现在有着强大的力量，绽放着她属于自己的光芒 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL80 = " 生活是种律动，须有光有影，有左有右，有晴有雨，滋味就含在这变而不猛的曲折里。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL81 = " 大部分人喜欢你，他们就想普普通通地喜欢你一下，和你在一起。摸摸你的叶子，亲亲你开的花。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL82 = " 阿比盖尔，我对你想说一句英语：“Don't Go away！。ABi...Don't go! ”"
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL83 = " 这是我今天新学的英文：“Let's Raise Our Power to go up for the tommorw!” "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL84 = " 阿比，我送你一句日语：“あなたの生きている信念が,私の求めている信念です。” "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL85 = " “Geboren aus liebe。”这是我对你要说的德语。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL86 = " 暖暖的内心，因为有了你：“Caliente en el interior, porque con usted”。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL87 = " ผ ม ช อ บ คุ ณ。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL88 = " Ты мне нравишься.。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL89 = " 나는 네가 좋다。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL90 = " 阿比盖尔你现在已经无比强大了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL91 = " 我要你知道，在这个世界上总有一个人是等着你的，不管在什么时候,不管在什么地方，反正你知道，总有这么个人，阿比盖尔，你知道是谁吗？ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL92 = " 阿比盖尔，我真的很奇怪，明明我是一个很消极的人，但在你身边却总是很积极开朗。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL93 = " 我知道你想要的是被在意的感觉，因为我也是，只想被你偏爱。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL94 = " 我曾对你心动过，但赶路要紧，我忘了说，但现在，我想对你说....咳咳咳咳，没什么，赶路吧。（真是奇怪，明明我是一个有话直说的人，好烦啊！） "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL95 = " 努力投入热闹的生活，认真收藏平凡的美好，不放过一星半点俗世生机，以便使自己与真实的世界保持联系。心里知道这联系脆弱，稍有一点松懈就断了，但我仍在坚持，这是求生的本能。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL96 = " 夜里不睡的人，白天多多少少总有什么逃避掩饰的吧。白昼解不开的结，黑夜慢慢耗。阿比盖尔你也是，你黑夜里的攻击才是你真正的自己。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL97 = " 我化为雪中闪耀的钻石，我化为阳光洒落在成熟稻谷上，我化为绵绵的秋雨滋润你的心。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL98 = " 我化为温柔的星星在夜晚闪耀着，不要站在我的坟前哭泣我不在那，我还未离世。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL99 = " 阿比盖尔，你还差临门一脚就要一百了呢。真是为你高兴。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL100 = " 阿比盖尔绽放吧！属于你自己的光辉。我一辈子都会陪在你的身边，没有你的日子，就像一滩苦水。所以，让我们永远向前冲吧！ "

 --召唤说得话

  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL4  = " 阿比盖尔现在很虚弱，但他拥有了更多的可能。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL5  = " 绽放新生命吧！阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL6  = " 我想和阿比盖尔共舞。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL7  = " 我也曾经想像蝴蝶一样飞行，这必然美丽多样。有阳光的地方必然有土地，就像有温蒂的地方必然有阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL8  = " 如果我和阿比盖尔的人生一无所获，那是因为我们以为的爱将我们虚耗殆尽。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL9  = " 生命中有许多事，沉重哀婉至不可说。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL10  = " 在这难以安身的年代，岂敢奢言爱。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL11  = " 从不爱与忘怀之中，才能得到自由；对吗？阿比盖尔，但我不想忘记你，因为有你的片刻我才能找到自由的感觉。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL12  = " 生命在我面前无穷地开展。我只是嫌它太长了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL13  = " 你以为人的生存可以怎样怎样，到头来，打回原形，就像阿比盖尔一样。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL14  = " 生命是：你期待莲花，长出的却是肥大而香气扑鼻的芒果。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL15  = " 如同在裂空之下，我遇到了你。无所依傍。此生无所依傍。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL16  = " 我怀疑我心底什么地方，失去记忆与热情，正绵绵地下着雪。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL17  = " 你并不孤单，有我在呢，阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL18  = " 如果你的手触着我的背请不要留连并且划上浅浅的、美丽的胎记。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL19  = " 有时我想，爱不过是小恩小惠。我以为我可以独自过一生，我还是被打动了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL20  = " 就这样，生活那么大，可以挤掉任何言语，任何任何伟大而虚假的事物。我只是觉得倦，以为睡着了便没事。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL21  = " 念你细如冰裂，我只是无法惊动，惜你心密如尘，隔世岂能对镜相照，犹想你静默羞怯，我还是听到了你，并且心动而且离开。。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL22  = " 你给我狠狠地活着！难道你连这个愿望都无法满足我吗？ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL23  = " 命运的意思是，是处境选择你而不是其他。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL24  = " 如果没有灵魂，就不会感觉痛苦。但我活着就是为了感受阿比盖尔的灵魂，去感受生活的痛苦并乐在其中。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL25  = " 如果有灵魂，她怎会任由此身沉沦，腐烂，消失！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL26  = " 无论何人无论何时，人们总要在乌云周围寻索着浪漫的微光活下去。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL27  = " 人不是因为没有信念而失败，而是因为不能把信念化成行动，并且坚持到底。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL28  = " 无论天空如何阴霾，太阳一直都在，不在这里，就在那里。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL29  = " 所有的改变都是一种深思熟虑过后的奇迹，每瞬间奇迹都在发生。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL30  = " 熬过此关，便可少进，再进再困再熬再奋自有亨通精进之。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL31  = " 有一天回首往事的时候你会觉得，那些奋斗的岁月是你一生的精华。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL32  = " 我和阿比盖尔可以成为任何想成为的人！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL33  = " 生命的力量在于不顺从天意。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL34  = " 你可以不够强大，但是你不能没有梦想，如果你没有梦想将来你就只能为别人的梦想打工，这一路你可以哭，但你一定不能停。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL35  = " 后来很多人问我一个人也要踟蹰路上的心情，我想起的却不是孤单和路长，而是波澜壮阔的海洋和天空中闪耀的星光。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL36  = " 不管前方的路有多苦，只要方向正确，不管多么崎岖不平，都比站在原地更接近幸福。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL37  = " 成长吧，阿比盖尔；成长吧，温蒂。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL38  = " 有时候一点的信念，可以走很长的路。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL39  = " 草地上匆匆的脚步代表着我对你的思念。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL40  = " 阿比盖尔，花朵是我们共同的纪念，共同的见证。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL41  = " 把自己立成帆，才能招来风。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL42  = " 没有谁的生活会一直完美，但无论什么时候都要眼看前方，满怀希望就会所向披靡。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL43  = " 没救了，没救了，难道真的没救了嘛？，就算一无所有，至少你还有我啊！阿比盖尔！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL44  = " 生活是苦难的，我又划着我的断桨出发了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL45  = " 有些路很远，走下去会很累，可是，不走，又会后悔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL46  = " 我越来越相信，创造美好的代价是：努力，失望以及毅力，首先是疼痛，然后才是快乐。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL47  = " 阿比盖尔站起来！你不必为任何人倒下，你只能倒在我的怀里，听到了吗？ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL48  = " 心里的火永远不要灭，哪怕别人只能看到烟。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL49  = " 所谓无底深渊，下去也是前程万里。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL50  = " 今天，我很开心，因为有你在，阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL51  = " 阿比盖尔，你是我的小宝贝。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL52  = " 乖，不用害怕。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL53  = " 我一个人前行，却仿佛带着一万雄兵。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL54  = " 相信尘埃里会开出一朵花，因为曾有漫天星光，亮透胸膛。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL55  = " 一星陨落，黯淡不了灿烂星空；一花凋零，荒芜不了整个春天；因为，我迟早都会让你绽放！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL56  = " 人是为明天活着的，因为记忆中有朝阳晓露。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL57  = " 不努力，是会被合并同类项的，所以你要做那个被提取出来的公因式。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL58  = " 阿比盖尔，你在哪里，光就在哪里。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL59  = " 别去想那些乱七八糟的屁事了，阿比盖尔，有我陪在你身边。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL60  = " 我最喜欢摸你的头了...... "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL61  = " 你还是那么的活泼，我要是活泼点就好了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL62  = " 盖尔战士何在？诸君听令，给我杀！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL63  = " 嘿嘿嘿~你在这里啊！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL64  = " 打架的阿比盖尔来咯~ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL65  = " 阿比盖尔，快来保护我！ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL66  = " 不管你是打架的阿比盖尔，还是默默陪在我身边的阿比盖尔，我都喜欢。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL67  = " 有你在的地方，就有光芒。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL68  = " 我喜欢你，阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL69  = " 啊~活蹦乱跳的阿比盖尔升级了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL70  = " 精灵来保护我了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL71  = " 绽放你的活力，阿比盖尔 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL72  = " 生命的意义，就是因为有了你。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL73  = " 死而复生！我们做到了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL74  = " 不能被欺负，不能让你们欺负我！"
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL75  = " 阿比盖尔，我们上。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL76  = " 我们不能被打倒在地，明天，胜利就在向我们招手。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL77  = " 我中意你，阿比盖尔。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL78  = " 复活吧，阿比盖尔，你还没有死。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL79  = " 阿比盖尔现在有着强大的力量，绽放着她属于自己的光芒 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL80  = " 生活是种律动，须有光有影，有左有右，有晴有雨，滋味就含在这变而不猛的曲折里。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL81  = " 大部分人喜欢你，他们就想普普通通地喜欢你一下，和你在一起。摸摸你的叶子，亲亲你开的花。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL82  = " 阿比盖尔，我对你想说一句英语：“Don't Go away！。ABi...Don't go! ”"
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL83  = " 这是我今天新学的英文：“Let's Raise Our Power to go up for the tommorw!” "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL84  = " 阿比，我送你一句日语：“あなたの生きている信念が,私の求めている信念です。” "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL85  = " “Geboren aus liebe。”这是我对你要说的德语。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL86  = " 暖暖的内心，因为有了你：“Caliente en el interior, porque con usted”。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL87  = " ผ ม ช อ บ คุ ณ。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL88  = " Ты мне нравишься.。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL89  = " 나는 네가 좋다。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL90  = " 阿比盖尔你现在已经无比强大了。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL91  = " 我要你知道，在这个世界上总有一个人是等着你的，不管在什么时候,不管在什么地方，反正你知道，总有这么个人，阿比盖尔，你知道是谁吗？ "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL92  = " 阿比盖尔，我真的很奇怪，明明我是一个很消极的人，但在你身边却总是很积极开朗。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL93  = " 我知道你想要的是被在意的感觉，因为我也是，只想被你偏爱。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL94  = " 我曾对你心动过，但赶路要紧，我忘了说，但现在，我想对你说....咳咳咳咳，没什么，赶路吧。（真是奇怪，明明我是一个有话直说的人，好烦啊！） "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL95  = " 努力投入热闹的生活，认真收藏平凡的美好，不放过一星半点俗世生机，以便使自己与真实的世界保持联系。心里知道这联系脆弱，稍有一点松懈就断了，但我仍在坚持，这是求生的本能。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL96  = " 夜里不睡的人，白天多多少少总有什么逃避掩饰的吧。白昼解不开的结，黑夜慢慢耗。阿比盖尔你也是，你黑夜里的攻击才是你真正的自己。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL97  = " 我化为雪中闪耀的钻石，我化为阳光洒落在成熟稻谷上，我化为绵绵的秋雨滋润你的心。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL98  = " 我化为温柔的星星在夜晚闪耀着，不要站在我的坟前哭泣我不在那，我还未离世。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL99  = " 阿比盖尔，你还差临门一脚就要一百了呢。真是为你高兴。 "
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL100  = " 绽放吧！阿比盖尔。 "

 --死亡说的话

  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_DEATH	 = " 阿比盖尔！你给我狠狠的站起来！难道你连我这最后一个愿望都无法满足我吗！？ " --因为无法掉到1级所以无法触发？
  STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_LOW_HEALTH  = " 阿比盖尔！你给我狠狠的站起来！难道你连我这唯一的心愿都要剥夺吗！？ " --补充，死亡语音是这个。--嗯嗯嗯，现在发现也不会触发。

else

 --What the upgrade said
 STRINGS.NAMES.ABIGAIL = "Abigail "
 STRINGS.CHARACTERS.GENERIC.DESCRIBE.ABIGAIL = "Cute little ghost soul (* ╹▽ ╹*) "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL4 =  "Abigail is very weak now, but he has more possibilities "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL5 = "Bloom new life! Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL6 = "I want to dance with Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL7 = "I also wanted to fly like a butterfly, which must be beautiful and diverse.Where there is sunshine, there must be land, just like where there is Wendy, there must be Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL8 = "If Abigail and I have achieved nothing in our lives, it is because the love we thought would exhaust us "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL9 = "There are many things in life that are too heavy and sorrowful to be said "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL10 = "In these difficult times to settle down, how dare you speak of love "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL11 = "Only by never loving and forgetting can I be free; right? Abigail, but I don't want to forget you, because it takes a moment for me to feel free "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL12 = "Life unfolds infinitely in front of me.I just find it too long "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL13 = "What do you think human survival can be? In the end, return to its original form, just like Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL14 = "Life is: you expect lotus flowers, but what grows is plump and fragrant mangoes "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL15 = "It's like under the crack of the sky, I met you.There's nothing to rely on.There's nothing to rely on in this life "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL16 = "I doubt where in my heart, losing memories and passion, it is snowing continuously "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL17 = "You're not alone, I'm here, Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL18 = "If your hand touches my back, please do not leave it and mark it with a shallow and beautiful birthmark "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL19 = "Sometimes I think love is just a small favor.I thought I could live my life alone, but I was still moved "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL20 = "That's it, life is so big that it can squeeze out any words, any great and false things.I just feel tired, thinking that if I fall asleep, I'll be fine "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL21 = "I miss you as thin as ice, but I just can't be moved.I cherish your heart as close as dust.How can I look at you in the mirror in another world? I still want you to be silent and shy, but I still heard you, moved and left "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL22 = "You live hard for me! Can't you even fulfill this wish "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL23 = "Fate means that it is the situation that chooses you rather than others "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL24 = "If there is no soul, I wouldn't feel pain.But I live to feel Abigail's soul, to feel the pain of life and enjoy it "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL25 = "If there were a soul, how could she let this body sink, rot, and disappear "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL26 = "No matter who or when, people always search for romantic glimmers of light around the dark clouds to survive "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL27 = "People do not fail because they lack faith, but because they cannot turn their faith into action and persist until the end "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL28 = "No matter how cloudy the sky is, the sun is always there, not here, just there "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL29 = "All change is a deliberate miracle, and every moment a miracle occurs "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL30 = "If you pass this level, you can make less progress.If you continue to progress and struggle, you will achieve great success and progress "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL31 = "One day when you look back on the past, you will feel that those years of struggle are the essence of your life. "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL32 = "Abigail and I can be whoever we want to be "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL33 = "The power of life lies in disobeying providence "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL34 = "You may not be strong enough, but you cannot do without dreams.If you don't have dreams, you can only work for others' dreams in the future.You can cry all the way, but you must not stop "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL35 = "Later, many people asked me about the feeling of being hesitant on the road alone, but what I remembered was not loneliness and the length of the road, but the magnificent ocean and the shining stars in the sky "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL36 = "No matter how difficult the road ahead may be, as long as the direction is correct and no matter how bumpy, happiness is closer than standing in place "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL37 = "Grow, Abigail; Grow, Wendy "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL38 = "Sometimes a little faith can go a long way "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL39 = "The hurried footsteps on the grass represent my longing for you "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL40 = "Abigail, flowers are our common commemoration and witness "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL41 = "Set yourself up as a sail to attract the wind "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL42 = "No one's life will always be perfect, but always look ahead, full of hope, and you will be invincible "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL43 = "It's hopeless, it's hopeless.Is it really hopeless? Even if you have nothing, at least you still have me! Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL44 = "Life is difficult, and I set off with my broken oar "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL45 = "Some roads are far away and walking can be tiring, but if you don't walk, you will regret it "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL46 = "I increasingly believe that the cost of creating beauty is effort, disappointment, and perseverance, first pain, and then happiness "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL47 = "Abigail, stand up! You don't have to fall for anyone, you can only fall in my arms, do you hear me "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL48 = "The fire in your heart should never be extinguished, even if others can only see smoke "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL49 = "The so-called bottomless abyss has a long way to go "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL50 = "Today, I am very happy because I have you here, Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL51 = "Abigail, you are my little baby "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL52 = "Be good, don't be afraid "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL53 = "I walked alone, but it seemed like I was carrying ten thousand soldiers "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL54 = "I believe a flower will bloom in the dust, because there was once a starry sky shining brightly through my chest. "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL55 = "A star that falls cannot dim the brilliant starry sky; a flower that withers cannot be barren throughout spring; because sooner or later, I will make you bloom "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL56 = "People live for tomorrow, because there is morning dew in memory "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL57 = "If you don't work hard, you will be merged with similar terms, so you need to do the extracted common factor "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL58 = "Abigail, where you are, light is there "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL59 = "Don't think about all that messy shit, Abigail, I'll be by your side "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL60 = "I love touching your head the most "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL61 = "You're still so lively, I wish I were more lively "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL62 = "Where is the Gail warrior? Follow your orders and kill me "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL63 = "Hey, hey, you're here "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL64 = "Abigail in a fight~ "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL65 = "Abigail, come and protect me "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL66 = "Whether you're Abigail fighting or Abigail silently by my side, I love you "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL67 = "Wherever you are, there is light "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL68 = "I like you, Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL69 = "Ah~The lively Abigail has been upgraded "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL70 = "The elf has come to protect me "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL71 = "Bloom your vitality, Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL72 = "The meaning of life is because of you "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL73 = "Rebirth from the dead! We did it "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL74 = "You cannot be bullied, you cannot let me be bullied "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL75 = "Abigail, let's go "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL76 = "We cannot be knocked down.Tomorrow, victory will beckon to us "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL77 = "I like you, Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL78 = "Resurrect, Abigail, you haven't died yet "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL79 = "Abigail now has a powerful power, blooming with her own light "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL80 = "Life is a rhythm, with light and shadow, left and right, sunny and rainy, and the taste is contained in the twists and turns that change but are not fierce "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL81 = "Most people like you, they just want to like you and be with you.Touch your leaves, kiss your blooming flowers "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL82 = "Abigail, I want to say something in English to you:Don't Go away!.ABi...Don't go "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL83 = "This is the new English I learned today: Let's Raise Our Power to go up for the tommorw "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL84 = "Abby, let me send you a Japanese sentence: My life is a belief, my personal desire is a belief. "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL85 = "Geboren aus liebe.This is the German I want to speak to you. "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL86 = "A warm heart, because of you: Caliente en el interval, porque con usted.  "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL87 = "Square meter "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL88 = " Ты мне нравишься.   "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL89 = "나는네가 Light up. "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL90 = "Abigail, you are now incredibly powerful "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL91 = "I want you to know that there is always someone waiting for you in this world, no matter when, no matter where, you know, there is always such a person, Abigail, do you know who it is "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL92 = "Abigail, I am really strange.Although I am a very negative person, I am always positive and cheerful around you "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL93 = "I know what you want is the feeling of being cared for, because I too, just want to be favored by you "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL94 = "I used to have a crush on you, but it's important to hurry.I forgot to say it, but now, I want to tell you...cough cough cough, it's nothing, hurry.(It's really strange, I'm a person who has something to say directly, so annoying!) "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL95 = "Strive to immerse oneself in a lively life, collect ordinary beauty seriously, and never let go of any worldly vitality in order to maintain a connection with the real world.I know in my heart that this connection is fragile, and if I let go of it, it will break, but I still persist.This is the instinct to survive "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL96 = "People who don't sleep at night, there is always something to hide during the day.The knot that cannot be untied by the day, the night slowly wears away.Abigail, you too, the attacks in the night are your true self "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL97 = "I transform into a diamond shining in the snow, I transform into sunlight falling on mature rice, I transform into continuous autumn rain to nourish your heart "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL98 = "I turn into a gentle star shining at night.Don't stand at my grave and cry.I'm not there, I'm not dead yet "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL99 = "Abigail, you're almost a hundred feet away from the door.I'm really happy for you "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_GHOSTLYBOND_LEVELUP.LEVEL100 = "Bloom! Your own glory.I will be by your side for the rest of my life.Days without you are like a puddle of bitter water.So, let's always move forward "

 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL4 = "Abigail is very weak now, but he has more possibilities "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL5 = "Bloom new life! Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL6 = "I want to dance with Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL7 = "I also wanted to fly like a butterfly, which must be beautiful and diverse.Where there is sunshine, there must be land, just like where there is Wendy, there must be Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL8 = "If Abigail and I have achieved nothing in our lives, it is because the love we thought would exhaust us "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL9 = "There are many things in life that are too heavy and sorrowful to be said "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL10 = "In these difficult times to settle down, how dare you speak of love "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL11 = "Only by never loving and forgetting can I be free; right? Abigail, but I don't want to forget you, because it takes a moment for me to feel free "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL12 = "Life unfolds infinitely in front of me.I just find it too long "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL13 = "What do you think human survival can be? In the end, return to its original form, just like Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL14 = "Life is: you expect lotus flowers, but what grows is plump and fragrant mangoes "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL15 = "It's like under the crack of the sky, I met you.There's nothing to rely on.There's nothing to rely on in this life "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL16 = "I doubt where in my heart, losing memories and passion, it is snowing continuously "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL17 = "You're not alone, I'm here, Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL18 = "If your hand touches my back, please do not leave it and mark it with a shallow and beautiful birthmark "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL19 = "Sometimes I think love is just a small favor.I thought I could live my life alone, but I was still moved "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL20 = "That's it, life is so big that it can squeeze out any words, any great and false things.I just feel tired, thinking that if I fall asleep, I'll be fine "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL21 = "I miss you as thin as ice, but I just can't be moved.I cherish your heart as close as dust.How can I look at you in the mirror in another world? I still want you to be silent and shy, but I still heard you, moved and left "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL22 = "You live hard for me! Can't you even fulfill this wish "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL23 = "Fate means that it is the situation that chooses you rather than others "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL24 = "If there is no soul, I wouldn't feel pain.But I live to feel Abigail's soul, to feel the pain of life and enjoy it "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL25 = "If there were a soul, how could she let this body sink, rot, and disappear "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL26 = "No matter who or when, people always search for romantic glimmers of light around the dark clouds to survive "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL27 = "People do not fail because they lack faith, but because they cannot turn their faith into action and persist until the end "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL28 = "No matter how cloudy the sky is, the sun is always there, not here, just there "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL29 = "All change is a deliberate miracle, and every moment a miracle occurs "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL30 = "If you pass this level, you can make less progress.If you continue to progress and struggle, you will achieve great success and progress "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL31 = "One day when you look back on the past, you will feel that those years of struggle are the essence of your life. "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL32 = "Abigail and I can be whoever we want to be "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL33 = "The power of life lies in disobeying providence "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL34 = "You may not be strong enough, but you cannot do without dreams.If you don't have dreams, you can only work for others' dreams in the future.You can cry all the way, but you must not stop "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL35 = "Later, many people asked me about the feeling of being hesitant on the road alone, but what I remembered was not loneliness and the length of the road, but the magnificent ocean and the shining stars in the sky "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL36 = "No matter how difficult the road ahead may be, as long as the direction is correct and no matter how bumpy, happiness is closer than standing in place "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL37 = "Grow, Abigail; Grow, Wendy "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL38 = "Sometimes a little faith can go a long way "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL39 = "The hurried footsteps on the grass represent my longing for you "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL40 = "Abigail, flowers are our common commemoration and witness "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL41 = "Set yourself up as a sail to attract the wind "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL42 = "No one's life will always be perfect, but always look ahead, full of hope, and you will be invincible "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL43 = "It's hopeless, it's hopeless.Is it really hopeless? Even if you have nothing, at least you still have me! Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL44 = "Life is difficult, and I set off with my broken oar "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL45 = "Some roads are far away and walking can be tiring, but if you don't walk, you will regret it "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL46 = "I increasingly believe that the cost of creating beauty is effort, disappointment, and perseverance, first pain, and then happiness "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL47 = "Abigail, stand up! You don't have to fall for anyone, you can only fall in my arms, do you hear me "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL48 = "The fire in your heart should never be extinguished, even if others can only see smoke "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL49 = "The so-called bottomless abyss has a long way to go "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL50 = "Today, I am very happy because I have you here, Abigail "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL51 = "Abigail, you are my little baby "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL52 = "Be good, don't be afraid "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL53 = "I walked alone, but it seemed like I was carrying ten thousand soldiers "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL54 = "I believe a flower will bloom in the dust, because there was once a starry sky shining brightly through my chest. "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL55 ="A star that falls cannot dim the brilliant starry sky; a flower that withers cannot be barren throughout spring; because sooner or later, I will make you bloom"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL56 ="People live for tomorrow, because there is morning dew in memory"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL57 ="If you don't work hard, you will be merged with similar terms, so you need to do the extracted common factor"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL58 ="Abigail, where you are, light is there"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL59 ="Don't think about all that messy shit, Abigail, I'll be by your side"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL60 ="I love touching your head the most"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL61 ="You're still so lively, I wish I were more lively"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL62 ="Where is the Gail warrior? Follow your orders and kill me"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL63 ="Hey, hey, you're here"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL64 ="Abigail in a fight~"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL65 ="Abigail, come and protect me"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL66 ="Whether you're Abigail fighting or Abigail silently by my side, I love you"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL67 ="Wherever you are, there is light"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL68 ="I like you, Abigail"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL69 ="Ah~The lively Abigail has been upgraded"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL70 ="The elf has come to protect me"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL71 ="Bloom your vitality, Abigail"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL72 ="The meaning of life is because of you"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL73 ="Rebirth from the dead! We did it"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL74 ="You cannot be bullied, you cannot let me be bullied"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL75 ="Abigail, let's go"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL76 ="We cannot be knocked down.Tomorrow, victory will beckon to us"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL77 ="I like you, Abigail"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL78 ="Resurrect, Abigail, you haven't died yet"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL79 ="Abigail now has a powerful power, blooming with her own light"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL80 ="Life is a rhythm, with light and shadow, left and right, sunny and rainy, and the taste is contained in the twists and turns that change but are not fierce"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL81 ="Most people like you, they just want to like you and be with you.Touch your leaves, kiss your blooming flowers"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL82 ="Abigail, I want to say something in English to you: Don't Go away!.ABi...Don't go！"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL83 ="This is the new English I learned today:Let's Raise Our Power to go up for the tommorrw."
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL84 ="Abby, let me send you a Japanese sentence:My life is a belief, my personal desire is a belief."
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL85 ="Geboren aus liebe.This is the German I want to speak to you"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL86 ="A warm heart, because of you: Caliente en el interval, porque con usted "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL87 ="Square meter"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL88 =" Ты мне нравишься. "
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL89 ="나는네가 Light up"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL90 ="Abigail, you are now incredibly powerful"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL91 ="I want you to know that there is always someone waiting for you in this world, no matter when, no matter where, you know, there is always such a person, Abigail, do you know who it is"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL92 ="Abigail, I am really strange.Although I am a very negative person, I am always positive and cheerful around you"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL93 ="I know what you want is the feeling of being cared for, because I too, just want to be favored by you"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL94 ="I used to have a crush on you, but it's important to hurry.I forgot to say it, but now, I want to tell you...cough cough cough, it's nothing, hurry.(It's really strange, I'm a person who has something to say directly, so annoying!)"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL95 ="Strive to immerse oneself in a lively life, collect ordinary beauty seriously, and never let go of any worldly vitality in order to maintain a connection with the real world.I know in my heart that this connection is fragile, and if I let go of it, it will break, but I still persist.This is the instinct to survive"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL96 ="People who don't sleep at night, there is always something to hide during the day.The knot that cannot be untied by the day, the night slowly wears away.Abigail, you too, the attacks in the night are your true self"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL97 ="I transform into a diamond shining in the snow, I transform into sunlight falling on mature rice, I transform into continuous autumn rain to nourish your heart"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL98 ="I turn into a gentle star shining at night.Don't stand at my grave and cry.I'm not there, I'm not dead yet"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL99 ="Abigail, you're almost a hundred feet away from the door.I'm really happy for you"
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_SUMMON.LEVEL100 ="Bloom! Your own glory,Aigail."

 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_DEATH  = "Abigail! You get up on your ass! Can't you even grant me this last wish?! ?  "-- Can't trigger because you can't fall to level 1?
 STRINGS.CHARACTERS.WENDY.ANNOUNCE_ABIGAIL_LOW_HEALTH = "Abigail! You get up on your ass! Do you want to deprive me of this one wish?! ?  "-- Add, death voice is this. - Mm-hmm, now it turns out it doesn't trigger either.
end
