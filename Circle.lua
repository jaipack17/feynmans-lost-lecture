return function(r: number, p1: Vector2, color: Color3, parent, border: boolean)
	local circle = Instance.new("Frame")
	circle.Name = "Circle"
	circle.BackgroundColor3 = color
	circle.Size = UDim2.fromOffset(r * 2, r * 2)
	circle.AnchorPoint = Vector2.new(.5, .5)
	circle.Position = UDim2.fromOffset(p1.X, p1.Y)
	circle.BorderSizePixel = 0
	circle.ZIndex = 2

	local uic = Instance.new("UICorner")
	uic.CornerRadius = UDim.new(1, 0)
	uic.Parent = circle

	circle.Parent = parent
	
	if border then 
		local border = Instance.new("Frame")
		border.Name = "Border"
		border.BackgroundColor3 = Color3.new(0.333333, 1, 1)
		border.Size = UDim2.fromOffset(r * 2 + 4, r * 2 + 4)
		border.AnchorPoint = Vector2.new(.5, .5)
		border.Position = UDim2.fromOffset(p1.X, p1.Y)
		border.BorderSizePixel = 0
		border.ZIndex = 1

		local uic2 = Instance.new("UICorner")
		uic2.CornerRadius = UDim.new(1, 0)
		uic2.Parent = border

		border.Parent = parent		
	end
	
	return circle
end
