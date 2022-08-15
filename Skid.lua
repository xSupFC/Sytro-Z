for i, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "Sytro-Z-Lib" then
        v:Destroy()
    end
end
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Sytro = {} 

function Sytro:DraggingEnabled(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		local Tween = TweenService:Create(object, TweenInfo.new(0.15), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end 

function Sytro:Notify(text, desc, c)
_G.Setting ={
["Title"] = text, 
["Desc"] = desc, 
["Time"] = c or 4
} 
for z,_ in pairs(game.CoreGui:GetChildren()) do
    if _.Name == "Notify" then
        _:Destroy()
    end
end

local TweenService = game:GetService("TweenService") 
local MessageGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Message1 = Instance.new("TextLabel")
local Message2 = Instance.new("TextLabel")

MessageGui.Name = "Notify"
MessageGui.Parent = game.CoreGui

Frame.Parent = MessageGui
Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
Frame.BorderColor3 = Color3.fromRGB(0,255,255)
Frame.BorderSizePixel = 3
Frame.Size = UDim2.new(0.2,0.2,0.25)
Frame.Active = true
Frame.Draggable = false
Frame.Visible = false
Frame.Transparency = 0
Frame.Position = UDim2.new(0.99,0,0.7)
Frame.ClipsDescendants = true

Sytro:Border(Frame, 2, Color3.fromRGB(255,0,0))
Sytro:Corner(Frame, 4)

Title.Parent = Frame
Title.BackgroundColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.01,0,0.01)
Title.TextColor3 = Color3.new(1,1,1)
Title.Size = UDim2.new(0.980,0,0.2)
Title.Font = Enum.Font.Code
Title.FontSize = Enum.FontSize.Size14
Title.TextScaled = true
Title.TextSize = 8
Title.TextWrapped = true
Title.Text = _G.Setting["Title"]

Message1.Parent = Frame
Message1.BackgroundColor3 = Color3.new(1,1,1)
Message1.BackgroundTransparency = 1
Message1.Position = UDim2.new(0.01,0,0.35)
Message1.TextColor3 = Color3.new(1,1,1)
Message1.Size = UDim2.new(0.980,0,0.2)
Message1.Font = Enum.Font.GothamSemibold
Message1.FontSize = Enum.FontSize.Size18
Message1.TextScaled = true
Message1.TextSize = 14
Message1.TextWrapped = true
Message1.Text = _G.Setting["Desc"]

wait()
Frame.Visible = true
TweenService:Create(Frame, TweenInfo.new(.20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0.78,0,0.7)}):Play()
wait()
Title.Text = _G.Setting["Title"]
Message1.Text = _G.Setting["Desc"]

wait(_G.Setting["Time"])
TweenService:Create(Frame, TweenInfo.new(.20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0.99,0,0.7)}):Play()
wait(.20)
MessageGui:Destroy()
end





function Sytro:Border(parents, s, colors)
	local SearchStroke2 = Instance.new("UIStroke")
	
	SearchStroke2.Thickness = s
	SearchStroke2.Name = ""
	SearchStroke2.Parent = parents
	SearchStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	SearchStroke2.LineJoinMode = Enum.LineJoinMode.Round
	SearchStroke2.Color = colors
	SearchStroke2.Transparency = 0
end

function Sytro:Corner(parents, k)
            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, k)
            DropdownCorner.Name = "DropdownCorner"
            DropdownCorner.Parent = parents
end





function Sytro:ButtonOnTab(parent, text, callback)
local Button3 = Instance.new("TextButton") 

Button3.Parent = parent
Button3.BackgroundColor3 = Color3.new(0,0,0)
Button3.BackgroundTransparency = 0
Button3.BorderSizePixel = 1
Button3.BorderColor3 = Color3.fromRGB(255,0,0)
Button3.TextColor3 = Color3.fromRGB(255,255,255)
Button3.Size = UDim2.new(0,110,0,40)
Button3.Font = Enum.Font.GothamSemibold 
Button3.FontSize = Enum.FontSize.Size14
Button3.Text = text
Button3.TextScaled = false
Button3.TextSize = 15
Button3.TextWrapped = false
Button3.Position = UDim2.new(0,10,0.5)
Button3.AutoButtonColor = true
Button3.MouseButton1Click:connect(function()
    pcall(callback) 
end) 
Sytro:Border(Button3, 2, Color3.fromRGB(255,0,0))
Sytro:Corner(Button3, 4)
end



