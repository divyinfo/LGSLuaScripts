profile = 0
profileCount = 4
profileLocation = "G:\\Work\\LGSLuaMouseScripts\\profiles\\"
profileFuncPrefix = "listener_"

function OnEvent(event, arg)

	local argPart = {arg};
	if false then
	elseif arg == 7 then argPart = {arg, "far_upper", "far_top", "1st_upper", "1st_top", "1_upper", "1_top"};
	elseif arg == 4 then argPart = {arg, "far_lower", "far_bot", "1st_lower", "1st_bot", "1_lower", "1_bot"};
	elseif arg == 8 then argPart = {arg, "mid_upper", "mid_top", "2nd_upper", "2nd_top", "2_upper", "2_top"};
	elseif arg == 5 then argPart = {arg, "mid_lower", "mid_bot", "2nd_lower", "2nd_bot", "2_lower", "2_bot"};
	elseif arg == 9 then argPart = {arg, "near_upper", "near_top", "3rd_upper", "3rd_top", "3_upper", "3_top"};
	elseif arg == 6 then argPart = {arg, "near_lower", "near_bot", "3rd_lower", "3rd_bot", "3_lower", "3_bot"}; end

	local eventPart = {event == "MOUSE_BUTTON_PRESSED" and "_mp" or "_mr", "_" .. string.lower(event), "_" .. event, ""};


	for argIndex = 1, table.getn(argPart) do
		for eventIndex = 1, table.getn(eventPart) do

			local funcName = profileFuncPrefix .. argPart[argIndex] .. eventPart[eventIndex];
			local execStr = "";

			execStr = execStr .. "if " .. funcName .. " ~= nil then" .. "\n";
			execStr = execStr .. "OutputLogMessage(\"function " .. funcName .. " found\\n\");" .. "\n";
			execStr = execStr .. "return " .. funcName .. "\n";
			execStr = execStr .. "else" .. "\n";
			execStr = execStr .. "return nil" .. "\n";
			execStr = execStr .. "end" .. "\n";

			local f = loadstring(execStr)();

			if f ~= nil then
				f(event, arg)
				return nil
			end


			-- if load(funcName) ~= nil do
				-- OutputLogMessage("%s\n", funcName)
			-- else
				-- OutputLogMessage("funcName %s NOT existing", funcName)
			-- end
		end
	end
end

function loadProfile(p)
    local profileFileName = "profile_" .. (p ~= nil and p or "general");

    local profilePath = profileLocation..profileFileName..".lua";
    local profileFile = nil;

    if pcall(function () profileFile = dofile(profilePath) end) then
    	OutputLogMessage("loaded " .. profileFileName .. " profile\n");
    	return true
    else
        OutputLogMessage(profilePath .. " ... Error - File Not Found\n");
        return false
    end

end

loadProfile()