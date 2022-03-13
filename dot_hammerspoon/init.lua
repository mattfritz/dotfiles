local function bind_toggle(modifiers, key, app_name)
  hs.hotkey.bind(modifiers, key, function()
    local app = hs.application.find(app_name)
    if app:isFrontmost() then
      app:hide()
    else
      hs.application.launchOrFocus('/Applications/'..app_name..'.app')
    end
  end)
end

bind_toggle({'cmd'}, 'escape', 'Alacritty')
bind_toggle({'cmd', 'shift'}, 'escape', 'Obsidian')
