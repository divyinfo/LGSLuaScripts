profile = 0;
profileCount = 4;
profileLocation = "G:\\Work\\LGSLuaMouseScripts\\profiles\\";
profileFuncPrefix = "listener";

function OnEvent(event, arg, family)

	if family == "mouse" and (event == "MOUSE_BUTTON_PRESSED" or event == "MOUSE_BUTTON_RELEASED") and arg == 2 then return nil; end

	OutputLogMessage("--" .. "\n");
	OutputLogMessage(event .. "\n");
	OutputLogMessage("--" .. "\n");

	local eventPart = {};
	local currentMState = GetMKeyState();

	if event == "MOUSE_BUTTON_PRESSED" then table.insert(eventPart, "_m_b_p");
	elseif event == "MOUSE_BUTTON_RELEASED" then table.insert(eventPart, "_m_b_r");
	elseif event == "G_PRESSED" then table.insert(eventPart, "_g_p");
	elseif event == "G_RELEASED" then table.insert(eventPart, "_g_r");
	elseif event == "M_PRESSED" then table.insert(eventPart, "_m_p");
	elseif event == "M_RELEASED" then table.insert(eventPart, "_m_r");
	end

	table.insert(eventPart, "_" .. string.lower(event));
	table.insert(eventPart, "_" .. event);

	-- Second exp only gets executed ONCE, so no extra var declared
	for eventIndex = 1, table.getn(eventPart) do
		local pos = eventIndex * 2 - 1;
		table.insert(eventPart, pos, "_m" .. currentMState .. eventPart[pos]);
	end

	local argPart = {"_" .. arg};
	if family == "mouse" then
		if false then
		elseif arg == 7 then argPart = {"_" .. arg, "_far_upper", "_far_top", "_1st_upper", "_1st_top", "_1_upper", "_1_top"};
		elseif arg == 4 then argPart = {"_" .. arg, "_far_lower", "_far_bot", "_1st_lower", "_1st_bot", "_1_lower", "_1_bot"};
		elseif arg == 8 then argPart = {"_" .. arg, "_mid_upper", "_mid_top", "_2nd_upper", "_2nd_top", "_2_upper", "_2_top"};
		elseif arg == 5 then argPart = {"_" .. arg, "_mid_lower", "_mid_bot", "_2nd_lower", "_2nd_bot", "_2_lower", "_2_bot"};
		elseif arg == 9 then argPart = {"_" .. arg, "_near_upper", "_near_top", "_3rd_upper", "_3rd_top", "_3_upper", "_3_top"};
		elseif arg == 6 then argPart = {"_" .. arg, "_near_lower", "_near_bot", "_3rd_lower", "_3rd_bot", "_3_lower", "_3_bot"}; end
	end

	for argIndex = 1, table.getn(argPart) do
		for eventIndex = 1, table.getn(eventPart) do

			local funcName = profileFuncPrefix .. eventPart[eventIndex] .. argPart[argIndex];
			local execStr = "";

			execStr = execStr .. "if " .. funcName .. " ~= nil then" .. "\n";
			execStr = execStr .. "OutputLogMessage(\"function " .. funcName .. " found\\n\");" .. "\n";
			execStr = execStr .. "return " .. funcName .. "\n";
			execStr = execStr .. "else" .. "\n";
			execStr = execStr .. "OutputLogMessage(\"NOT FOUND: " .. funcName .. "\\n\");" .. "\n";
			execStr = execStr .. "return nil" .. "\n";
			execStr = execStr .. "end" .. "\n";

			local f = loadstring(execStr)();

			if f ~= nil then
				f(event, arg)

				OutputLogMessage("--" .. "\n");
				return nil
			end


			-- if load(funcName) ~= nil do
				-- OutputLogMessage("%s\n", funcName)
			-- else
				-- OutputLogMessage("funcName %s NOT existing", funcName)
			-- end
		end
	end

	OutputLogMessage("--" .. "\n");
end

function loadProfile(p)
	local profileFileName = "profile_" .. (p ~= nil and p or "general");

	local profilePath = profileLocation..profileFileName..".lua";
	local profileFile = nil;

	if pcall(function () profileFile = dofile(profilePath) end) then
		OutputLogMessage("    " .. "loaded profile:" .. profileFileName .. ", location: " .. profileLocation .. "\n");
		return true
	else
		OutputLogMessage("    " .. profilePath .. " ... Error - File Not Found\n");
		return false
	end

end

loadProfile()