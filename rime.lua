select_character_processor = require("select_character")

-- easy_en_enhance_filter: 连续输入增强
-- 详见 `lua/easy_en.lua`
local easy_en = require("easy_en")
easy_en_enhance_filter = easy_en.enhance_filter

function date_translator(input, seg)
  if (input == "sj") then
     --- Candidate(type, start, end, text, comment)
     yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), " 日期"))
  end
end

function single_char_first_filter(input)
  local l = {}
  for cand in input:iter() do
     if (utf8.len(cand.text) == 1) then
        yield(cand)
     else
        table.insert(l, cand)
     end
  end
  for i, cand in ipairs(l) do
     yield(cand)
  end
end