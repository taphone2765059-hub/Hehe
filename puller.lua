-- Player Puller + UI ภาษาไทย | The Strongest Battlegrounds | Delta Executor

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

local ตั้งค่า = {
    เปิด = false,
    ระยะ = 50,
    ความเร็ว = 5,
}

-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PullerUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 220, 0, 200)
Main.Position = UDim2.new(0, 20, 0, 20)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

-- หัวข้อ
local หัวข้อ = Instance.new("TextLabel")
หัวข้อ.Size = UDim2.new(1, 0, 0, 35)
หัวข้อ.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
หัวข้อ.TextColor3 = Color3.fromRGB(255, 255, 255)
หัวข้อ.Text = "ดูดผู้เล่น - TSB"
หัวข้อ.Font = Enum.Font.GothamBold
หัวข้อ.TextSize = 14
หัวข้อ.Parent = Main
Instance.new("UICorner", หัวข้อ).CornerRadius = UDim.new(0, 8)

-- ปุ่มเปิดปิด
local ปุ่มToggle = Instance.new("TextButton")
ปุ่มToggle.Size = UDim2.new(1, -20, 0, 35)
ปุ่มToggle.Position = UDim2.new(0, 10, 0, 45)
ปุ่มToggle.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
ปุ่มToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ปุ่มToggle.Text = "ดูด: ปิด"
ปุ่มToggle.Font = Enum.Font.GothamBold
ปุ่มToggle.TextSize = 13
ปุ่มToggle.Parent = Main
Instance.new("UICorner", ปุ่มToggle).CornerRadius = UDim.new(0, 6)

-- ระยะ
local ป้ายระยะ = Instance.new("TextLabel")
ป้ายระยะ.Size = UDim2.new(1, -20, 0, 20)
ป้ายระยะ.Position = UDim2.new(0, 10, 0, 92)
ป้ายระยะ.BackgroundTransparency = 1
ป้ายระยะ.TextColor3 = Color3.fromRGB(200, 200, 200)
ป้ายระยะ.Text = "ระยะ: " .. ตั้งค่า.ระยะ
ป้ายระยะ.Font = Enum.Font.Gotham
ป้ายระยะ.TextSize = 12
ป้ายระยะ.TextXAlignment = Enum.TextXAlignment.Left
ป้ายระยะ.Parent = Main

local ลบระยะ = Instance.new("TextButton")
ลบระยะ.Size = UDim2.new(0, 35, 0, 25)
ลบระยะ.Position = UDim2.new(0, 10, 0, 114)
ลบระยะ.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ลบระยะ.TextColor3 = Color3.fromRGB(255, 255, 255)
ลบระยะ.Text = "-"
ลบระยะ.Font = Enum.Font.GothamBold
ลบระยะ.TextSize = 14
ลบระยะ.Parent = Main
Instance.new("UICorner", ลบระยะ).CornerRadius = UDim.new(0, 6)

local เพิ่มระยะ = Instance.new("TextButton")
เพิ่มระยะ.Size = UDim2.new(0, 35, 0, 25)
เพิ่มระยะ.Position = UDim2.new(0, 50, 0, 114)
เพิ่มระยะ.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
เพิ่มระยะ.TextColor3 = Color3.fromRGB(255, 255, 255)
เพิ่มระยะ.Text = "+"
เพิ่มระยะ.Font = Enum.Font.GothamBold
เพิ่มระยะ.TextSize = 14
เพิ่มระยะ.Parent = Main
Instance.new("UICorner", เพิ่มระยะ).CornerRadius = UDim.new(0, 6)

-- ความเร็ว
local ป้ายความเร็ว = Instance.new("TextLabel")
ป้ายความเร็ว.Size = UDim2.new(1, -20, 0, 20)
ป้ายความเร็ว.Position = UDim2.new(0, 10, 0, 148)
ป้ายความเร็ว.BackgroundTransparency = 1
ป้ายความเร็ว.TextColor3 = Color3.fromRGB(200, 200, 200)
ป้ายความเร็ว.Text = "ความเร็ว: " .. ตั้งค่า.ความเร็ว
ป้ายความเร็ว.Font = Enum.Font.Gotham
ป้ายความเร็ว.TextSize = 12
ป้ายความเร็ว.TextXAlignment = Enum.TextXAlignment.Left
ป้ายความเร็ว.Parent = Main

