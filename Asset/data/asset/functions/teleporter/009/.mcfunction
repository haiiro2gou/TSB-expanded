#> asset:teleporter/009/
#
# テレポーターの位置の登録チェック
#
# @within tag/function asset:teleporter/register

execute unless data storage asset:teleporter DPR[{D:overworld,X:4,Y:19,Z:81}] in overworld positioned 4 19 81 if entity @p[distance=..40] run function asset:teleporter/009/register