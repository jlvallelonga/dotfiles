hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("TextClipboardHistory", {
    start = true
})
-- spoon.SpoonInstall:andUse("SpeedMenu", {
--     start = true
-- })


-- spoon.SpeedMenu:rescan()

-- function installSpeedMenu()
--     spoon.SpoonInstall:asyncInstallSpoonFromRepo(
--       'https://github.com/Hammerspoon/Spoons',
--       'master',
--       'SpeedMenu',
--       function(result)
--         if not result then
--           hs.logger.new('Hammerspoon', 'error'):e('Failed to install SpeedMenu spoon.')
--         end
--       end
--     )
--   end

--   -- Call the function to start the installation
--   installSpeedMenu()

-- a menubar item for hammerspoon stuff
myMenu = hs.menubar.new()

waterCount = 0

require('helpers')
require('keybindings')

-- make sure to display the menu at startup
reloadMenu()

-- choose = hs.chooser.new(function(choice)
--   print(choice)
-- end)
-- choose:choices(function()
--   local options = {
--    {
--     ["text"] = "First Choice",
--     ["subText"] = "This is the subtext of the first choice",
--     ["uuid"] = "0001"
--    },
--    { ["text"] = "Second Option",
--      ["subText"] = "I wonder what I should type here?",
--      ["uuid"] = "Bbbb"
--    },
--    { ["text"] = hs.styledtext.new("Third Possibility", {font={size=18}, color=hs.drawing.color.definedCollections.hammerspoon.green}),
--      ["subText"] = "What a lot of choosing there is going on here!",
--      ["uuid"] = "III3"
--    },
--   }
--   return options
-- end)
-- choose:show()
