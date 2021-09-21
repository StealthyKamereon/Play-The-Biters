local function biterize(player)
    global.players[player.index].is_human = false
    if player.character ~= nil then
        player.character.destroy()
    end
    player.set_controller{type=defines.controllers.spectator}
end

local function humanize(player)
    global.players[player.index].is_human = true
    if player.character == nil then
        local character = game.get_surface(1).create_entity{name="character", position={x=0, y=0}}
        player.set_controller{type=defines.controllers.character, character=character}
    end
end

return {biterize=biterize, humanize=humanize}