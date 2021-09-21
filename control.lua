local core = require("core")
require("play_mode_selection")

script.on_init(function()

    global.players = {}

    local freeplay = remote.interfaces["freeplay"]
    if freeplay then  -- Disable freeplay popup-message
        if freeplay["set_skip_intro"] then remote.call("freeplay", "set_skip_intro", true) end
        if freeplay["set_disable_crashsite"] then remote.call("freeplay", "set_disable_crashsite", true) end
    end
end)

commands.add_command("humanize", "Transform a player back to the human side.", function (command)
    if command.player_index ~= nil then
        local player = game.get_player(command.player_index)
        core.humanize(player)
    end
end)

commands.add_command("biterize", "Transform a player into the biter's master.", function (command)
    if command.player_index ~= nil then
        local player = game.get_player(command.player_index)
        core.biterize(player)
    end
end)