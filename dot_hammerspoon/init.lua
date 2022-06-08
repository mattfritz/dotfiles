local log = hs.logger.new('configfile','debug')

log.d('Enabling Spotlight alternate app name search...')
hs.application.enableSpotlightForNameSearches(true)

local function bind_toggle(modifiers, key, app_name)
  hs.hotkey.bind(modifiers, key, function()
    local app = hs.application.find(app_name)
    if app:isFrontmost() then
      log.df('Hiding app: %s', app_name)
      app:hide()
    else
      log.df('Focusing app: %s', app_name)
      hs.application.launchOrFocus('/Applications/'..app_name..'.app')
    end
  end)
end

bind_toggle({'cmd'}, 'escape', 'Alacritty')
bind_toggle({'cmd', 'shift'}, 'escape', 'Obsidian')