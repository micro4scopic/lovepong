local rect_y = 0
local rect_width = 30
local rect_height = 120
local win_width = love.graphics.getWidth()
local win_height = love.graphics.getHeight()
-- Subtracting rect_width is important so rectangle 2
-- doesn't go off the edge
local rect2_x = win_width - rect_width
-- Same as this
local rect2_y = win_height - rect_height
local circle_x = rect_width + 30
local circle_y = rect_height / 2
local resetx = circle_x
local resety = circle_y
local circle_velx = 300
local circle_vely = 150
local score = 0
local score2 = 0

local function do_bounce(paddlex)
    circle_velx = -circle_velx * 1.03
    circle_x = paddlex + 4

    if circle_vely < 0 then
        circle_vely = math.random(10, 150)
    else
        circle_vely = -math.random(10, 150)
    end
end

local function disp_score()
    love.graphics.print(tostring(score) .. ' : ' .. tostring(score2),
                        win_height / 2, win_width / 2)
end

local function reset()
    circle_x = resetx
    circle_y = resety
    rect_y = 0
    rect2_y = win_height - rect_height
    circle_velx = 300
    circle_vely = 150
end

function love.load()
    math.randomseed(os.time())
    love.window.setTitle("Pong :)")
    love.graphics.setNewFont("font.ttf", 75)
end

function love.update(dt)
    -- Ball is hitting bottom wall
    if circle_y > win_height then
        circle_velx = circle_velx * 1.1
        circle_vely = circle_vely * -1.1
        circle_y = circle_y - 10
    -- Ball is hitting top wall
    elseif circle_y < 0 then
        circle_velx = circle_velx * 1.1
        circle_vely = circle_vely * -1.1
        circle_y = circle_y + 10
    -- Right score side
    elseif circle_x > win_width then
        reset()
        score = score + 1
    -- Left score side
    elseif circle_x < 0 then
        reset()
        score2 = score2 + 1
    -- Bounce left paddle
    elseif circle_x < rect_width and
           circle_y > rect_y and
           circle_y < rect_y + rect_height then 
        do_bounce(rect_width)
    -- Bounce right paddle
    elseif circle_x > rect2_x and
           circle_y > rect2_y and
           circle_y < rect2_y + rect_height then
        do_bounce(rect2_x)
    end

    circle_x = circle_x + circle_velx * dt
    circle_y = circle_y + circle_vely * dt

    -- Rectangle 1
    if love.keyboard.isDown('w') then
        -- Check if we are not touching the top edge
        if rect_y > 0 then
            -- Decrement y by 500 per second
            rect_y = rect_y - 500 * dt
        else
            -- Stop rectangle from going off the edge
            rect_y = 0
        end
    elseif love.keyboard.isDown('s') then
        -- Check if we are not touching the bottom edg
        if rect_y < win_height - rect_height then
            -- Increment y by 500 per second
            rect_y = rect_y + 500 * dt
        else
            -- Stop rectangle from going off the edge
            rect_y = win_height - rect_height
        end
    end

    if love.keyboard.isDown('up') then
        -- Check if we are not touching the top edge
        if rect2_y > 0 then
            -- Decrement y by 500 per second
            rect2_y = rect2_y - 500 * dt
        else
            -- Stop rectangle from going off the edge
            rect2_y = 0
        end
    elseif love.keyboard.isDown('down') then
        -- Check if we are not touching the bottom edg
        if rect2_y < win_height - rect_height then
            -- Increment y by 500 per second
            rect2_y = rect2_y + 500 * dt
        else
            -- Stop rectangle from going off the edge
            rect2_y = win_height - rect_height
        end
    end
end

function love.draw()
    if score == 10 then
        print(":: Player 1 (on the left side) won! ::")
        os.exit(0)
    elseif score2 == 10 then
        print("~~ Player 2 (on the right side) won! ~~")
        os.exit(0)
    end

    -- Display score
    disp_score()

    -- Ball
    love.graphics.circle("fill", circle_x, circle_y, 10)

    -- Draw rectangle 1
    love.graphics.rectangle("fill", 0, rect_y, rect_width, rect_height)

    -- Draw rectangle 2
    love.graphics.rectangle("fill", rect2_x, rect2_y, rect_width, rect_height)
end