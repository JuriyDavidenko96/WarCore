-- Функции поиска и фильтрации юнитов, а так же быстрой работы с группами

-- Перебирает каждого юнта в группе и передает его в функцию-обработчик
function WcForGroup(whichGroup,whichAction)
    local len = BlzGroupGetSize(whichGroup) - 1
    for i=0,len do
        whichAction(BlzGroupUnitAt(whichGroup, i))
    end
    ForGroup(whichGroup, callback)
end

-- Возвращает группу, включающую каждого юнита на карте
function WcEnumUnits()
    local gp = CreateGroup()
    local map = GetWorldBounds()
    GroupEnumUnitsInRect(gp, map, nil)
    map = nil
    return gp
end

-- Возвращает группу, включающую каждого юнита на карте, удовлетворяющего условию функции-фильтра
function WcEnumUnitsWhere(filter)
    local gp = CreateGroup()
    local map = GetWorldBounds()
    local tmp = CreateGroup()
    GroupEnumUnitsInRect(tmp, map, nil)
    ForGroup(tmp, function()
        local u = GetEnumUnit()
        if filter(u) then
            GroupAddUnit(gp, u)
        end
        GroupRemoveUnit(tmp, u)
        u = nil
    end)
    map = nil
    return gp
end