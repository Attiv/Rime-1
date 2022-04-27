---[[
--声形二码不上屏

local function filter(input, env)
  local engine = env.engine
  local context = engine.context
  local input_text = context.input
  for cand in input:iter() do
    if (input_text:find"^[qwrtypsdfghjklzxcvbnm][aeiou]$")== 1 then
      cand:get_genuine().type="completion"
      yield(cand)
    else
      yield(cand)
    end
  end
end
return { func = filter }
--]]
