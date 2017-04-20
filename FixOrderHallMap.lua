-- License: Public Domain

local t = {
	[23] = function() return select(4, GetMapInfo()) and 1007 end, -- Paladin, Sanctum of Light; Eastern Plaguelands
	[1040] = function() return 1007 end, -- Priest, Netherlight Temple; Azeroth
	[1044] = function() return 1007 end, -- Monk, Temple of Five Dawns; none
	[1048] = function() return 1007 end, -- Druid, Emerald Dreamway; none
	[1052] = function() return GetCurrentMapDungeonLevel() > 1 and 1007 end, -- Demon Hunter, Fel Hammer; Mardum
	[1088] = function() return GetCurrentMapDungeonLevel() == 3 and 1033 end, -- Nighthold -> Suramar
}

local OnClick = WorldMapZoomOutButton_OnClick

function WorldMapZoomOutButton_OnClick()
	local id = t[GetCurrentMapAreaID()]
	local out = id and id()
	if out then
		SetMapByID(out)
	else
		OnClick()
	end
end