function Sytro:LabelOnTab(parent, text)
local Label = Instance.new("TextLabel") 

Label.Parent = parent
Label.BackgroundColor3 = Color3.new(0,0,0)
Label.BackgroundTransparency = 0
Label.BorderSizePixel = 0
Label.BorderColor3 = Color3.fromRGB(0,0,0)
Label.TextColor3 = Color3.fromRGB(255,255,255)
Label.Size = UDim2.new(0,110,0,40)
Label.Font = Enum.Font.Code
Label.FontSize = Enum.FontSize.Size14
Label.Text = "== "..text.." =="
Label.TextScaled = false
Label.TextSize = 20
Label.TextWrapped = false
end

function Sytro:Window(text)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Name = "Sytro-Z-Lib"
ScreenGui.Parent = game.CoreGui 
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.270,0,0.20)
Frame.Size = UDim2.new(0, 381, 0, 257)

local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")

ScrollingFrame_Pageframe.Parent = Frame
ScrollingFrame_Pageframe.Active = true
ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScrollingFrame_Pageframe.BorderSizePixel = 0
ScrollingFrame_Pageframe.Position = UDim2.new(0, 0, 0.2101253344, 0)
ScrollingFrame_Pageframe.Size = UDim2.new(0, 381, 0, 200)
ScrollingFrame_Pageframe.ScrollBarThickness = 0
ScrollingFrame_Pageframe.ScrollBarImageColor3 = Color3.fromRGB(255,0,0)
ScrollingFrame_Pageframe.BackgroundTransparency = 1

local UIPadding_Pageframe = Instance.new("UIPadding")

UIPadding_Pageframe.Parent = ScrollingFrame_Pageframe
UIPadding_Pageframe.PaddingLeft = UDim.new(0, 10)
UIPadding_Pageframe.PaddingTop = UDim.new(0, 20)

local UIListLayout_Pageframe = Instance.new("UIListLayout")

UIListLayout_Pageframe.Parent = ScrollingFrame_Pageframe
UIListLayout_Pageframe.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_Pageframe.Padding = UDim.new(0, 8)
UIListLayout_Pageframe:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y + 30 )
end)

local Frame3 = Instance.new("Frame")

Frame3.Parent = Frame
Frame3.BackgroundColor3 = Color3.new(0,0,0)
Frame3.BorderColor3 = Color3.fromRGB(255,0,0)
Frame3.BorderSizePixel = 2
Frame3.Size = UDim2.new(0,130,0,257)
Frame3.ClipsDescendants = false
Frame3.Position = UDim2.new(0,-160,0,1)

local ScrollingFrame_Pageframe1 = Instance.new("ScrollingFrame")

ScrollingFrame_Pageframe1.Parent = Frame3
ScrollingFrame_Pageframe1.Active = true
ScrollingFrame_Pageframe1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScrollingFrame_Pageframe1.BorderSizePixel = 0
ScrollingFrame_Pageframe1.Position = UDim2.new(0, 0, 0, 0)
ScrollingFrame_Pageframe1.Size = UDim2.new(0, 130, 0, 257)
ScrollingFrame_Pageframe1.ScrollBarThickness = 0
ScrollingFrame_Pageframe1.ScrollBarImageColor3 = Color3.fromRGB(255,0,0)
ScrollingFrame_Pageframe1.BackgroundTransparency = 1

local UIPadding_Pageframe1 = Instance.new("UIPadding")

UIPadding_Pageframe1.Parent = ScrollingFrame_Pageframe1
UIPadding_Pageframe1.PaddingLeft = UDim.new(0, 10)
UIPadding_Pageframe1.PaddingTop = UDim.new(0, 20)

local UIListLayout_Pageframe1 = Instance.new("UIListLayout")

