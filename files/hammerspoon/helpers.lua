
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

function isAppInFocus(appName)
  local app = hs.application.frontmostApplication()
  return app:name() == appName
end

function quickAlert(message)
  -- calculate duration based on number of words
  duration = countWords(message) * 0.2
  hs.alert.show(message, 0.3 + duration)
end

-- function to count the number of space-separated words in a string
function countWords(str)
  local count = 0
  for word in string.gmatch(str, "%S+") do
    count = count + 1
  end
  return count
end

function getCurrentDateAsString()
    -- get current date in table format
    local date = os.date("*t")

    -- format the date string as yyyy-mm-dd
    local date_str = string.format("%04d-%02d-%02d", date.year, date.month, date.day)

    return date_str
end
