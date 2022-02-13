
function bindAltKey (key, func)
  hs.hotkey.bind({"alt"}, key, func)
end


-- to get bundle id of app: osascript -e 'id of app "Finder"'
function toggleApplication (appName, func)
  app = hs.application.find(appName)
  if app then
    app:kill()
    return "stopped"
  else
    hs.application.launchOrFocusByBundleID(appName)
    return "started"
  end
end

function reloadMenu()
  menuString = 'water:' .. waterCount .. ';'
  myMenu:setTitle(menuString)
end
