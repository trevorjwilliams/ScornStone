local targetName = "Scorned"
local soulStone = 20707
local darkIntent = 109773 -- For debugging
local funItem = "Seafarer's Slidewhistle"

function ScornStone(self, event, ...) 
	if (
		event == "COMBAT_LOG_EVENT_UNFILTERED"
	) then

		DidScornedDie(self, event, ...)
	end

	local unit, name, rank, lineid, spellid = ...;
	if (
		unit == "player"
		and spellid == darkIntent
	) then

		SendChatMessage(targetName .. ", I believe in you.");
		UseItemByName(funItem);
	end
end

function DidScornedDie(self, event, ...)
	local timestamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName = ...;

	if (
		combatEvent == "UNIT_DIED"
		and destName == targetName
	) then

		SendChatMessage(targetName .. ", I'm not angry, just disappointed.");
	end
end