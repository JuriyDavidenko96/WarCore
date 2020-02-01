-- Функции работы с игроками

function WcGetPlayerGold(whichPlayer)
    return GetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_GOLD)
end

function WcGetPlayerLumber(whichPlayer)
    return GetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_LUMBER)
end

function WcSetPlayerGold(whichPlayer,value)
    return SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_GOLD, value)
end

function WcSetPlayerLumber(whichPlayer,value)
    return SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_LUMBER, value)
end

function WcAddPlayerGold(whichPlayer,value)
    return SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_GOLD) + value)
end

function WcAddPlayerLumber(whichPlayer,value)
    return SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_LUMBER) + value)
end