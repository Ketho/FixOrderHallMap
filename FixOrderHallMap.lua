-- License: Public Domain

local t = {
	[23] = function() return select(4, GetMapInfo()) end, -- Paladin, Sanctum of Light; Eastern Plaguelands
	[1040] = function() return true end, -- Priest, Netherlight Temple; Azeroth
	[1044] = function() return true end, -- Monk, Temple of Five Dawns; none
}

local OnClick = WorldMapZoomOutButton_OnClick

function WorldMapZoomOutButton_OnClick()
	local id = t[GetCurrentMapAreaID()]
	if id and id() then
		SetMapByID(1007) -- Broken Isles
	else
		OnClick()
	end
end
