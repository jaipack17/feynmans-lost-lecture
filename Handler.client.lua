local canvas = script.Parent.Canvas
local TweenService = game:GetService("TweenService")

local circle = require(script.Parent.Circle)
local line = require(script.Parent.Line)
local point = require(script.Parent.Point)

local width = workspace.CurrentCamera.ViewportSize.X 
local height = workspace.CurrentCamera.ViewportSize.Y 

local radius = 150 
local pos = Vector2.new(width/2, height/2)
local segments = {}
local randomPoint;

circle(radius, pos, canvas.BackgroundColor3, canvas, true)

while true do 
	local random = Random.new()
	local randomRad = random:NextNumber(0, math.pi * 2)
	local randomLen = random:NextNumber(0.1, radius)

	randomPoint = Vector2.new(
		pos.x + math.cos(randomRad) * randomLen,
		pos.y + math.sin(randomRad) * randomLen 
	)

	point(randomPoint, 2, Color3.new(1, 1, 0), canvas)

	for i = 0, math.pi * 2, 0.07 do 
		local segment = line(randomPoint, Vector2.new(
			pos.X + math.cos(i) * radius,
			pos.Y + math.sin(i) * radius 
			), canvas, 1, Color3.new(1, 1, 1))

		table.insert(segments, segment)
	end

	task.wait(3)

	local info = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
	TweenService:Create(canvas:FindFirstChild("Border"), info, { BackgroundColor3 = Color3.new(1, 1, 1) }):Play()

	for i, s in ipairs(segments) do 
		local color = Color3.fromHSV(i/#segments, 1, 1)
		local changeColor = TweenService:Create(s, info, { BackgroundColor3 = color })
		changeColor:Play()

		local rotate = TweenService:Create(s, info, { Rotation = s.Rotation + 90 })
		rotate:Play()
		
		task.wait(.05)
	end

	task.wait(3)

	for i, s in ipairs(segments) do 
		local transparency = TweenService:Create(s, info, { BackgroundTransparency = 1 })
		transparency:Play()
		
		task.wait(.05)
	end	
	
	task.wait(2)
	
	for i, s in ipairs(segments) do 
		s:Destroy()
		table.remove(segments, i)
	end	
	
	canvas:FindFirstChild("Point"):Destroy()
end
