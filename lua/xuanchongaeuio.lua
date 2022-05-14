local KEYA = "a"
local KEYE = "e"
local KEYU = "u"
local KEYI = "i"
local KEYO = "o"

local function processor(key_event, env)
    local engine = env.engine
    local schema = engine.schema
    local context = engine.context
    local input_text = env.engine.context.input
--   if (input_text:find"^[qwrtypsdfghjklzxcvbnm][qwertyuiopasdfghjklzxcbnm][aeiou][aeiou][aeiou]")== 1 then
   if (input_text:find"^[qwrtypsdfghjklzxcvbnm][qwertyuiopasdfghjklzxcbnm][aeiou][aeiou][aeiou][aeiou]" or input_text:find"^[qwrtypsdfghjklzxcvbnm][a-z][qwrtypsdfghjklzxcvbnm][a-z][aeiou][aeiou]")== 1 then
	if key_event:repr() == KEYA and context:select(1) then
		context:commit()
		return 1
	elseif key_event:repr() == KEYE and context:select(2) then
		context:commit()
		return 1
	elseif key_event:repr() == KEYU and context:select(3) then
		context:commit()
		return 1
	elseif key_event:repr() == KEYI and context:select(4) then
		context:commit()
		return 1
	elseif key_event:repr() == KEYO and context:select(5) then
		context:commit()
		return 1
	else
		return 2
	end

    if not env.engine.context:get_selected_candidate() then
        context:clear()
    else
        context:commit()
    end
    return 2
  end
end

return { func = processor }
