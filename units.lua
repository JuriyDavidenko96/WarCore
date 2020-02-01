-- Функции для работы с юнитами

-- Переносит юнита на нужные XY координаты, не сбивая приказы и не проверяя прозодимость пути
function WcSetUnitPos(whichUnit,x,y)
    SetUnitX(whichUnit, x)
    SetUnitY(whichUnit, y)
end

-- Переносит юнита относительно его положения, не сбивая приказы и не проверяя прозодимость пути
function WcSetUnitPosRelative(whichUnit,dist,angle)
    local x = dist + GetUnitX(whichUnit) * Cos(angle * bj_DEGTORAD)
    local y = dist + GetUnitY(whichUnit) * Sin(angle * bj_DEGTORAD)
    SetUnitX(whichUnit, x)
    SetUnitY(whichUnit, y)
end