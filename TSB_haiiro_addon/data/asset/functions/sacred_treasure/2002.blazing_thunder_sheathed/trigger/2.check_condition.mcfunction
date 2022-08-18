#> asset:sacred_treasure/2002.blazing_thunder_sheathed/trigger/2.check_condition
#
# 神器の発動条件をチェックします
#
# @within function asset:sacred_treasure/2002.blazing_thunder_sheathed/trigger/1.trigger

# 神器の基本的な条件の確認を行うfunction、成功している場合CanUsedタグが付く
    function asset:sacred_treasure/common/check_condition/mainhand
# 他にアイテム等確認する場合はここに書く

# CanUsedタグをチェックして3.main.mcfunctionを実行する
    execute if entity @s[tag=CanUsed,predicate=lib:is_sneaking] unless score @s 1JM.CoolTime matches 1.. run function asset:sacred_treasure/2002.blazing_thunder_sheathed/trigger/3.main
    execute if entity @s[tag=CanUsed,tag=!1JM.InCooldown,predicate=lib:is_sneaking] if score @s 1JM.CoolTime matches 1.. run tellraw @s [{"text":"手が痺れている...","color":"red"}]
    execute if entity @s[tag=CanUsed,predicate=lib:is_sneaking] if score @s 1JM.CoolTime matches 1.. run tag @s add 1JM.InCooldown