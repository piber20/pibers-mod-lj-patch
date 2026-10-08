if not REPENTOGON then
	print("Desecration+Last Judgement patch needs Repentogon to function.")
	return
end

DesecrationLJPatch = RegisterMod("Desecration+Last Judgement", 1)

function DesecrationLJPatch:onStillbornUpdate(npc)
	if npc.Variant == LastJudgement.ENT.Stillborn.Var then
		if Isaac.GetCurrentStageConfigId() == StbType.CORPSE and Game():GetRoom():GetBackdropType() == BackdropType.CORPSE2 and Desecration then
			local data = Desecration.GetData(npc)
			if not data.ReplacedSprite then
				npc:ReplaceSpritesheet(0, "gfx/enemies/stillborn/monster_stillborn_corpse2.png", false)
				npc:ReplaceSpritesheet(1, "gfx/enemies/stillborn/monster_stillborn_corpse2.png", false)
				npc:ReplaceSpritesheet(2, "gfx/enemies/stillborn/monster_stillborn_corpse2.png", false)
				npc:ReplaceSpritesheet(3, "gfx/enemies/stillborn/monster_stillborn_corpse2.png", true)
				data.ReplacedSprite = true
			end
		end
	end
end

function DesecrationLJPatch:OnModsLoaded()
	local modsGood = true
	if not Desecration then
		print("Desecration+Last Judgement patch is enabled without Desecration")
		modsGood = false
	end
	if not LastJudgement then
		print("Desecration+Last Judgement patch is enabled without Last Judgement...")
		modsGood = false
	end

	if modsGood then
		DesecrationLJPatch:AddCallback(ModCallbacks.MC_NPC_UPDATE, DesecrationLJPatch.onStillbornUpdate, LastJudgement.ENT.Stillborn.ID)
		print("Desecration+Last Judgement patch finished loading")
	end
end
DesecrationLJPatch:AddCallback(ModCallbacks.MC_POST_MODS_LOADED, DesecrationLJPatch.OnModsLoaded)