UIListLayout_Pageframe1.Parent = ScrollingFrame_Pageframe1
UIListLayout_Pageframe1.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_Pageframe1.Padding = UDim.new(0, 20)
UIListLayout_Pageframe1:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
ScrollingFrame_Pageframe1.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe1.AbsoluteContentSize.Y + 30 )
end) 

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(255, 0, 4)
TextLabel.Size = UDim2.new(0, 381, 0, 50)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = text
TextLabel.TextColor3 = Color3.fromRGB(255, 0, 4)
TextLabel.TextSize = 16.000
TextLabel.BorderSizePixel = 2

function ButtonTab(text, callback)
Sytro:ButtonOnTab(ScrollingFrame_Pageframe1, text, callback)  
end

Sytro:DraggingEnabled(Frame, Frame)

local SytroHeader = {} 

function SytroHeader:Button(text, callback)
local Button = Instance.new("TextButton")
Button.Name = "Button"
Button.Parent = ScrollingFrame_Pageframe
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.Size = UDim2.new(0, 360, 0, 39)
Button.Font = Enum.Font.GothamSemibold
Button.Text = ""..text
Button.TextColor3 = Color3.fromRGB(255,255,255)
Button.TextSize = 20.000
Button.BorderColor3 = Color3.fromRGB(30,30,30)
Button.BorderSizePixel = 2
Button.AutoButtonColor = false
Button.MouseButton1Down:Connect(function()
		TweenService:Create(
			Button,
			TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{BorderColor3 = Color3.fromRGB(255,0,0)}
		):Play()
end)

Button.MouseButton1Up:Connect(function()
		TweenService:Create(
			Button,
			TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{BorderColor3 = Color3.fromRGB(30,30,30)}
		):Play()
end)
Button.MouseButton1Click:Connect(function()
    pcall(callback) 
end)
end

function SytroHeader:Toggle(text, values, callback)
local value = value or false
local Toggle1 = Instance.new("TextButton") 
local ToggleMe1 = value

Toggle1.Parent = ScrollingFrame_Pageframe
Toggle1.BackgroundColor3 = Color3.new(0,0,0)
Toggle1.BackgroundTransparency = 0
Toggle1.BorderSizePixel = 2
Toggle1.BorderColor3 = Color3.fromRGB(30,30,30)
Toggle1.TextColor3 = Color3.fromRGB(255,255,255)
Toggle1.Size = UDim2.new(0, 360, 0, 39)
Toggle1.Font = Enum.Font.GothamSemibold
Toggle1.Text = " ❎ : "..text
Toggle1.TextScaled = false
Toggle1.TextSize = 20
Toggle1.TextWrapped = false
Toggle1.AutoButtonColor = false
Toggle1.TextXAlignment = Enum.TextXAlignment.Left
Toggle1.MouseButton1Click:connect(function()
if ToggleMe1 == false then
		ToggleMe1 = true
		--
		TweenService:Create(
			Toggle1,
			TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{BorderColor3 = Color3.fromRGB(255,0,0)}
		):Play()
		Toggle1.Text = " ✅ : ".. text
		else
		ToggleMe1 = false
		--
		TweenService:Create(
			Toggle1,
			TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{BorderColor3 = Color3.fromRGB(30,30,30)}
		):Play()
		Toggle1.Text = " ❎ : "..text
      end 
	pcall(callback,ToggleMe1)
  end)
