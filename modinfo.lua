name = "󰀉 阿比盖尔自定义工具 󰀉 "
author = "lofling0"
description = [[
󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜
󰀉 一定要记得自定义啊朋友们！五十多个自定义！快来打造属于你自己属性的阿比盖尔

󰀉 Program:没有自定义下，阿比盖尔现在可以升到100级，从3级600血开始，每升一级都会多100血󰀍；到9000血以上，每升一级加200滴血󰀍，直到10500血󰀍为止；快捷键一键召唤和收回阿比盖尔（感谢Electroely）；灵魂万能药更加强悍；护盾立场是应该是控制保护罩大小的，以及更多。

󰀉 CopyWriting:阿比盖尔升级和召唤有一百多个新的短句。

󰀉 Art:灵药的LOGO和特效放大特效效果，新增一个花篮子可以放四组花瓣。

󰀗 服务器标签：ab_set 
󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜󰀜
]]
version = "1.81" 
dst_compatible = true
forge_compatible = false
gorge_compatible = false
dont_starve_compatible = false
client_only_mod = false
all_clients_require_mod = true

icon_atlas = "modicon.xml" 
icon = "modicon.tex" 

forumthread = ""
api_version_dst = 10
priority = 2
mod_dependencies = {}
server_filter_tags = {"ab_set"}

local keys = {
	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	"LSHIFT","LALT","LCTRL","TAB","BACKSPACE","PERIOD","SLASH","TILDE",
}

