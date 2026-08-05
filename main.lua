if not REPENTOGON then
	print("piber mod last judgement patch need repentogon :(")
	return
end

PibersModLJPatch = RegisterMod("Piber's Mod", 1)

function PibersModLJPatch:onStillbornUpdate(npc)
	if npc.Variant == LastJudgement.ENT.Stillborn.Var then
		if Isaac.GetCurrentStageConfigId() == StbType.CORPSE and Game():GetRoom():GetBackdropType() == BackdropType.CORPSE2 then
			local data = PibersMod.GetData(npc)
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

function PibersModLJPatch:OnModsLoaded()
	local modsGood = true
	if not PibersMod then
		print("piber mod last judgement patch missing piber mod :(")
		modsGood = false
	end
	if not LastJudgement then
		print("piber mod last judgement patch missing last judgement :(")
		modsGood = false
	end

	if modsGood then
		PibersModLJPatch:AddCallback(ModCallbacks.MC_NPC_UPDATE, PibersModLJPatch.onStillbornUpdate, LastJudgement.ENT.Stillborn.ID)
		print("piber mod last judgement patch loaded correctly :)")
	end
end
PibersModLJPatch:AddCallback(ModCallbacks.MC_POST_MODS_LOADED, PibersModLJPatch.OnModsLoaded)
