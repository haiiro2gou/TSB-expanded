#> asset:sacred_treasure/2002.blazing_thunder_sheathed/trigger/iai/
#
# 居合切りの処理
#
# @within function asset:sacred_treasure/2002.blazing_thunder_sheathed/trigger/schedule_loop

# 移動処理
    execute if score @s 1JM.IaiTime matches 3 run function asset:sacred_treasure/2002.blazing_thunder_sheathed/trigger/iai/1.summon
    tag @s add 1JM.Owner
    function asset:sacred_treasure/2002.blazing_thunder_sheathed/trigger/iai/3.teleport

# 演出
    function asset:sacred_treasure/2002.blazing_thunder_sheathed/trigger/iai/3.1.particle

# 攻撃処理
    # 1段目
        # 与ダメージ
            data modify storage lib: Argument.Damage set value 400.0f
        # 属性
            data modify storage lib: Argument.AttackType set value "Physical"
            data modify storage lib: Argument.ElementType set value "None"
        # ダメージ
            function lib:damage/modifier
            execute as @e[type=#lib:living,tag=Enemy,tag=!Uninterferable,distance=..2] positioned ^ ^ ^ run function lib:damage/
    # 2段目
        # 801を定義
            scoreboard players set $801 Temporary 801
        # 乱数を取得
            execute store result score $RandomDamage Temporary run function lib:random/
            scoreboard players operation $RandomDamage Temporary %= $801 Temporary
        # 与ダメージ
            scoreboard players add $RandomDamage Temporary 0
            execute store result storage lib: Argument.Damage int 1 run scoreboard players get $RandomDamage Temporary
        # 属性
            data modify storage lib: Argument.AttackType set value "Physical"
            data modify storage lib: Argument.ElementType set value "Thunder"
        # ダメージ
            function lib:damage/modifier_continuation
            execute as @e[type=#lib:living,tag=Enemy,tag=!Uninterferable,distance=..5] positioned ^ ^ ^ run function lib:damage/

# リセット
    tag @s remove 1JM.Owner
    scoreboard players reset $801 Temporary
    scoreboard players reset $RandomDamage Temporary
    function lib:damage/reset