configuration_options=
{ 
    {
		name = "lang",
		label = "Language/语言",
		hover = "This is Language Setting!\n这是语音设置选项！",
		options ={	
					{description = "English", data = 1},
					{description = "简体中文", data = 0},
					--{description = "繁體中文", data = cht},--终有一天，有人会打开这个文档看到这条消息的！
					--{description = "русск", data = ru},--然后让他帮我做，嘿嘿。
					--{description = "português-Brasil", data = br},
				},
		default = 0
	},
	{
		name = "basket_open",
		label = "花篮子是否打开",
		hover = "Flower Basket Is Open?",
		options ={	
					{description = "Yes", data = 1},
					{description = "No", data = 0},
				},
		default = 1
	},
	{
		name = "ab_h_x",
		label = "Health multiple\血量倍数",
		hover = " health multiple this setting\n如果改成0.5，原本是变成700血(600+100)，现在是700x0.5=350血。",
		options ={	
		
					{description = "0，你确定吗？", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
					{description = "1.2", data = 1.2},
					{description = "1.4", data = 1.4},
					{description = "1.6", data = 1.6},
					{description = "1.8", data = 1.8},
					{description = "2.0", data = 2.0},

				},
		default = 1
	},
	{
		name = "lightr",
		label = "Light radius multiple\光半径倍数",
		hover = " more value more light radius\n光照亮的半径倍数，数值越大，阿比盖尔的光照范围越大。",
		options ={	
		
					{description = "1", data = 1},
					{description = "5", data = 5},
					{description = "10", data = 10},
					{description = "20", data = 20},
					{description = "50", data = 50},
					{description = "100", data = 100},
					{description = "200", data = 200},
					{description = "500", data = 500},
				},
		default = 5
	},
	{
		name = "lighti",
		label = "Light intensity\光强",
		hover = " more value more light intensity\n对1级以上阿比盖尔有用，数值越大，光越集中，你改的什么数字游戏里的光强就是多少。",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
				},
		default = 0.8
	},
	{
		name = "lightf",
		label = "Light exhaustion\光衰竭",
		hover = " more value less light\n对1级以上阿比盖尔有用，数值越小，光的衰竭越小，光越强；数值越大，光衰竭越大，光越弱",
		options ={	
		
					{description = "0", data = 1},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
				},
		default = 0.65
	},
	{
		name = "speed",
		label = "Speed\速度",
		hover = "more value more ab sped\n阿比盖尔的总体移速为多少，原版是5，这是总体数值，不算上步行速度和奔跑速度。",
		options ={	
		
					{description = "3", data = 3},
					{description = "5", data = 5},
					{description = "8", data = 8},
					{description = "10", data = 10},
					{description = "15", data = 15},
					{description = "20", data = 20},
				},
		default = 5
	},
	{
		name = "second_damge",
		label = "Second damage\每秒造成伤害",
		hover = "more value more ab sec-damg\n阿比盖尔每秒对敌人造成多少伤害，原版是20，这是默认的伤害，未累计时段伤害。",
		options ={	
		
					{description = "15", data = 15},
					{description = "20", data = 20},
					{description = "25", data = 25},
					{description = "32", data = 32},
					{description = "45", data = 45},
					{description = "60", data = 60},
					{description = "70", data = 70},
					{description = "100", data = 100},
					{description = "150", data = 150},
					{description = "200", data = 200},
					{description = "250", data = 250},
					{description = "300", data = 300},
				},
		default = 60
	},
	{
		name = "damage_player_percent",
		label = "Damage player percent\对玩家伤害百分比",
		hover = "ab-damg x this setting for player damage\n原版是0.25，意思是阿比盖尔打玩家的伤害是阿比盖尔的伤害*0.25。",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 5},
					{description = "0.75", data = 0.75},
					{description = "1", data = 1},
					{description = "2", data = 2},
				},
		default = 0.25
	},
	{
		name = "time_to_level_up",
		label = "Upgrade time\升级时间",
		hover = "how long day to update?\n这里设置阿比盖尔多少天升一级，原版是一天，有四花的骨灰盒缩短为4分之一。",
		options ={	
	
					{description = "0.25", data = 120},
					{description = "0.5", data = 240},
					{description = "0.75", data = 360},
					{description = "1", data = 480},
					{description = "2", data = 960},
					{description = "3", data = 1440},
					{description = "4", data = 1920},
					{description = "5", data = 2400},
					{description = "7.5", data = 3600},
					{description = "10", data = 4800},
				},
		default = 960
	},
	{
		name = "time_mult",
		label = "Upgrade rate\升级速率",
		hover = "Bone ash upgrade rate.orginal is 4.more value less time\n原版是4，装满4花的阿比盖尔骨灰盒升级时间只需原本时间的四分之一；也就是原版的四分之一天。",
		options ={	
	
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.75", data = 0.75},
					{description = "1", data = 1},
					{description = "2", data = 2},
					{description = "3", data = 3},
					{description = "4", data = 4},
					{description = "5", data = 5},
					{description = "7.5", data = 7.5},
					{description = "10", data = 10},
				},
		default = 2
	},
	{
		name = "damage_period",
		label = "Damage interval\伤害间隔",
		hover = "Attack speed(sec)\n设置阿比盖尔每隔几秒钟打一下，原版是1.5。",
		options ={	
	
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.75", data = 0.75},
					{description = "1", data = 1},
					{description = "1.5", data = 1.5},
					{description = "2", data = 2},
					{description = "3", data = 3},
					{description = "4", data = 4},
					{description = "5", data = 5},
					{description = "7.5", data = 7.5},
					{description = "10", data = 10},
				},
		default = 2
	},
	{
        name = "ab_d_part",
		label = "Different Attack count\攻击计算分类",
        hover = "Calculate time slot damage or day-dusk-night time damg\n不启用：阿比盖尔计算时段伤害;启用：阿比盖尔分开计算白天黄昏夜晚的伤害，都是倍数相乘。",
       
        options = {
            {description = "启用(Open)", data = 1},
            {description = "不启用", data = 0}
        },
        default = 0
    },
	{
		name = "timedamage",
		label = "Period damage\时段伤害",
		hover = "Day 15, dusk 25, night 40.its multiple\n白天15，黄昏25，夜晚40；原版的数值。如果数值为2，则乘以2原版的数值。",
		options ={	
		
					{description = "0.7", data = 0.7},
					{description = "1", data = 1},
					{description = "1.3", data = 1.3},
					{description = "1.7", data = 1.7},
					{description = "2", data = 2},
					{description = "3", data = 3},
				},
		default = 1
	},
	{
		name = "daydamage",
		label = "Day Damage Multiply\白天伤害倍数",
		hover = "multiple\n时段伤害设置为2，倍数是2，白天伤害倍数为2，就是15x2",
		options ={	
		            {description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.75", data = 0.75},
					{description = "1", data = 1},
					{description = "1.15", data = 1.15},
					{description = "1.5", data = 1.5},
					{description = "2", data = 2},
					{description = "3", data = 3},
					{description = "4", data = 4},
					{description = "5", data = 5},
					{description = "7.5", data = 7.5},
					{description = "10", data = 10},
				},
		default = 1
	},
	{
		name = "duskdamage",
		label = "Dusk Damage Multiply\黄昏伤害倍数",
		hover = "multiple\n时段伤害设置为2，倍数是2，黄昏伤害倍数为2，就是15x2",
		options ={	
		            {description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.75", data = 0.75},
					{description = "1", data = 1},
					{description = "1.15", data = 1.15},
					{description = "1.5", data = 1.5},
					{description = "2", data = 2},
					{description = "3", data = 3},
					{description = "4", data = 4},
					{description = "5", data = 5},
					{description = "7.5", data = 7.5},
					{description = "10", data = 10},
				},
		default = 1
	},
	{
		name = "nightdamage",
		label = "Night Damage Multiply\夜晚伤害倍数",
		hover = "multiple\n时段伤害设置为2，倍数是2，夜晚伤害倍数为2，就是15x2",
		options ={	
		            {description = "0.5", data = 0.5},
					{description = "0.75", data = 0.75},
					{description = "1", data = 1},
					{description = "1.15", data = 1.15},
					{description = "1.5", data = 1.5},
					{description = "2", data = 2},
					{description = "3", data = 3},
					{description = "4", data = 4},
					{description = "5", data = 5},
					{description = "7.5", data = 7.5},
					{description = "10", data = 10},
				},
		default = 1
	},
	{
		name = "攻击范围",
		label = "Attack Range\攻击范围",
		hover = "orginal 4\n阿比盖尔AOE范围，原版是4",
		options ={	
		
					{description = "1", data = 1},
					{description = "2", data = 2},
					{description = "4", data = 4},
					{description = "6", data = 6},
					{description = "8", data = 8},
					{description = "10", data = 10},
				},
		default = 6
	},
	{
		name = "回血量",
		label = "hpr\回血量",
		hover = "orginal 1\n阿比盖尔一次回多少血，原版是1",
		options ={	
		
					{description = "1", data = 1},
					{description = "2", data = 2},
					{description = "4", data = 4},
					{description = "6", data = 6},
					{description = "8", data = 8},
					{description = "10", data = 10},
					{description = "15", data = 15},
					{description = "25", data = 25},
					{description = "30", data = 30},
					{description = "50", data = 50},
					{description = "80", data = 80},
					{description = "100", data = 100},
				},
		default = 30
	},
	{
        name = "attackshadow",
		label = "Attack Shadow\攻击影怪",
        hover = "阿比盖尔现在可以攻击影怪的选项",
       
        options = {
            {description = "启用(Open)", data = true},
            {description = "不启用", data = false},
        },
        default = true
    },
	{
        name = "death_to_lv1",
		label = "Death to Lv.1\死亡掉级",
        hover = "启用的话阿比盖尔死亡掉到1级！",
       
        options = {
            {description = "启用(Open)，回到花朵", data = 1},
            {description = "不启用，回到花朵", data = 0}, 
			{description = "启用，留在原地", data = 2}, 
			{description = "不启用，留在原地", data = -1}, 
        },
        default = 0
    },
	{
        name = "abigail_taunt",
		label = "Taunt switch\嘲讽",
        hover = "阿比盖尔可以嘲讽敌人，让敌人朝自己攻击",
       
        options = {
            {description = "启用(Open)", data = true},
            {description = "不启用", data = false},
        },
        default = true
    },
	{
		name = "abigail_taunt_aura",
		label = "Taunt Aura\嘲讽范围",
		hover = "orginal 15\n设置嘲讽范围，原版是15",
		options ={	
		
					{description = "1", data = 1},
					{description = "2", data = 2},
					{description = "4", data = 4},
					{description = "6", data = 6},
					{description = "8", data = 8},
					{description = "10", data = 10},
					{description = "15", data = 15},
					{description = "25", data = 25},
					{description = "30", data = 30},
					{description = "50", data = 50},
					{description = "80", data = 80},
					{description = "100", data = 100},
				},
		default = 25
	},
	{
		name = "ab_def_p",
		label = "Defense percent\防御百分比",
		hover = "0.4 is 40% healt and 80% damag; 0.6 is 60% health and 70% damage\n设置防御力，1是原版50%抵伤；0是无敌；0.4是40%血80%抵伤；0.6是60%血70%抵伤",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.1", data = 0.1},
					{description = "0.2", data = 0.2},
					{description = "0.3", data = 0.3},
					{description = "0.4", data = 0.4},
					{description = "0.5", data = 0.5},
					{description = "0.6", data = 0.6},
					{description = "0.7", data = 0.7},
					{description = "0.8", data = 0.8},
					{description = "0.9", data = 0.9},
					{description = "1", data = 1},
				},
		default = 1
	},
	{
		name = "summonkey",
		label = "Summon Keybind\ 召唤键",
		hover = "Summon or return Abigail with...U\n快捷键召唤和收回阿比盖尔",
		options = {
			--fill later
		},
		default = "X",
	},
	{
		name = "commandkey",
		label = "Command Keybind\ 命令键",
		hover = "Rile up or soothe Abigail with...U\n快捷键激怒和平息阿比盖尔",
		options = {
			--fill later
		},
		default = "R",
	},
	{
		name = "defensive_max_chase_time",
		label = "Def max chase time\防御最大追逐时间",
		hover = "denfence time\n原版是3，阿比盖尔在防御状态下追你的时间",
		options ={	
		
					{description = "3", data = 3},
					{description = "5", data = 5},
					{description = "7", data = 7},
					{description = "10", data = 10},
					{description = "15", data = 15},
					{description = "20", data = 20},
					{description = "30", data = 30},
					{description = "50", data = 50},
				},
		default = 3
	},
	{
		name = "agrresive_max_chase_time",
		label = "Agr max chase time\进攻最大追逐时间",
		hover = "agrresive time\n原版是6，阿比盖尔在愤怒状态下追你的时间",
		options ={	
		              
					{description = "3", data = 3},
					{description = "6", data = 6},
					{description = "7", data = 7},
					{description = "10", data = 10},
					{description = "15", data = 15},
					{description = "20", data = 20},
					{description = "30", data = 30},
					{description = "50", data = 50},
				},
		default = 6
	},
	{
		name = "forcefield",
		label = "forcefield absolution\范围立场吸收值",
		hover = "Protective cover\n AOE范围立场吸收值，原版是1",
		options ={	
		
					{description = "0.6", data = 0.6},
					{description = "1", data = 1},
					{description = "2", data = 2},
					{description = "4", data = 4},
					{description = "6", data = 6},
					{description = "8", data = 8},
					{description = "10", data = 10},
				},
		default = 1
	},
	{
		name = "vex_duration",
		label = "duration\持久度",
		hover = "阿比盖尔的持久度，原版是2",
		options ={	
		
					{description = "0.6", data = 0.6},
					{description = "1", data = 1},
					{description = "2", data = 2},
					{description = "4", data = 4},
					{description = "6", data = 6},
					{description = "8", data = 8},
					{description = "10", data = 10},
				},
		default = 2
	},
	{
		name = "vex_damage_mod",
		label = "mod damage \伤害生物的倍率数",
		hover = "multiple\n伤害生物的倍率数，原版是1.1",
		options ={	
		
					{description = "0.6", data = 0.6},
					{description = "1.1", data = 1.1},
					{description = "2", data = 2},
					{description = "4", data = 4},
					{description = "6", data = 6},
					{description = "8", data = 8},
					{description = "10", data = 10},
				},
		default = 1.1
	},
	{
		name = "vex_ghoskyfriend_damage_mod",
		label = "ghoskyfriend damage \伤害鬼魂生物的倍率数",
		hover = "multiple\n伤害鬼魂生物的倍率数，原版是1.4",
		options ={	
		
					{description = "0.6", data = 0.6},
					{description = "1.4", data = 1.4},
					{description = "2", data = 2},
					{description = "4", data = 4},
					{description = "6", data = 6},
					{description = "8", data = 8},
					{description = "10", data = 10},
				},
		default = 1.4
	},
	{
		name = "flower_decay_time",
		label = "Flower decay\花朵延迟时间？",
		hover = "its time\n原版是3天",
		options ={	
		
					{description = "0.125天", data = 60},
					{description = "0.25天", data = 120},
					{description = "0.5天", data = 240},
					{description = "1天", data = 480},
					{description = "2天", data = 960},
					{description = "3天", data = 1440},
					{description = "5天", data = 2400},
				},
		default = 1440
	},
	{
		name = "flower_prox_dist",
		label = "Flower prox-dist\花朵延迟距离？",
		hover = "decay distance\n原版是6x6",
		options ={	
		
					{description = "6*1", data = 3},
					{description = "6*2", data = 1},
					{description = "6*3", data = 2},
					{description = "6*4", data = 4},
					{description = "6*5", data = 5},
					{description = "6*6", data = 6},
					{description = "6*7", data = 7},
					{description = "6*8", data = 8},
					{description = "6*9", data = 9},
				},
		default = 6
	},--新增的
	{
		name = "SLOWREGEN_TICK_TIME",--o1
		label = "SLOWREGEN_TICK_TIME",
		hover = " 王者补药回血速度 medicine\n Orginal is 1",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
					{description = "1.2", data = 1.2},
					{description = "1.4", data = 1.4},
					{description = "1.6", data = 1.6},
					{description = "1.8", data = 1.8},
					{description = "2.0", data = 2.0},
					{description = "2.5", data = 2.5},
					{description = "3", data = 3},

				},
		default = 1.6
	},
	{
		name = "SLOWREGEN_HEALING",--o2
		label = "SLOWREGEN_HEALING",
		hover = " 王者补药一次回血量 medicine\n Orginal is 2",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
					{description = "1.2", data = 1.2},
					{description = "1.4", data = 1.4},
					{description = "1.6", data = 1.6},
					{description = "1.8", data = 1.8},
					{description = "2.0", data = 2.0},
					{description = "2.5", data = 2.5},
					{description = "3.0", data = 3.0},
					{description = "5.0", data = 5.0},

				},
		default = 3
	},
	{
		name = "SLOWREGEN_DURATION",--o480
		label = "SLOWREGEN_DURATION",
		hover = " 王者补药回血时间 medicine\n Orginal is 480",
		options ={	
		
					{description = "480一天", data = 480},
					{description = "960", data = 960},
					{description = "1920", data = 1920},
					{description = "3840", data = 3840},

				},
		default = 960
	},
	{
		name = "FASTREGEN_TICK_TIME",--o1
		label = "FASTREGEN_TICK_TIME",
		hover = " 灵魂万能药回血速度 medicine\n Orginal is 1",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
					{description = "1.2", data = 1.2},
					{description = "1.4", data = 1.4},
					{description = "1.6", data = 1.6},
					{description = "1.8", data = 1.8},
					{description = "2.0", data = 2.0},
					{description = "2.5", data = 2.5},
					{description = "3.0", data = 3.0},

				},
		default = 1.6
	},
	{
		name = "FASTREGEN_HEALING",--o20
		label = "FASTREGEN_HEALING",
		hover = " 灵魂万能药一次回血量 medicine\n Orginal is 20",
		options ={	
		
					{description = "20", data = 20},
					{description = "40", data = 40},
					{description = "70", data = 70},
					{description = "100", data = 100},

				},
		default = 40
	},
	{
		name = "FASTREGEN_DURATION",--o30
		label = "FASTREGEN_DURATION",
		hover = " 灵魂万能药回血时间 medicine\n Orginal is 30",
		options ={	
		
					{description = "30", data = 30},
					{description = "50", data = 50},
					{description = "100", data = 100},
					{description = "150", data = 150},
				},
		default = 50
	},
	{
		name = "DAMAGE_DURATION",--o480
		label = "DAMAGE_DURATION\夜影万金油时间",
		hover = " medicine\n Orginal is 480",
		options ={	
		
					{description = "480一天", data = 480},
					{description = "960两天", data = 960},
					{description = "1920", data = 1920},
					{description = "3840", data = 3840},

				},
		default = 960
	},
	{
		name = "SPEED_DURATION",--o480
		label = "SPEED_DURATION\强健筋油时间",
		hover = " medicine\n Orginal is 480",
		options ={	
		
					{description = "480一天", data = 480},
					{description = "960两天", data = 960},
					{description = "1920", data = 1920},
					{description = "3840", data = 3840},

				},
		default = 960
	},
	{
		name = "SPEED_LOCO_MULT",--o1.75
		label = "SPEED_LOCO_MULT",
		hover = " 强健筋油药效 medicine\n Orginal is 1.75",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
					{description = "1.2", data = 1.2},
					{description = "1.4", data = 1.4},
					{description = "1.6", data = 1.6},
					{description = "1.75", data = 1.75},
					{description = "1.8", data = 1.8},
					{description = "2.0", data = 2.0},
					{description = "2.5", data = 2.5},
					{description = "3", data = 3},
				},
		default = 1.75
	},
	{
		name = "SHIELD_DURATION",--o480
		label = "SHIELD_DURATION",
		hover = " 保护罩药水持久度 medicine\n Orginal is 480",
		options ={	
		
					{description = "480一天", data = 480},
					{description = "960两天", data = 960},

				},
		default = 480
	},
	{
		name = "RETALIATION_DURATION",--o480
		label = "RETALIATION_DURATION",
		hover = " 反伤药水持久度 medicine\n Orginal is 480",
		options ={	
		
					{description = "480一天", data = 480},
					{description = "960两天", data = 960},

				},
		default = 480
	},
	{
		name = "SPEED_PLAYER_GHOST_DURATION",--o3
		label = "SPEED_PLAYER_GHOST_DURATION",
		hover = " 强健精油药效持久度 medicine\n Orginal is 3",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
					{description = "1.2", data = 1.2},
					{description = "1.4", data = 1.4},
					{description = "1.6", data = 1.6},
					{description = "1.8", data = 1.8},
					{description = "2.0", data = 2},
					{description = "3.0", data = 3},
					{description = "4.0", data = 4},
					{description = "5.0", data = 5},
					{description = "8.0", data = 8},
					{description = "10.0", data = 10},

				},
		default = 3
	},
	{
		name = "AURA_TICKPERIOD",--o3
		label = "AURA_TICKPERIOD",
		hover = " 范围恢复时段，原版是3\n Orginal is 3",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
					{description = "1.2", data = 1.2},
					{description = "1.4", data = 1.4},
					{description = "1.6", data = 1.6},
					{description = "1.8", data = 1.8},
					{description = "2.0", data = 2},
					{description = "3.0", data = 3},
					{description = "4.0", data = 4},
					{description = "5.0", data = 5},
					{description = "8.0", data = 8},
					{description = "10.0", data = 10},

				},
		default = 3
	},
	{
		name = "ABIGAI_HEALTH_REGEN_TIME",--o3
		label = "ABIGAI_HEALTH_REGEN_TIME",
		hover = " 单次回血恢复时间，原版是3\n Orginal is 3",
		options ={	
		
					{description = "0", data = 0},
					{description = "0.25", data = 0.25},
					{description = "0.5", data = 0.5},
					{description = "0.65", data = 0.65},
					{description = "0.8", data = 0.8},
					{description = "1", data = 1},
					{description = "1.2", data = 1.2},
					{description = "1.4", data = 1.4},
					{description = "1.6", data = 1.6},
					{description = "1.8", data = 1.8},
					{description = "2.0", data = 2},
					{description = "3.0", data = 3},
					{description = "4.0", data = 4},
					{description = "5.0", data = 5},
					{description = "8.0", data = 8},
					{description = "10.0", data = 10},

				},
		default = 3
	},




	
}

local function filltable(tbl) --感谢作者Electroely在Abigail Keybind的代码！祝你生活愉快！
	for i=1, #keys do
		tbl[i] = {description = keys[i], data = keys[i]}
	end
end
filltable(configuration_options[24].options)
filltable(configuration_options[25].options)





