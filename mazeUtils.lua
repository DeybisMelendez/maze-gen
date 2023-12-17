local lineDelimiter = "[^\n]+" -- Delimitador de lineas
local spaceDelimiter = "[^%s]+" -- Delimitador de espacios

-- split permite dividir un texto en un array con un delimitador
local function split(str, del) -- String, Delimiter
    local t = {}
    for value in str:gmatch(del) do
        table.insert(t, value)
    end
    return t
end

local function printMaze(maze)
    for y = 1, #maze do
        for x = 1, #maze[y] do
            io.write(" " .. maze[y][x])
        end
        io.write("\n")
    end
end

return {
    print = printMaze,
    split = split,
    delimiter = {
        line = lineDelimiter,
        space = spaceDelimiter
    }
}