end
        function SytroHeader:Dropdown(text, list, callback)
            local droptog = false
            local framesize = 0
            local itemcount = 0
            local sis = {} 
            local TweenService = game:GetService("TweenService")
            local Dropdown = Instance.new("Frame")
            local DropdownCorner = Instance.new("UICorner")
            local DropdownBtn = Instance.new("TextButton")
            local DropdownTitle = Instance.new("TextLabel")
            local ArrowImg = Instance.new("ImageLabel")
            local DropItemHolder = Instance.new("ScrollingFrame")
            local DropLayout = Instance.new("UIListLayout")

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = ScrollingFrame_Pageframe 
            Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Dropdown.ClipsDescendants = true
            Dropdown.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
            Dropdown.Size = UDim2.new(0,360,0,40)
            Dropdown.BorderSizePixel = 2
            Dropdown.BorderColor3 = Color3.fromRGB(30,30,30)
            
            DropdownCorner.CornerRadius = UDim.new(0, 0)
            DropdownCorner.Name = "DropdownCorner"
            DropdownCorner.Parent = Dropdown
            --Sytro:Border(Dropdown, 2, Color3.fromRGB(0,255,255))
            
            DropdownBtn.Name = "DropdownBtn"
            DropdownBtn.Parent = Dropdown
            DropdownBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownBtn.BackgroundTransparency = 1.000
            DropdownBtn.Size = UDim2.new(0, 578, 0, 35)
            DropdownBtn.Font = Enum.Font.SourceSans
            DropdownBtn.Text = ""
            DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownBtn.TextSize = 14.000

            DropdownTitle.Name = "DropdownTitle"
            DropdownTitle.Parent = Dropdown
            DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.BackgroundTransparency = 1.000
            DropdownTitle.Position = UDim2.new(0.0158126722, 0, 0, 0)
            DropdownTitle.Size = UDim2.new(0, 187, 0, 42)
            DropdownTitle.Font = Enum.Font.GothamSemibold
            DropdownTitle.Text = text
            DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.TextSize = 20.000
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

            ArrowImg.Name = "ArrowImg"
            ArrowImg.Parent = DropdownTitle
            ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ArrowImg.BackgroundTransparency = 1
            ArrowImg.Position = UDim2.new(0, 320, 0, 6)
            ArrowImg.Size = UDim2.new(0, 26, 0, 26)
            ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818375"

            DropItemHolder.Name = "DropItemHolder"
            DropItemHolder.Parent = DropdownTitle
            DropItemHolder.Active = true
            DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropItemHolder.BackgroundTransparency = 1.000
            DropItemHolder.BorderSizePixel = 0
            DropItemHolder.Position = UDim2.new(-0.00400000019, 0, 1.04999995, 0)
            DropItemHolder.Size = UDim2.new(0, 578, 0, 35)
            DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropItemHolder.ScrollBarThickness = 3

            DropLayout.Name = "DropLayout"
            DropLayout.Parent = DropItemHolder
            DropLayout.SortOrder = Enum.SortOrder.LayoutOrder

            DropdownBtn.MouseButton1Click:Connect(
                function()
                    if droptog == false then
                        Dropdown:TweenSize(
                            UDim2.new(0, 360, 0, 55 + framesize),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            ArrowImg,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 270}
                        ):Play()
		TweenService:Create(
			Dropdown,
			TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{BorderColor3 = Color3.fromRGB(255,0,0)}
		):Play()
                        wait(.2)
                        --Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    else
                        Dropdown:TweenSize(
                            UDim2.new(0, 360, 0, 42),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            ArrowImg,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
		TweenService:Create(
			Dropdown,
			TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{BorderColor3 = Color3.fromRGB(30,30,30)}
		):Play()
                        wait(.2)
                        --Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    end
                    droptog = not droptog
                end
            )

            for i, v in next, list do
                itemcount = itemcount + 1
                if itemcount <= 3 then
                    framesize = framesize + 26
                    DropItemHolder.Size = UDim2.new(0, 578, 0, framesize)
                end
                local Item = Instance.new("TextButton")
                local ItemCorner = Instance.new("UICorner")

                Item.Name = "Item"
                Item.Parent = DropItemHolder
                Item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Item.ClipsDescendants = true
                Item.Size = UDim2.new(0, 360, 0, 25)
                Item.AutoButtonColor = false
                Item.Font = Enum.Font.Gotham
                Item.Text = v
                Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                Item.TextSize = 20.000

                ItemCorner.CornerRadius = UDim.new(0, 4)
                ItemCorner.Name = "ItemCorner"
                ItemCorner.Parent = Item

                Item.MouseEnter:Connect(
                    function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}
                        ):Play()
                    end
                )

                Item.MouseLeave:Connect(
                    function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}
                        ):Play()
                    end
                )

                Item.MouseButton1Click:Connect(
                    function()
                        droptog = not droptog
                        DropdownTitle.Text = text .. " - " .. v
                        pcall(callback, v)
                        Dropdown:TweenSize(
                            UDim2.new(0, 360, 0, 42),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            ArrowImg,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
		TweenService:Create(
			Dropdown,
			TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{BorderColor3 = Color3.fromRGB(30,30,30)}
		):Play()
                        wait(.2)
                        --Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    end
                )

                DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)
            end
        end
    return SytroHeader
  end
return Sytro
