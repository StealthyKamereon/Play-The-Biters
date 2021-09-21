local core = require("core")

script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)

    global.players[player.index] = {is_human = true}

    local screen_element = player.gui.screen
    local main_frame = screen_element.add{type="frame", name="ptb_selection_frame", caption={"ptb.play_mode_selection_frame_title"}}
    main_frame.style.size = {385, 165}
    main_frame.auto_center = true

    local content_frame = main_frame.add{type="frame", name="content_frame", direction="vertical"}
    local controls_flow = content_frame.add{type="flow", name="controls_flow", direction="horizontal"}

    controls_flow.add{type="button", name="ptb_play_as_human_button", caption={"ptb.play_as_human"}}
    controls_flow.add{type="button", name="ptb_play_as_biters_button", caption={"ptb.play_as_biters"}}
end)

script.on_event(defines.events.on_gui_click, function(event)
    local player = game.get_player(event.player_index)

    if event.element.name == "ptb_play_as_human_button" then
        player.gui.screen.ptb_selection_frame.destroy()
        core.humanize(player)
    elseif event.element.name == "ptb_play_as_biters_button" then
        player.gui.screen.ptb_selection_frame.destroy()
        core.biterize(player)
    end
end)
