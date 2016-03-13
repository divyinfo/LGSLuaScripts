-- ----------------
-- Profile 0, default profile
-- ----------------

-- Switching profiles
listener_10_mp = function(event, arg)
    loadProfile()
    profile = 0;
    loadProfile(profile)
end
listener_11_mp = function(event, arg)
    loadProfile()
    profile = profile + 1;
    if not loadProfile(profile) then
        profile = 0
        loadProfile(profile)
    end
end

-- farthest, 1st column, upper / lower
listener_7_mp = function(event, arg)
    PressKey("lctrl");
    PressKey("lshift");
    PressKey("t");

    ReleaseKey("lctrl");
    ReleaseKey("lshift");
    ReleaseKey("t");
end
listener_7_mr = function(event, arg)
    -- Do nothing
end
listener_4_mp = function(event, arg)
    PlayMacro("Forward");
end
listener_4_mr = function(event, arg)
    -- Do nothing
end

-- middle, 2nd column, upper / lower
listener_8_mp = function(event, arg)
    PressKey("lctrl");
end
listener_8_mr = function(event, arg)
    ReleaseKey("lctrl");
end
listener_5_mp = function(event, arg)
    PlayMacro("Back");
end
listener_5_mr = function(event, arg)
    -- Do nothing
end

-- nearest, 3rd column, upper / lower
listener_9_mp = function(event, arg)
    PlayMacro("Copy");
end
listener_9_mr = function(event, arg)
    -- Do nothing
end
listener_6_mp = function(event, arg)
    PlayMacro("Paste");
end
listener_6_mr = function(event, arg)
    -- Do nothing
end