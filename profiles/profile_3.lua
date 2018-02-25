-- ----------------
-- Profile 3, Mouse control
-- ----------------

-- farthest, 1st column, upper / lower
l.listener_m_b_p_7 = function(event, arg)
    -- Do nothing
end
l.listener_m_b_r_7 = function(event, arg)
    -- Do nothing
end
l.listener_m_b_p_4 = function(event, arg)
    -- Do nothing
end
l.listener_m_b_r_4 = function(event, arg)
    -- Do nothing
end

-- middle, 2nd column, upper / lower
l.listener_m_b_p_8 = function(event, arg)
    PlayMacro("Profile Settings");
end
l.listener_m_b_r_8 = function(event, arg)
    -- Do nothing
end
l.listener_m_b_p_5 = function(event, arg)
    PlayMacro("LGS");
end
l.listener_m_b_r_5 = function(event, arg)
    -- Do nothing
end

-- nearest, 3rd column, upper / lower
l.listener_m_b_p_9 = function(event, arg)
    PlayMacro("DPI Up");
end
l.listener_m_b_r_9 = function(event, arg)
    -- Do nothing
end
l.listener_m_b_p_6 = function(event, arg)
    PlayMacro("DPI Down");
end
l.listener_m_b_r_6 = function(event, arg)
    -- Do nothing
end