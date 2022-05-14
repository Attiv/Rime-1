local pydb = ReverseDb("build/xklb52_sc.reverse.bin")
function filter(input,env)
	local input_text = env.engine.context.input
	local i=1
	for cand in input:iter() do
		if i==1 and input_text:find("[qwrtypsdfghjklzxcvbnm]")==1 and pydb:lookup(input_text:sub(3,-1).."2")~="" then
			cand:get_genuine().comment=pydb:lookup(input_text:sub(1,2).."1")..pydb:lookup(input_text:sub(3,-1).."2")
		end
		i=i+1
		yield(cand)
	end
end
return { func = filter }