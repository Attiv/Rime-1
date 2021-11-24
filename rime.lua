openfly_shortcut_processor = require("openfly_shortcut_processor")
openfly_date_translator = require("openfly_date_translator")
openfly_time_translator = require("openfly_time_translator")
openfly_shortcut_translator = require("openfly_shortcut_translator")
openfly_hint_filter = require("openfly_hint_filter")
openfly_deletion_filter = require("openfly_deletion_filter")
calculator_translator = require("calculator_translator")

function date_translator(input, seg)
   if (input == "orq") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " "))
   end
end

function time_translator(input, seg)
   if (input == "ouj") then
      local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M"), " ")
      cand.quality = 1
      yield(cand)
   end
end

