require('helpers')
require('local_functions_gitignoreme')

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

function testCurrentFile()
  hs.eventtap.keyStroke({"shift", "alt", "cmd", "ctrl"}, "p")
  fileProjectPath = hs.pasteboard.getContents()

  isE2eTest = string.find(fileProjectPath, '-spec.ts', 1, true) ~= nil
  if (isE2eTest) then
    command = "yarn test:e2e"
  else
    command = "yarn test"
  end

  runCommandInItermTab1('if [[ $(rg debugger) ]]; then echo "debug" | pbcopy; else echo "" | pbcopy; fi')

  -- iterm still has focus
  hs.timer.doAfter(1, function()
    debugCommandPart = ''
    debugOrNot = hs.pasteboard.readString()
    -- if (debugOrNot == 'debug') then -- why does this not work!!!
    if (string.find(debugOrNot, 'debug')) then
      hs.eventtap.keyStrokes(command .. ':debug ' .. fileProjectPath)
      hs.eventtap.keyStroke({}, "return")
      openChromeInspectorAndContinue()
    else
      hs.eventtap.keyStrokes(command .. ' ' .. fileProjectPath)
      hs.eventtap.keyStroke({}, "return")
    end
  end)
end

function runCommandInItermTab1(command)
  hs.application.launchOrFocus("iTerm")
  hs.eventtap.keyStroke({"cmd"}, "1")
  -- in case you did a git diff or something with the "less" program
  hs.eventtap.keyStroke({}, "q")

  -- exit out of any running process
  hs.eventtap.keyStroke({"ctrl"}, "c")
  -- a second time just to be sure
  hs.eventtap.keyStroke({"ctrl"}, "c")

  hs.eventtap.keyStrokes(command)
  hs.eventtap.keyStroke({}, "return")
end

function openChromeInspectorAndContinue()
  hs.alert.show('opening chrome inspector...')
  -- this doesn't work
  -- os.execute('open chrome://inspect/#devices')
  -- so...
  hs.osascript.applescript([[
set theURL to "chrome://inspect/#devices"
tell application "Google Chrome"
 if windows = {} then
  make new window
  set URL of (active tab of window 1) to theURL
 else
  make new tab at the end of window 1 with properties {URL:theURL}
 end if
 activate
end tell
]])
  -- and then continuing on the the debugger'd code
  -- wait for the inpsector tab to load
  hs.timer.doAfter(2, function()
    -- find the "inspect" link
    hs.eventtap.keyStroke({"cmd"}, "f")
    hs.eventtap.keyStrokes("inspect")
    -- click the "inspect" link
    hs.eventtap.keyStroke({"ctrl"}, "return")
    -- wait for the debugger to load
    hs.timer.doAfter(2, function()
      -- cmd+\ to continue to the first breakpoint (automaticaly breaks on first line)
      -- maybe there's a setting to turn autobreak on first line off?
      hs.eventtap.keyStroke({"cmd"}, "\\")
    end)
  end)
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
rootBindings['s'] = openStandupZoom
rootBindings['t'] = testCurrentFile
-- rootBindings['u'] = placeholderFunction
-- rootBindings['v'] = placeholderFunction
rootBindings['w'] = incrementWater
-- rootBindings['x'] = openChromeInspector
-- rootBindings['y'] = placeholderFunction
rootBindings['z'] = openStandupZoom

-- loop through rootBindings table and bind each to the function
for k,func in pairs(rootBindings) do
  bindAltKey(k, func)
end
