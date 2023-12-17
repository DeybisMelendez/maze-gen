local mazeUtils = require("mazeUtils")

local maze = {{"#", "#", "#"}, {"#", " ", "#"}, {"#", "#", "#"}}
local function generateMaze(size)
    local lineY = #maze
    local lineX = #maze[1]
    local pathCandidates = {}
    local randomDiscard = math.random(1, 4)
    local path = ""
    -- Ampliar el laberinto
    -- duplicar a la derecha
    for y = 1, #maze do
        for x = 2, #maze[y] do
            table.insert(maze[y], maze[y][x])
        end
    end
    -- duplicar hacia abajo
    for y = 2, #maze do
        local line = {}
        for x = 1, #maze[y] do
            table.insert(line, maze[y][x])
        end
        table.insert(maze, line)
    end
    -- Buscar caminos candidatos válidos descartando una de las cuatro líneas centrales
    if randomDiscard ~= 1 then
        table.insert(pathCandidates, {})
        for x = 1, lineX do
            if maze[lineY - 1][x] == " " and maze[lineY + 1][x] == " " then
                table.insert(pathCandidates[#pathCandidates], {
                    x = x,
                    y = lineY
                })
            end
        end
    end
    if randomDiscard ~= 2 then
        table.insert(pathCandidates, {})
        for x = lineX + 1, #maze[1] do

            if maze[lineY - 1][x] == " " and maze[lineY + 1][x] == " " then

                table.insert(pathCandidates[#pathCandidates], {
                    x = x,
                    y = lineY
                })
            end
        end
    end
    if randomDiscard ~= 3 then
        table.insert(pathCandidates, {})
        for y = 1, lineY do
            if maze[y][lineX - 1] == " " and maze[y][lineX + 1] == " " then
                table.insert(pathCandidates[#pathCandidates], {
                    x = lineX,
                    y = y
                })
            end
        end
    end
    if randomDiscard ~= 4 then
        table.insert(pathCandidates, {})
        for y = lineY + 1, #maze do
            if maze[y][lineX - 1] == " " and maze[y][lineX + 1] == " " then
                table.insert(pathCandidates[#pathCandidates], {
                    x = lineX,
                    y = y
                })
            end
        end
    end

    -- abrir 1 camino válido de cada línea no descartada
    for _, line in ipairs(pathCandidates) do
        randomDiscard = math.random(1, #line)
        path = line[randomDiscard]
        maze[path.y][path.x] = " "
    end

    if size > 0 then
        generateMaze(size - 1)
    else
        mazeUtils.print(maze)
    end

end
generateMaze(2)
