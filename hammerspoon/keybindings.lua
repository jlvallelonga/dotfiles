require('helpers')

-- loop through bindings table and bind each to the function

function incrementWater()
  waterCount = waterCount + 1
  reloadMenu()
end

function showComputerName()
  hs.alert.show(hs.host.localizedName())
end

-- reload hammerspoon config
function reloadConfig()
  hs.reload()
  myMenu:setTitle('reloaded')
end

function toggleKarabiner()
  toggleApplication("org.pqrs.Karabiner")
end

function toggleChillNoiseGenerator()
  appName = "com.davecheng.chilllite"
  if toggleApplication(appName) == "started" then
    -- press the button to close the pop-up
    hs.timer.doAfter(1, function()
      hs.application.launchOrFocusByBundleID(appName)
      hs.eventtap.keyStroke({}, "return")
    end)
  end
end

function openDotfilesProject()
  os.execute('/usr/local/bin/atom ~/.dotfiles/')
end

function printLine()
  hs.eventtap.keyStroke({"cmd"}, "up")
  hs.eventtap.keyStroke({}, "return")
  hs.eventtap.keyStroke({}, "up")
  hs.eventtap.keyStrokes("--------------------------------------------------------------------------------------------------------------------------")
  hs.eventtap.keyStroke({"cmd"}, "left")
  hs.eventtap.keyStroke({}, "return")
  hs.eventtap.keyStroke({}, "up")
end

-- elixir inspect
function elixirInspect()
  hs.eventtap.keyStrokes("viwyo")
  hs.eventtap.keyStrokes("IO.inspect(")
  hs.eventtap.keyStroke({}, "escape")
  hs.eventtap.keyStrokes("pa")
  hs.eventtap.keyStrokes(", label: \"")
  hs.eventtap.keyStroke({}, "escape")
  hs.eventtap.keyStrokes("p")
end

-- javascript console.log() the current word (vim)
function consoleLog()
  -- atom doesn't like to take the vim commands as keyStrokes
  -- so individually it is
  hs.eventtap.keyStroke({}, "y", 50)
  hs.eventtap.keyStroke({}, "i", 50)
  hs.eventtap.keyStroke({}, "w", 50)
  hs.eventtap.keyStroke({}, "o", 50)
  hs.eventtap.keyStrokes("console.log('")
  hs.eventtap.keyStroke({}, "escape", 50)
  hs.eventtap.keyStroke({}, "p", 50)
  hs.eventtap.keyStroke({}, "a", 50)
  hs.eventtap.keyStrokes(": '")
  hs.eventtap.keyStroke({}, "escape", 50)
  hs.eventtap.keyStroke({}, "l", 50)
  hs.eventtap.keyStroke({}, "a", 50)
  hs.eventtap.keyStrokes(", ")
  hs.eventtap.keyStroke({}, "escape", 50)
  hs.eventtap.keyStroke({}, "escape", 50)
  hs.eventtap.keyStroke({}, "p", 50)
end

-- run last terminal command again
function terminalRepeatLast()
  hs.application.launchOrFocus("iTerm")
  hs.eventtap.keyStroke({}, "up")
  hs.eventtap.keyStroke({}, "return")
end

-- test current file
function testCurrentFile()
  hs.eventtap.keyStroke({"shift", "alt", "cmd", "ctrl"}, "p")
  hs.application.launchOrFocus("iTerm")
  hs.eventtap.keyStroke({"cmd"}, "1")
  hs.eventtap.keyStroke({"ctrl"}, "c")
  hs.eventtap.keyStroke({"ctrl"}, "c")
  hs.eventtap.keyStrokes("npm run test ")
  hs.eventtap.keyStroke({"cmd"}, "v")
  hs.eventtap.keyStroke({}, "return")
end

-- hs.hotkey.bind({"alt"}, "4", function()
--   hs.application.launchOrFocus("Slack")
--   hs.eventtap.keyStroke({"cmd"}, "t")
--   hs.timer.doAfter(0.5, function()
--     hs.eventtap.keyStroke({}, "return")
--     -- press escape in case there isn't a new message
--     --  and cmd+t dialog is still open
--     hs.eventtap.keyStroke({}, "escape")
--   end)
-- end)

-- TESTING - use this to divide commands
--- k = hs.hotkey.modal.new('cmd-shift', 'd')
--- function k:entered() hs.alert'Entered mode' end
--- function k:exited()  hs.alert'Exited mode'  end
--- k:bind('', 'escape', function() k:exit() end)
--- k:bind('', 'J', 'Pressed J',function() print'let the record show that J was pressed' end)

-- bindAltKey("g", function()
--   hs.alert.show("global macros activated")
--   bindAltKey("s", function()
--     hs.alert.show("global s")
--   end)
-- end)
--
-- bindAltKey("o", function()
--   hs.alert.show("other macros activated")
--   bindAltKey("s", function()
--     hs.alert.show("other s")
--   end)
-- end)

rootBindings = {}

rootBindings['-'] = printLine
rootBindings['a'] = terminalRepeatLast
-- rootBindings['b'] = placeholderFunction
rootBindings['c'] = toggleChillNoiseGenerator
rootBindings['d'] = openDotfilesProject
-- rootBindings['e'] = placeholderFunction
-- rootBindings['f'] = placeholderFunction
-- rootBindings['g'] = placeholderFunction
-- rootBindings['h'] = placeholderFunction
rootBindings['i'] = elixirInspect
-- rootBindings['j'] = placeholderFunction
rootBindings['k'] = toggleKarabiner
rootBindings['l'] = consoleLog
rootBindings['m'] = showComputerName
-- rootBindings['n'] = placeholderFunction
-- rootBindings['o'] = placeholderFunction
-- rootBindings['p'] = placeholderFunction
-- rootBindings['q'] = placeholderFunction
rootBindings['r'] = reloadConfig
-- rootBindings['s'] = placeholderFunction
rootBindings['t'] = testCurrentFile
-- rootBindings['u'] = placeholderFunction
-- rootBindings['v'] = placeholderFunction
rootBindings['w'] = incrementWater
-- rootBindings['x'] = placeholderFunction
-- rootBindings['y'] = placeholderFunction
-- rootBindings['z'] = placeholderFunction

for k,func in pairs(rootBindings) do
  bindAltKey(k, func)
end
