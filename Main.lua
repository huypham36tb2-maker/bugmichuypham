-- HUY PHAM X PHAM DANG - GOD OVERLORD v9999999 (GOD HUB)
-- Script hỗ trợ game Greed Grow / Roblox

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "⚡ HUY PHAM X PHAM DANG ⚡ [GOD HUB v9999999]",
   LoadingTitle = "HUY PHAM X PHAM DANG - GOD OVERLORD",
   LoadingSubtitle = "by Huy Pham X Pham Dang",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "HUY_PHAM_X_PHAM_DANG_HUB",
      FileName = "GreedGrowConfig"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

----------------------------------------------------
-- TAB 1: TỰ ĐỘNG NÔNG TRẠI (GOD MODE)
----------------------------------------------------
local FarmTab = Window:CreateTab("🌾 TỰ ĐỘNG NÔNG TRẠI (GOD MODE)", 4483362458)

local AutoSeed = FarmTab:CreateToggle({
   Name = "🌱 Auto Nhặt Hạt Giống (Only Seeds)",
   CurrentValue = false,
   Flag = "AutoSeedFlag",
   Callback = function(Value)
      _G.AutoSeed = Value
      task.spawn(function()
         while _G.AutoSeed do
            pcall(function()
               for _, v in pairs(workspace:GetChildren()) do
                  if v:IsA("BasePart") and (v.Name:find("Seed") or v.Name:find("Hạt")) then
                     v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                  end
               end
            end)
            task.wait(0.5)
         end
      end)
   end,
})

local AutoFruit = FarmTab:CreateToggle({
   Name = "🍎 Auto Hái Trái Cây (Only Fruits)",
   CurrentValue = false,
   Flag = "AutoFruitFlag",
   Callback = function(Value)
      _G.AutoFruit = Value
      task.spawn(function()
         while _G.AutoFruit do
            pcall(function()
               for _, v in pairs(workspace:GetChildren()) do
                  if v:IsA("BasePart") and (v.Name:find("Fruit") or v.Name:find("Trái")) then
                     v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                  end
               end
            end)
            task.wait(0.5)
         end
      end)
   end,
})

local AutoBuySeed = FarmTab:CreateToggle({
   Name = "🛒 Auto Mua Hạt Giống (Tầm Xe Vô Tận)",
   CurrentValue = false,
   Flag = "AutoBuySeedFlag",
   Callback = function(Value)
      _G.AutoBuySeed = Value
      task.spawn(function()
         while _G.AutoBuySeed do
            pcall(function()
               -- Đặt mã sự kiện (RemoteEvent) mua hạt giống tầm xa của game vào đây
            end)
            task.wait(1)
         end
      end)
   end,
})

----------------------------------------------------
-- TAB 2: HỆ THỐNG TREO MÁY ANTI-AFK
----------------------------------------------------
local AntiTab = Window:CreateTab("🛡️ HỆ THỐNG TREO MÁY ANTI-AFK", 4483362458)

local AntiAFK = AntiTab:CreateToggle({
   Name = "🔒 Anti-AFK (Chống Kick 20 Phút)",
   CurrentValue = true,
   Flag = "AntiAFKFlag",
   Callback = function(Value)
      _G.AntiAFK = Value
      if Value then
         local VirtualUser = game:GetService("VirtualUser")
         game:GetService("Players").LocalPlayer.Idled:Connect(function()
            if _G.AntiAFK then
               VirtualUser:CaptureController()
               VirtualUser:ClickButton2(Vector2.new())
            end
         end)
      end
   end,
})

local AlwaysBright = AntiTab:CreateToggle({
   Name = "💡 Giữ Màn Hình Điện Thoại Luôn Sáng",
   CurrentValue = false,
   Flag = "AlwaysBrightFlag",
   Callback = function(Value)
      if Value then
         game:GetService("Lighting").ClockTime = 12
         game:GetService("Lighting").GlobalShadows = false
      else
         game:GetService("Lighting").GlobalShadows = true
      end
   end,
})

----------------------------------------------------
-- TAB 3: MOVEMENT & OPTIMIZATION
----------------------------------------------------
local MoveTab = Window:CreateTab("⚡ MOVEMENT & OPTIMIZATION", 4483362458)

local Noclip = MoveTab:CreateToggle({
   Name = "🚀 Noclip (Xuyên Tường)",
   CurrentValue = false,
   Flag = "NoclipFlag",
   Callback = function(Value)
      _G.Noclip = Value
      game:GetService("RunService").Stepped:Connect(function()
         if _G.Noclip and game.Players.LocalPlayer.Character then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if part:IsA("BasePart") then
                  part.CanCollide = false
               end
            end
         end
      end)
   end,
})

local SpeedBoost = MoveTab:CreateToggle({
   Name = "⚡ Speed Boost (Tăng Tốc Độ Chạy)",
   CurrentValue = false,
   Flag = "SpeedBoostFlag",
   Callback = function(Value)
      _G.SpeedBoost = Value
      task.spawn(function()
         while _G.SpeedBoost do
            pcall(function()
               game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
            end)
            task.wait(0.1)
         end
         if not _G.SpeedBoost and game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
         end
      end)
   end,
})

local FixLag = MoveTab:CreateToggle({
   Name = "🛠️ Fix Lag Super Smooth (Giảm Lag Máy Yếu)",
   CurrentValue = false,
   Flag = "FixLagFlag",
   Callback = function(Value)
      if Value then
         for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("BasePart") then
               v.Material = Enum.Material.SmoothPlastic
            elseif v:IsA("Decal") or v:IsA("Texture") then
               v:Destroy()
            end
         end
      end
   end,
})

Rayfield:Notify({
   Title = "HUY PHAM X PHAM DANG - GOD HUB",
   Content = "Script đã được kích hoạt thành công!",
   Duration = 5,
   Image = 4483362458,
})
