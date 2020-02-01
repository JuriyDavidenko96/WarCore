-- Функции для работы с текстагами

-- Создает и возвращает статичный плавающий текст в нужных координатах
function WcCreateTexttag(x,y,z,text,size,r,g,b)
    local tt = CreateTextTag()
    SetTextTagVisibility(tt, true)
    SetTextTagPos(tt, x, y, z)
    SetTextTagText(tt, text, (size * 0.023) / 10)
    SetTextTagColor(tt, r, g, b, 1)
    return tt
end

-- Создает и возвращает плавающий текст в нужных координатах
function WcCreateTexttagEx(x,y,z,angle,text,size,r,g,b)
    local tt = CreateTextTag()
    local real x1 = 0.0355 * Cos(angle * bj_DEGTORAD)
    local real y1 = 0.0355 * Sin(angle * bj_DEGTORAD)
    SetTextTagVisibility(tt, true)
    SetTextTagPos(tt, x, y, z)
    SetTextTagText(tt, text, (size * 0.023) / 10)
    SetTextTagVelocity(tt, x1, y1)
    SetTextTagColor(tt, r, g, b, 1)
    return tt
end

-- Создает временный плавающий текст в нужных координатах
function WcCreateTimedTexttag(x,y,z,angle,text,size,time,r,g,b)
    local tt = CreateTextTag()
    local real x1 = 0.0355 * Cos(angle * bj_DEGTORAD)
    local real y1 = 0.0355 * Sin(angle * bj_DEGTORAD)
    SetTextTagVisibility(tt, true)
    SetTextTagPos(tt, x, y, z)
    SetTextTagText(tt, text, (size * 0.023) / 10)
    SetTextTagVelocity(tt, x1, y1)
    SetTextTagPermanent(tt, false)
    SetTextTagColor(tt, r, g, b, 1)
    SetTextTagLifespan(tt, time)
    SetTextTagFadepoint(tt, 0)
    local t = CreateTimer()
    TimerStart(t, time, false, function()
        t = GetExpiredTimer() 
        DestroyTextTag(tt)
        tt = nil
        t = nil
    end)
end

-- Создает временный плавающий текст в нужных координатах, видимый определенному игроку
function WcCreateTimedTexttagFor(x,y,z,angle,text,size,time,r,g,b,player)
    local tt = CreateTextTag()
    local real x1 = 0.0355 * Cos(angle * bj_DEGTORAD)
    local real y1 = 0.0355 * Sin(angle * bj_DEGTORAD)
    if GetLocalPlayer() ~= player then
        SetTextTagVisibility(tt, false)
    else
        SetTextTagVisibility(tt, true)
    end
    SetTextTagPos(tt, x, y, z)
    SetTextTagText(tt, text, (size * 0.023) / 10)
    SetTextTagVelocity(tt, x1, y1)
    SetTextTagPermanent(tt, false)
    SetTextTagColor(tt, r, g, b, 1)
    SetTextTagLifespan(tt, time)
    SetTextTagFadepoint(tt, 0)
    local t = CreateTimer()
    TimerStart(t, time, false, function()
        t = GetExpiredTimer()
        DestroyTextTag(tt)
        tt = nil
        t = nil
    end)
end