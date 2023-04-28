local function reverse_lookup_filter(input, env)
	local is_on = env.engine.context:get_option('en_tran')
    for cand in input:iter() do
		if is_on and string.sub(env.engine.context.input, 1, 1) == 'i' then
            cand:get_genuine().comment = env.endb:lookup(cand.text)
			yield(cand)
		else
			yield(cand)
		end
	end
 end


local function filter(input, env)
    reverse_lookup_filter(input, env)
	
 end

local function init(env)
	-- 当此组件被载入时，打开反查库，并存入 `endb` 中
	env.endb = ReverseDb("build/xmjd6enre.reverse.bin")
 end

return {init = init, func = filter}
