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
playingMacroToggle4 = false
listener_7_mp = function(event, arg)
    if playingMacroToggle4 then
        AbortMacro()
        playingMacroToggle4 = false
    else
        PlayMacro("Toggle4");
        playingMacroToggle4 = true
    end
end
listener_7_mr = function(event, arg)
    -- Do nothing
end
listener_4_mp = function(event, arg)
    PlayMacro("SwitchActionBar");
end
listener_4_mr = function(event, arg)
    -- Do nothing
end

toggleAutoRun8 = false;
toggleAutoRun5 = false;
toggleAutoRun = false;

-- middle, 2nd column, upper / lower
listener_8_mp = function(event, arg)
    toggleAutoRun8 = true
end
listener_8_mr = function(event, arg)
    if toggleAutoRun then
        toggleAutoRun = false;
    else
        if toggleAutoRun5 then
            PlayMacro("Num *");
            toggleAutoRun = true;
        else
            PressKey("m");
            ReleaseKey("m");
            toggleAutoRun = false;
        end
    end

    toggleAutoRun8 = false
end
listener_5_mp = function(event, arg)
    toggleAutoRun5 = true
end
listener_5_mr = function(event, arg)
    if toggleAutoRun then
        toggleAutoRun = false;
    else
        if toggleAutoRun8 then
            PlayMacro("Num *");
            toggleAutoRun = true;
        else
            PlayMacro("BagsAndProfile");
            toggleAutoRun = false;
        end
    end

    toggleAutoRun5 = false
end

-- nearest, 3rd column, upper / lower
listener_9_mp = function(event, arg)
    PlayMacro("Horse");
end
listener_9_mr = function(event, arg)
    -- Do nothing
end
listener_6_mp = function(event, arg)
    PressKey("spacebar");
    ReleaseKey("spacebar");
end
listener_6_mr = function(event, arg)
    -- Do nothing
end