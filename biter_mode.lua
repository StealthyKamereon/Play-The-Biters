local core = require("core")

script.on_event("btm_selection_click", function(event)
    local player = game.get_player(event.player_index)
    local player_data = global.players[event.player_index]
    if event.selected_prototype ~= nil and event.selected_prototype.derived_type == "unit" then
        local unit = player.selected
        core.create_selected_preview(player, unit)
        player_data.selected = unit
        player.selected = unit
    else
        core.destroy_selected_preview(player)
        player_data.selected = nil
        player.selected = nil
    end
end)