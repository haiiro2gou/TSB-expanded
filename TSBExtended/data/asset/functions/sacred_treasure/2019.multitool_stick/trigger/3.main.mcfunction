#> asset:sacred_treasure/2019.multitool_stick/trigger/3.main
#
# 神器のメイン処理部
#
# @within function asset:sacred_treasure/2019.multitool_stick/trigger/2.check_condition

# 基本的な使用時の処理(MP消費や使用回数の処理など)を行う
    function asset:sacred_treasure/common/use/mainhand

# scoreboard処理
#define score_holder $10per
    execute store result score $10per Temporary run scoreboard players get @s 1K3.Tick
    scoreboard players operation $10per Temporary %= $10 Const
    execute if score $10per Temporary matches 1.. run function asset:sacred_treasure/2019.multitool_stick/trigger/add_mp
    scoreboard players reset $10per Temporary

# メイン処理


# ループ点火
    execute unless score @s 1K3.Tick matches 1.. run clear @s charcoal 1
    execute unless score @s 1K3.Tick matches 1.. run scoreboard players set @s 1K3.Tick 1600
    schedule function asset:sacred_treasure/2019.multitool_stick/trigger/schedule_loop 1t replace
