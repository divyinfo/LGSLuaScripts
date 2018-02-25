profile = 0;
profileCount = 4;
profileLocation = "C:\\lgs\\profiles\\";
profileFuncPrefix = "listener";
l = {};

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
	
	local topAliases = {"top", "up", "upper"};
	local botAliases = {"bot", "down", "lower"};
	local farAliases = {"far", "f", "1", "1st", "first"};
	local midAliases = {"mid", "m", "2", "2nd", "second"};
	local nearAliases = {"near", "n", "3", "3rd", "third"};

	local argPart = {"_" .. arg};
	if family == "mouse" then

		local distTable = {};
		if arg == 7 or arg == 4 then
			distTable = farAliases;
		elseif arg == 8 or arg == 5 then
			distTable = midAliases;
		elseif arg == 9 or arg == 6 then
			distTable = nearAliases;
		end

		local heightTable = {};
		if arg == 4 or arg == 5 or arg == 6 then
			heightTable = topAliases;
		elseif arg == 7 or arg == 8 or arg == 9 then
			heightTable = botAliases;
		end

		for di = 1, table.getn(distTable) do
			for hi = 1, table.getn(heightTable) do
				table.insert(argPart, "_" .. distTable[di] .. "_" .. heightTable[hi]);
				table.insert(argPart, "_" .. heightTable[hi] .. "_" .. distTable[di]);
			end
		end
	end

	for argIndex = 1, table.getn(argPart) do
		for eventIndex = 1, table.getn(eventPart) do

			local funcName = "l." .. profileFuncPrefix .. eventPart[eventIndex] .. argPart[argIndex] .. "";
			local execStr = "";

			execStr = execStr .. "if l ~= nil and " .. funcName .. " ~= nil then" .. "\n";
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

	AbortMacro();
	l = {};

	if pcall(function () profileFile = dofile(profilePath) end) then
		OutputLogMessage("    " .. "loaded profile:" .. profileFileName .. ", location: " .. profileLocation .. "\n");
		return true
	else
		OutputLogMessage("    " .. profilePath .. " ... Error - File Not Found\n");
		return false
	end

end

loadProfile()