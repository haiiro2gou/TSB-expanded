#> asset:sacred_treasure/2032.carrot_magica_dark/trigger/attack/melee/3.main
#
# 神器のメイン処理部
#
# @within function asset:sacred_treasure/2032.carrot_magica_dark/trigger/attack/melee/2.check_condition

# 基本的な使用時の処理(MP消費や使用回数の処理など)を行う
    function asset:sacred_treasure/common/use/mainhand

# ここから先は神器側の効果の処理を書く

#> private
# @private
    #define score_holder $RandomDamage

# 演出

# ダメージ
    # 乱数
        execute store result score $RandomDamage Temporary run function lib:random/
        scoreboard players operation $RandomDamage Temporary %= $13 Const
        scoreboard players add $RandomDamage Temporary 40
    # 数値を代入
        execute store result storage api: Argument.Damage float 1.0 run scoreboard players get $RandomDamage Temporary
    # 属性
        data modify storage api: Argument.AttackType set value "Physical"
        data modify storage api: Argument.ElementType set value "None"
    # 防御貫通
        data modify storage api: Argument.FixedDamage set value true
    # 補正
        function api:damage/modifier
    # 処理
        execute as @e[type=#lib:living,type=!player,tag=Victim,distance=..6] run function api:damage/
    # リセット
        scoreboard players reset $RandomDamage Temporary
        function api:damage/reset