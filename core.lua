local function create_action_bar(player)
    local screen = player.gui.screen
    local action_bar = screen.add{type="frame", name="ptb_action_bar", flow="horizontal"}
    action_bar.add{type="button", caption={"ptb.attack_button"}}
    action_bar.location = {player.display_resolution.width/2, player.display_resolution.height-100}
end

local function biterize(player)
    global.players[player.index].is_human = false
    if player.character ~= nil then
        --player.character.destroy()
    end
    player.set_controller{type=defines.controllers.spectator}
    create_action_bar(player)
end

local function humanize(player)
    global.players[player.index].is_human = true
    if player.character == nil then
        local character = game.get_surface(1).create_entity{name="character", position={x=0, y=0}}
        player.set_controller{type=defines.controllers.character, character=character}
    end
end

local function create_selected_preview(player, entity)
    local screen = player.gui.screen
    local window = nil
    if screen.ptb_selected_preview ~= nil then
        window = screen.ptb_selected_preview
        screen.ptb_selected_preview.clear()
    else
        window = screen.add{type="frame", flow="vertical", name="ptb_selected_preview"}
        window.location = {player.display_resolution.width/2, 0}
    end

    window.caption = entity.localised_name
    local camera = window.add{type="camera", position=entity.position}
    camera.style.size = {100, 100}
    camera.entity = entity
end

local function destroy_selected_preview(player)
    if player.gui.screen.ptb_selected_preview ~= nil then
        player.gui.screen.ptb_selected_preview.destroy()
    end
end

return {biterize=biterize, humanize=humanize, create_selected_preview=create_selected_preview, destroy_selected_preview=destroy_selected_preview, create_action_bar=create_action_bar}