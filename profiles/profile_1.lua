-- ----------------
-- Profile 1, MUSIC
-- ----------------

-- farthest, 1st column, upper / lower
listener_7_mp = function(event, arg)
    PlayMacro("Mute");
end
listener_7_mr = function(event, arg)
    -- Do nothing
end
listener_4_mp = function(event, arg)
    PlayMacro("Play/Pause");
end
listener_4_mr = function(event, arg)
    -- Do nothing
end

-- middle, 2nd column, upper / lower
listener_8_mp = function(event, arg)
    PlayMacro("Next Track");
end
listener_8_mr = function(event, arg)
    -- Do nothing
end
listener_5_mp = function(event, arg)
    PlayMacro("Previous Track");
end
listener_5_mr = function(event, arg)
    -- Do nothing
end

-- nearest, 3rd column, upper / lower
listener_9_mp = function(event, arg)
    PlayMacro("Volume Up");
end
listener_9_mr = function(event, arg)
    -- Do nothing
end
listener_6_mp = function(event, arg)
    PlayMacro("Volume Down");
end
listener_6_mr = function(event, arg)
    -- Do nothing
end