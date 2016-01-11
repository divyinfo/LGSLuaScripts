-- ----------------
-- Profile 3, Mouse control
-- ----------------

-- farthest, 1st column, upper / lower
listener_7_mp = function(event, arg)
    -- Do nothing
end
listener_7_mr = function(event, arg)
    -- Do nothing
end
listener_4_mp = function(event, arg)
    -- Do nothing
end
listener_4_mr = function(event, arg)
    -- Do nothing
end

-- middle, 2nd column, upper / lower
listener_8_mp = function(event, arg)
    PlayMacro("Battery Level (G602)");
end
listener_8_mr = function(event, arg)
    -- Do nothing
end
listener_5_mp = function(event, arg)
    -- Do nothing
end
listener_5_mr = function(event, arg)
    -- Do nothing
end

-- nearest, 3rd column, upper / lower
listener_9_mp = function(event, arg)
    PlayMacro("DPI Up");
end
listener_9_mr = function(event, arg)
    -- Do nothing
end
listener_6_mp = function(event, arg)
    PlayMacro("DPI Down");
end
listener_6_mr = function(event, arg)
    -- Do nothing
end