local ลบความเร็ว = Instance.new("TextButton")
ลบความเร็ว.Size = UDim2.new(0, 35, 0, 25)
ลบความเร็ว.Position = UDim2.new(0, 10, 0, 170)
ลบความเร็ว.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ลบความเร็ว.TextColor3 = Color3.fromRGB(255, 255, 255)
ลบความเร็ว.Text = "-"
ลบความเร็ว.Font = Enum.Font.GothamBold
ลบความเร็ว.TextSize = 14
ลบความเร็ว.Parent = Main
Instance.new("UICorner", ลบความเร็ว).CornerRadius = UDim.new(0, 6)

local เพิ่มความเร็ว = Instance.new("TextButton")
เพิ่มความเร็ว.Size = UDim2.new(0, 35, 0, 25)
เพิ่มความเร็ว.Position = UDim2.new(0, 50, 0, 170)
เพิ่มความเร็ว.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
เพิ่มความเร็ว.TextColor3 = Color3.fromRGB(255, 255, 255)
เพิ่มความเร็ว.Text = "+"
เพิ่มความเร็ว.Font = Enum.Font.GothamBold
เพิ่มความเร็ว.TextSize = 14
เพิ่มความเร็ว.Parent = Main
Instance.new("UICorner", เพิ่มความเร็ว).CornerRadius = UDim.new(0, 6)

-- Logic ปุ่ม
ปุ่มToggle.MouseButton1Click:Connect(function()
    ตั้งค่า.เปิด = not ตั้งค่า.เปิด
    ปุ่มToggle.Text = "ดูด: " .. (ตั้งค่า.เปิด and "เปิด" or "ปิด")
    ปุ่มToggle.BackgroundColor3 = ตั้งค่า.เปิด
        and Color3.fromRGB(40, 180, 40)
        or Color3.fromRGB(180, 40, 40)
end)

ลบระยะ.MouseButton1Click:Connect(function()
    ตั้งค่า.ระยะ = math.max(10, ตั้งค่า.ระยะ - 10)
    ป้ายระยะ.Text = "ระยะ: " .. ตั้งค่า.ระยะ
end)

เพิ่มระยะ.MouseButton1Click:Connect(function()
    ตั้งค่า.ระยะ = math.min(200, ตั้งค่า.ระยะ + 10)
    ป้ายระยะ.Text = "ระยะ: " .. ตั้งค่า.ระยะ
end)

ลบความเร็ว.MouseButton1Click:Connect(function()
    ตั้งค่า.ความเร็ว = math.max(1, ตั้งค่า.ความเร็ว - 1)
    ป้ายความเร็ว.Text = "ความเร็ว: " .. ตั้งค่า.ความเร็ว
end)

เพิ่มความเร็ว.MouseButton1Click:Connect(function()
    ตั้งค่า.ความเร็ว = math.min(20, ตั้งค่า.ความเร็ว + 1)
    ป้ายความเร็ว.Text = "ความเร็ว: " .. ตั้งค่า.ความเร็ว
end)

-- Loop ดูด
RunService.Heartbeat:Connect(function()
    if not ตั้งค่า.เปิด then return end
    local ตัวละคร = localPlayer.Character
    if not ตัวละคร then return end
    local hrp = ตัวละคร:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, ผู้เล่น in ipairs(Players:GetPlayers()) do
        if ผู้เล่น == localPlayer then continue end
        local ตัวละครเป้าหมาย = ผู้เล่น.Character
        if not ตัวละครเป้าหมาย then continue end
        local hrpเป้าหมาย = ตัวละครเป้าหมาย:FindFirstChild("HumanoidRootPart")
        if not hrpเป้าหมาย then continue end
        local ระยะห่าง = (hrpเป้าหมาย.Position - hrp.Position).Magnitude
        if ระยะห่าง > ตั้งค่า.ระยะ then continue end
        local ทิศทาง = (hrp.Position - hrpเป้าหมาย.Position).Unit
        hrpเป้าหมาย.CFrame = hrpเป้าหมาย.CFrame + (ทิศทาง * ตั้งค่า.ความเร็ว)
    end
end)

print("โหลดสำเร็จ - ระบบดูดผู้เล่น TSB")
