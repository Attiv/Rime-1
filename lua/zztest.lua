local function translator(input, seg)
    if package.config:sub(1,1) == "\\" then
      local path0=debug.getinfo(1,"S").source:sub(2)--获取Lua脚本的完整路径
      path0=string.lower(path0)
      local pathL=string.match(path0, "(.+)\\[^\\]*%.%w+$")--windows
      local pathY=pathL:sub(1,-5)--取rime.lua所在目录,即用户目录
      local pathX=pathY:sub(1,-6).."weasel\\" --系统目录
      if (input == "/cmd") then --bat加词
        strProgram = '"C:\\Windows\\system32\\cmd.exe"'
      elseif (input == "/bd") then --打开百度
       strProgram = '"https://www.baidu.com/"'
      elseif (input == ";u") then --打开百度
        strProgram = '"D:\\test.vbs"'
       elseif (input == "/ys") then --打开永硕网盘
        strProgram = '"http://hehuan.ys168.com/"'
       elseif (input == "/lz") then --打开蓝奏云
        strProgram = '"https://www.lanzou.com/u"'
       elseif (input == "/wp") then --打开百度网盘
        strProgram = '"https://pan.baidu.com/disk/home?errno=0&errmsg=Auth%20Login%20Sucess&&bduss=&ssnerror=0&traceid=#/all?path=%2F&vmode=list"'
       else
        strProgram=""
      end
      if strProgram ~= "" then
        strCmd = 'start "" '..strProgram
        os.execute(strCmd)
      end
    end
  end
  
  return translator
  