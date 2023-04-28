-- local function reverse_lookup_filter(input, pydb)
--   for cand in input:iter() do
--      --cand:get_genuine().preedit =  cand.comment
--      --cand:get_genuine().preedit =cand.preedit .. cand.text
--      cand:get_genuine().preedit = cand.text
--      yield(cand)
--   end
-- end

-- --[[
-- 如下，filter 除 `input` 外，可以有第二个参数 `env`。
-- --]]
-- local function filter(input, env)
--    --[[ 从 `env` 中拿到拼音的反查库 `pydb`。
--         `env` 是一个表，默认的属性有（本例没有使用）：
--           - engine: 输入法引擎对象
--           - name_space: 当前组件的实例名
--         `env` 还可以添加其他的属性，如本例的 `pydb`。
--    --]]
--    reverse_lookup_filter(input, env.pydb)
-- end
-- return filter

local function reverse_lookup_filter(input, env)
    local context = env.engine.context
    local is_preview_on = context:get_option('preview')
    
    for cand in input:iter() do
        if is_preview_on then
            cand:get_genuine().preedit = cand.text
            -- cand:get_genuine().preedit =cand.preedit .. cand.text -- 候选栏显示按键label
            yield(cand)
        else
            yield(cand)
        end
    end
end
  
--[[
    如下，filter 除 `input` 外，可以有第二个参数 `env`。
--]]
local function filter(input, env)
--[[ 从 `env` 中拿到拼音的反查库 `pydb`。
    `env` 是一个表，默认的属性有（本例没有使用）：
        - engine: 输入法引擎对象
        - name_space: 当前组件的实例名
        `env` 还可以添加其他的属性，如本例的 `pydb`。
--]]
    reverse_lookup_filter(input, env)
end

return filter