return function (pos: Vector2, radius: number, color: Color3, parent)
	local frame = Instance.new("Frame")
	frame.Name = "Point"
	frame.BackgroundColor3 = color 
	frame.Position = UDim2.fromOffset(pos.X, pos.Y)
	frame.Size = UDim2.fromOffset(radius * 2, radius * 2)
	frame.ZIndex = 5
	frame.Parent = parent
	
	local uic = Instance.new("UICorner")
	uic.CornerRadius = UDim.new(1, 0)
	uic.Parent = frame
	
	return frame
end
