-- NIGHTLESS HUB - PARTE 1
local Players=game:GetService("Players")
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Player=Players.LocalPlayer
local PlayerGui=Player:WaitForChild("PlayerGui")
local DefaultWalkSpeed=16
local DefaultJumpHeight=7.2
local DefaultGravity=196.2
local InfiniteJump=false
local Noclip=false
local Fly=false
local FlySpeed=50
local GodMode=false
local InfiniteYield=false
local FullBright=false
local NoFog=false
local FPSVisible=false
local ZoomLevel=1
local AutoTalk=false
local AntiAFK=false
local DanceActive=false
local BigHead=false
local ClickTeleport=false
local ESPAtivo=false
local FlyConnection=nil
local NoclipConnection=nil
local JumpConnection=nil
local MiraConexao=nil
local FPSConnection=nil
local AntiAFKConnection=nil
local TalkConnection=nil
local FullBrightConnection=nil
local NoFogConnection=nil
local BigHeadConnection=nil
local DanceConnection=nil
local MiraAtiva=false
local MiraFOV=100
local SavedPosition=nil
local ESPConexao=nil
local ESPObjects={}
local NPCModel=nil
local NPCName="NPC"
local NPCText="Ola!"
local NPCPlayerSkin=nil
local NPCBillboard=nil
local NPCDistanceCheck=nil-- NIGHTLESS HUB - PARTE 2
local Gui=Instance.new("ScreenGui")
Gui.Name="NightlessHub"
Gui.ResetOnSpawn=false
Gui.Parent=PlayerGui
local Main=Instance.new("Frame")
Main.Size=UDim2.new(0,450,0,450)
Main.Position=UDim2.new(0.5,-225,0.5,-225)
Main.BackgroundColor3=Color3.fromRGB(12,12,15)
Main.BackgroundTransparency=0.18
Main.BorderSizePixel=0
Main.Parent=Gui
local MainCorner=Instance.new("UICorner")
MainCorner.CornerRadius=UDim.new(0,12)
MainCorner.Parent=Main
local TopBar=Instance.new("Frame")
TopBar.Size=UDim2.new(1,0,0,40)
TopBar.BackgroundTransparency=1
TopBar.Parent=Main
local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(1,-100,0,20)
Title.Position=UDim2.fromOffset(12,4)
Title.BackgroundTransparency=1
Title.Text="NIGHTLESS HUB"
Title.TextColor3=Color3.fromRGB(245,245,245)
Title.TextSize=16
Title.Font=Enum.Font.GothamBold
Title.TextXAlignment=Enum.TextXAlignment.Left
Title.Parent=TopBar
local Creator=Instance.new("TextLabel")
Creator.Size=UDim2.new(1,-100,0,16)
Creator.Position=UDim2.fromOffset(12,24)
Creator.BackgroundTransparency=1
Creator.Text="by ScriptCreator109"
Creator.TextColor3=Color3.fromRGB(140,140,150)
Creator.TextSize=9
Creator.Font=Enum.Font.Gotham
Creator.TextXAlignment=Enum.TextXAlignment.Left
Creator.Parent=TopBar
local Minimize=Instance.new("TextButton")
Minimize.Size=UDim2.fromOffset(25,25)
Minimize.Position=UDim2.new(1,-65,0,8)
Minimize.BackgroundTransparency=1
Minimize.Text="-"
Minimize.TextColor3=Color3.fromRGB(190,190,200)
Minimize.TextSize=16
Minimize.Font=Enum.Font.GothamBold
Minimize.Parent=TopBar
local Close=Instance.new("TextButton")
Close.Size=UDim2.fromOffset(25,25)
Close.Position=UDim2.new(1,-35,0,8)
Close.BackgroundTransparency=1
Close.Text="X"
Close.TextColor3=Color3.fromRGB(220,100,100)
Close.TextSize=18
Close.Font=Enum.Font.GothamBold
Close.Parent=TopBar-- NIGHTLESS HUB - PARTE 3
Close.MouseButton1Click:Connect(function()
if JumpConnection then JumpConnection:Disconnect() end
if NoclipConnection then NoclipConnection:Disconnect() end
if FlyConnection then FlyConnection:Disconnect() end
if MiraConexao then MiraConexao:Disconnect() end
if AntiAFKConnection then AntiAFKConnection:Disconnect() end
if TalkConnection then TalkConnection:Disconnect() end
if FullBrightConnection then FullBrightConnection:Disconnect() end
if NoFogConnection then NoFogConnection:Disconnect() end
if BigHeadConnection then BigHeadConnection:Disconnect() end
if DanceConnection then DanceConnection:Disconnect() end
if FPSConnection then FPSConnection:Disconnect() end
if ESPConexao then ESPConexao:Disconnect() end
for _,obj in pairs(ESPObjects) do if obj and obj.Parent then obj:Destroy() end end
if NPCModel then NPCModel:Destroy() end
Gui:Destroy() end)
Close.TouchTap:Connect(function()
if JumpConnection then JumpConnection:Disconnect() end
if NoclipConnection then NoclipConnection:Disconnect() end
if FlyConnection then FlyConnection:Disconnect() end
if MiraConexao then MiraConexao:Disconnect() end
if AntiAFKConnection then AntiAFKConnection:Disconnect() end
if TalkConnection then TalkConnection:Disconnect() end
if FullBrightConnection then FullBrightConnection:Disconnect() end
if NoFogConnection then NoFogConnection:Disconnect() end
if BigHeadConnection then BigHeadConnection:Disconnect() end
if DanceConnection then DanceConnection:Disconnect() end
if FPSConnection then FPSConnection:Disconnect() end
if ESPConexao then ESPConexao:Disconnect() end
for _,obj in pairs(ESPObjects) do if obj and obj.Parent then obj:Destroy() end end
if NPCModel then NPCModel:Destroy() end
Gui:Destroy() end)
local Sidebar=Instance.new("Frame")
Sidebar.Size=UDim2.fromOffset(80,400)
Sidebar.Position=UDim2.fromOffset(5,48)
Sidebar.BackgroundColor3=Color3.fromRGB(20,20,24)
Sidebar.BackgroundTransparency=0.35
Sidebar.BorderSizePixel=0
Sidebar.Parent=Main
local SidebarCorner=Instance.new("UICorner")
SidebarCorner.CornerRadius=UDim.new(0,9)
SidebarCorner.Parent=Sidebar
local Abas={}
local AbasNomes={"PLAYER","TROLL","MIRA","TELEPORT","VISUAL","AUTOMACAO","FUN"}
local AbasCores={Color3.fromRGB(65,65,75),Color3.fromRGB(55,45,55),Color3.fromRGB(45,55,75),Color3.fromRGB(45,65,55),Color3.fromRGB(65,55,45),Color3.fromRGB(45,55,65),Color3.fromRGB(65,45,55)}
for i,nome in ipairs(AbasNomes)do
local btn=Instance.new("TextButton")
btn.Size=UDim2.new(1,-8,0,28)
btn.Position=UDim2.fromOffset(4,6+(i-1)*34)
btn.BackgroundColor3=AbasCores[i]
btn.BackgroundTransparency=0.25
btn.BorderSizePixel=0
btn.Text=nome
btn.TextColor3=Color3.fromRGB(255,255,255)
btn.TextSize=10
btn.Font=Enum.Font.GothamBold
btn.TextXAlignment=Enum.TextXAlignment.Center
btn.Parent=Sidebar
Abas[nome]=btn
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,5)
corner.Parent=btn end-- NIGHTLESS HUB - PARTE 4
local function CriarScroll(nome)
local scroll=Instance.new("ScrollingFrame")
scroll.Name=nome
scroll.Size=UDim2.new(1,-100,1,-58)
scroll.Position=UDim2.fromOffset(95,50)
scroll.BackgroundTransparency=1
scroll.BorderSizePixel=0
scroll.ScrollBarThickness=6
scroll.ScrollBarImageTransparency=0.35
scroll.CanvasSize=UDim2.fromOffset(0,0)
scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
scroll.ScrollingDirection=Enum.ScrollingDirection.Y
scroll.Visible=false
scroll.Parent=Main
local layout=Instance.new("UIListLayout")
layout.Padding=UDim.new(0,4)
layout.SortOrder=Enum.SortOrder.LayoutOrder
layout.Parent=scroll
return scroll end
local ScrollPlayer=CriarScroll("ScrollPlayer")
local ScrollTroll=CriarScroll("ScrollTroll")
local ScrollMira=CriarScroll("ScrollMira")
local ScrollTeleport=CriarScroll("ScrollTeleport")
local ScrollVisual=CriarScroll("ScrollVisual")
local ScrollAutomacao=CriarScroll("ScrollAutomacao")
local ScrollFun=CriarScroll("ScrollFun")
ScrollPlayer.Visible=true
local function CreateToggle(Scroll,Name,Order,Callback)
local Box=Instance.new("Frame")
Box.Size=UDim2.new(1,-5,0,38)
Box.BackgroundColor3=Color3.fromRGB(25,25,30)
Box.BackgroundTransparency=0.3
Box.BorderSizePixel=0
Box.LayoutOrder=Order
Box.Parent=Scroll
local Corner=Instance.new("UICorner")
Corner.CornerRadius=UDim.new(0,6)
Corner.Parent=Box
local Label=Instance.new("TextLabel")
Label.Size=UDim2.new(0.55,0,1,0)
Label.Position=UDim2.fromOffset(10,0)
Label.BackgroundTransparency=1
Label.Text=Name
Label.TextColor3=Color3.fromRGB(235,235,240)
Label.TextSize=12
Label.Font=Enum.Font.GothamMedium
Label.TextXAlignment=Enum.TextXAlignment.Left
Label.Parent=Box
local Button=Instance.new("TextButton")
Button.Size=UDim2.fromOffset(50,24)
Button.Position=UDim2.new(1,-60,0.5,-12)
Button.BackgroundColor3=Color3.fromRGB(45,45,52)
Button.BorderSizePixel=0
Button.Text="OFF"
Button.TextColor3=Color3.fromRGB(180,180,185)
Button.TextSize=10
Button.Font=Enum.Font.GothamBold
Button.Parent=Box
local ButtonCorner=Instance.new("UICorner")
ButtonCorner.CornerRadius=UDim.new(0,5)
ButtonCorner.Parent=Button
local Enabled=false
Button.MouseButton1Click:Connect(function()
Enabled=not Enabled
if Enabled then Button.Text="ON" Button.BackgroundColor3=Color3.fromRGB(75,120,85) Button.TextColor3=Color3.fromRGB(255,255,255)
else Button.Text="OFF" Button.BackgroundColor3=Color3.fromRGB(45,45,52) Button.TextColor3=Color3.fromRGB(180,180,185) end
Callback(Enabled)end)
return Button end-- NIGHTLESS HUB - PARTE 5
local function CreateInput(Scroll,Name,Default,Order,Callback)
local Box=Instance.new("Frame")
Box.Size=UDim2.new(1,-5,0,46)
Box.BackgroundColor3=Color3.fromRGB(25,25,30)
Box.BackgroundTransparency=0.3
Box.BorderSizePixel=0
Box.LayoutOrder=Order
Box.Parent=Scroll
local Corner=Instance.new("UICorner")
Corner.CornerRadius=UDim.new(0,6)
Corner.Parent=Box
local Label=Instance.new("TextLabel")
Label.Size=UDim2.new(0.5,0,1,0)
Label.Position=UDim2.fromOffset(10,0)
Label.BackgroundTransparency=1
Label.Text=Name
Label.TextColor3=Color3.fromRGB(235,235,240)
Label.TextSize=12
Label.Font=Enum.Font.GothamMedium
Label.TextXAlignment=Enum.TextXAlignment.Left
Label.Parent=Box
local Input=Instance.new("TextBox")
Input.Size=UDim2.fromOffset(60,26)
Input.Position=UDim2.new(1,-70,0.5,-13)
Input.BackgroundColor3=Color3.fromRGB(50,50,58)
Input.BackgroundTransparency=0.2
Input.BorderSizePixel=0
Input.Text=tostring(Default)
Input.TextColor3=Color3.fromRGB(255,255,255)
Input.TextSize=12
Input.Font=Enum.Font.Gotham
Input.ClearTextOnFocus=false
Input.Parent=Box
local InputCorner=Instance.new("UICorner")
InputCorner.CornerRadius=UDim.new(0,5)
InputCorner.Parent=Input
Input.FocusLost:Connect(function()
local Value=tonumber(Input.Text)
if Value then Callback(Value)
else Input.Text=tostring(Default) end end)
return Input end
local function CreateActionButton(Scroll,Name,Order,Callback)
local Box=Instance.new("Frame")
Box.Size=UDim2.new(1,-5,0,38)
Box.BackgroundColor3=Color3.fromRGB(25,25,30)
Box.BackgroundTransparency=0.3
Box.BorderSizePixel=0
Box.LayoutOrder=Order
Box.Parent=Scroll
local Corner=Instance.new("UICorner")
Corner.CornerRadius=UDim.new(0,6)
Corner.Parent=Box
local Button=Instance.new("TextButton")
Button.Size=UDim2.new(1,-14,1,-8)
Button.Position=UDim2.fromOffset(7,4)
Button.BackgroundColor3=Color3.fromRGB(50,35,40)
Button.BackgroundTransparency=0.2
Button.BorderSizePixel=0
Button.Text=Name
Button.TextColor3=Color3.fromRGB(255,255,255)
Button.TextSize=12
Button.Font=Enum.Font.GothamBold
Button.Parent=Box
local ButtonCorner=Instance.new("UICorner")
ButtonCorner.CornerRadius=UDim.new(0,5)
ButtonCorner.Parent=Button
Button.MouseButton1Click:Connect(Callback)
return Button end-- NIGHTLESS HUB - PARTE 6
local function TeleportToPlayer(p)
if not p then return end
local c=p.Character
if not c then return end
local r=c:FindFirstChild("HumanoidRootPart")
if not r then return end
local mc=Player.Character
if not mc then return end
local mr=mc:FindFirstChild("HumanoidRootPart")
if mr then mr.CFrame=r.CFrame+Vector3.new(0,3,0) end end
local function ToggleFullBright(s)
if s then FullBrightConnection=RunService.RenderStepped:Connect(function()
for _,v in pairs(Workspace:GetDescendants())do if v:IsA("BasePart")and not v.Parent:IsA("Tool")then v.Material=Enum.Material.Plastic end end
Workspace.CurrentCamera.Brightness=2 Workspace.CurrentCamera.ExposureCompensation=2 end)
else if FullBrightConnection then FullBrightConnection:Disconnect() FullBrightConnection=nil end
Workspace.CurrentCamera.Brightness=0 Workspace.CurrentCamera.ExposureCompensation=0 end end
local function ToggleNoFog(s)
if s then NoFogConnection=RunService.RenderStepped:Connect(function()
for _,v in pairs(Workspace:GetDescendants())do if v:IsA("Atmosphere")or v:IsA("Fog")then v.Enabled=false end end
Workspace.CurrentCamera.FogEnd=9e9 end)
else if NoFogConnection then NoFogConnection:Disconnect() NoFogConnection=nil end
Workspace.CurrentCamera.FogEnd=1000 end end
local function StartAntiAFK()
AntiAFKConnection=RunService.RenderStepped:Connect(function()
local c=Player.Character
if c then local h=c:FindFirstChildOfClass("Humanoid")
if h then h:ChangeState(Enum.HumanoidStateType.Jumping)task.wait(0.1)h:ChangeState(Enum.HumanoidStateType.Landed)end end end)end
local function StartAutoTalk()
local msgs={"Hello!","Nightless Hub!","AutoTalk!","Join us!"}
TalkConnection=RunService.RenderStepped:Connect(function()
if not AutoTalk then TalkConnection:Disconnect() TalkConnection=nil return end
local msg=msgs[math.random(1,#msgs)]
local ce=ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
if ce then local sm=ce:FindFirstChild("SayMessageRequest")
if sm then sm:FireServer(msg,"All")end end
task.wait(3)end)end-- NIGHTLESS HUB - PARTE 7
local function StartDance()
local ang=0
DanceConnection=RunService.RenderStepped:Connect(function()
if not DanceActive then DanceConnection:Disconnect() DanceConnection=nil return end
local c=Player.Character
if c then local r=c:FindFirstChild("HumanoidRootPart")
if r then ang=ang+0.05 r.CFrame=r.CFrame*CFrame.Angles(0,math.rad(3),math.sin(ang)*0.03)
local h=c:FindFirstChildOfClass("Humanoid")
if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end
task.wait(0.05)end end end)end
local function ToggleBigHead(s)
local c=Player.Character if not c then return end
local h=c:FindFirstChild("Head")if not h then return end
if s then h.Size=h.Size*2
BigHeadConnection=RunService.RenderStepped:Connect(function()
if not BigHead then BigHeadConnection:Disconnect() BigHeadConnection=nil
local cc=Player.Character if cc then local ch=cc:FindFirstChild("Head")if ch then ch.Size=ch.Size/2 end end return end end)
else if BigHeadConnection then BigHeadConnection:Disconnect() BigHeadConnection=nil end
h.Size=h.Size/2 end end
local function AtivarESP()
ESPConexao=RunService.RenderStepped:Connect(function()
if not ESPAtivo then ESPConexao:Disconnect() ESPConexao=nil
for _,obj in pairs(ESPObjects)do if obj and obj.Parent then obj:Destroy()end end ESPObjects={} return end
for _,obj in pairs(ESPObjects)do if obj and obj.Parent then obj:Destroy()end end ESPObjects={}
for _,p in pairs(Players:GetPlayers())do if p~=Player then
local c=p.Character if c then local r=c:FindFirstChild("HumanoidRootPart")
if r then
local b=Instance.new("BoxHandleAdornment") b.Size=Vector3.new(4,5,2) b.Adornee=r b.AlwaysOnTop=true b.ZIndex=10 b.Color3=Color3.fromRGB(255,0,0) b.Transparency=0.3 b.Parent=r table.insert(ESPObjects,b)
local nt=Instance.new("BillboardGui") nt.Size=UDim2.new(0,200,0,40) nt.Adornee=r nt.AlwaysOnTop=true nt.Parent=r table.insert(ESPObjects,nt)
local nl=Instance.new("TextLabel") nl.Size=UDim2.new(1,0,1,0) nl.BackgroundTransparency=1 nl.Text=p.Name nl.TextColor3=Color3.fromRGB(255,255,255) nl.TextSize=16 nl.Font=Enum.Font.GothamBold nl.TextStrokeTransparency=0.5 nl.TextStrokeColor3=Color3.fromRGB(0,0,0) nl.Parent=nt table.insert(ESPObjects,nl)end end end end end)end-- NIGHTLESS HUB - PARTE 8 (FINAL)
local function CreateNPC(skin,talk,name)
if NPCModel then NPCModel:Destroy() NPCModel=nil end
if NPCBillboard then NPCBillboard:Destroy() NPCBillboard=nil end
if NPCDistanceCheck then NPCDistanceCheck:Disconnect() NPCDistanceCheck=nil end
local npc=Instance.new("Model") npc.Name="NPC_NightlessHub"
local h=Instance.new("Humanoid") h.Name="Humanoid" h.Parent=npc
local rp=Instance.new("Part") rp.Name="HumanoidRootPart" rp.Size=Vector3.new(2,1,1) rp.CanCollide=true rp.Anchored=false rp.Parent=npc
local parts={"Torso","Head","Left Arm","Right Arm","Left Leg","Right Leg"}
local sizes={Vector3.new(2,1.5,1),Vector3.new(1.5,1.5,1.5),Vector3.new(0.5,1.5,0.5),Vector3.new(0.5,1.5,0.5),Vector3.new(0.5,1.5,0.5),Vector3.new(0.5,1.5,0.5)}
for i,pn in ipairs(parts)do local p=Instance.new("Part") p.Name=pn p.Size=sizes[i] p.CanCollide=true p.Color=Color3.fromRGB(200,180,160) p.Parent=npc end
if skin and skin~=""then local tp=nil for _,p in pairs(Players:GetPlayers())do if string.lower(p.Name)==string.lower(skin)then tp=p break end end
if tp and tp.Character then for _,c in pairs(tp.Character:GetChildren())do if c:IsA("BasePart")then local part=npc:FindFirstChild(c.Name)if part then part.Color=c.Color part.Material=c.Material part.Size=c.Size end end end
print("Skin do player "..tp.Name.." aplicada!")else local colors={Color3.fromRGB(255,0,0),Color3.fromRGB(0,255,0),Color3.fromRGB(0,0,255),Color3.fromRGB(255,255,0),Color3.fromRGB(255,0,255),Color3.fromRGB(0,255,255)}
for _,part in pairs(npc:GetChildren())do if part:IsA("BasePart")and part.Name~="HumanoidRootPart"then part.Color=colors[math.random(1,#colors)]end end
print("Skin aleatoria aplicada!")end end
local mc=Player.Character if mc then local mr=mc:FindFirstChild("HumanoidRootPart")if mr then npc:SetPrimaryPartCFrame(mr.CFrame+Vector3.new(0,0,5))end end
npc.Parent=Workspace NPCModel=npc
local head=npc:FindFirstChild("Head")if head then
local nb=Instance.new("BillboardGui") nb.Name="NPCName" nb.Adornee=head nb.Size=UDim2.new(0,200,0,30) nb.StudsOffset=Vector3.new(0,3.5,0) nb.AlwaysOnTop=true nb.Parent=npc
local nl=Instance.new("TextLabel") nl.Size=UDim2.new(1,0,1,0) nl.BackgroundTransparency=1 nl.Text=name or "NPC" nl.TextColor3=Color3.fromRGB(255,255,0) nl.TextSize=18 nl.Font=Enum.Font.GothamBold nl.TextStrokeTransparency=0.5 nl.TextStrokeColor3=Color3.fromRGB(0,0,0) nl.Parent=nb end
if talk and talk~=""then if head then
NPCBillboard=Instance.new("BillboardGui") NPCBillboard.Name="NPCTalk" NPCBillboard.Adornee=head NPCBillboard.Size=UDim2.new(0,250,0,50) NPCBillboard.StudsOffset=Vector3.new(0,2.5,0) NPCBillboard.AlwaysOnTop=true NPCBillboard.Parent=npc
local tl=Instance.new("TextLabel") tl.Size=UDim2.new(1,0,1,0) tl.BackgroundTransparency=1 tl.Text=talk tl.TextColor3=Color3.fromRGB(255,255,255) tl.TextSize=16 tl.Font=Enum.Font.GothamBold tl.TextStrokeTransparency=0.5 tl.TextStrokeColor3=Color3.fromRGB(0,0,0) tl.Parent=NPCBillboard
NPCDistanceCheck=RunService.RenderStepped:Connect(function()if not NPCModel or not NPCModel.Parent then NPCDistanceCheck:Disconnect() NPCDistanceCheck=nil return end
local mc=Player.Character if not mc then return end local mr=mc:FindFirstChild("HumanoidRootPart")if not mr then return end
local nr=npc:FindFirstChild("HumanoidRootPart")if not nr then return end
local dist=(mr.Position-nr.Position).Magnitude
if dist<20 then tl.Text=talk tl.TextSize=16 elseif dist<40 then tl.Text=talk tl.TextSize=12 elseif dist<60 then tl.Text="..." tl.TextSize=20 else tl.Text="" end end)
local ce=ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")if ce then local sm=ce:FindFirstChild("SayMessageRequest")if sm then sm:FireServer("[NPC] "..talk,"All")end end end end
print("NPC criado! Nome:"..(name or"NPC").." Texto:"..(talk or"Nenhum"))return npc end
print("NIGHTLESS HUB CARREGADO!") -- NIGHTLESS HUB - PARTE 9 (CONECTANDO TUDO)
local function AtivarAimbot()
MiraConexao=RunService.RenderStepped:Connect(function()
if not MiraAtiva then MiraConexao:Disconnect() MiraConexao=nil return end
local mc=Player.Character if not mc then return end
local mr=mc:FindFirstChild("HumanoidRootPart")if not mr then return end
local cam=Workspace.CurrentCamera if not cam then return end
local closest=nil local closestDist=MiraFOV
for _,p in pairs(Players:GetPlayers())do if p~=Player then
local c=p.Character if c then local r=c:FindFirstChild("HumanoidRootPart")if r then
local dist=(r.Position-mr.Position).Magnitude if dist<closestDist then closestDist=dist closest=p end end end end end
if closest then local c=closest.Character if c then local r=c:FindFirstChild("HumanoidRootPart")if r then
local lookAt=r.Position local cp=cam.CFrame.Position cam.CFrame=CFrame.new(cp,lookAt)end end end end)end
local SectionPlayer=Instance.new("TextLabel")
SectionPlayer.Size=UDim2.new(1,-5,0,20)
SectionPlayer.BackgroundTransparency=1
SectionPlayer.Text="PLAYER"
SectionPlayer.TextColor3=Color3.fromRGB(240,240,245)
SectionPlayer.TextSize=14
SectionPlayer.Font=Enum.Font.GothamBold
SectionPlayer.TextXAlignment=Enum.TextXAlignment.Left
SectionPlayer.LayoutOrder=1
SectionPlayer.Parent=ScrollPlayer
CreateInput(ScrollPlayer,"WalkSpeed",DefaultWalkSpeed,2,function(v)
local c=Player.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=v end end)
CreateInput(ScrollPlayer,"JumpHeight",DefaultJumpHeight,3,function(v)
local c=Player.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h.UseJumpPower=false h.JumpHeight=v end end)
CreateInput(ScrollPlayer,"Gravity",DefaultGravity,4,function(v)Workspace.Gravity=v end)
CreateToggle(ScrollPlayer,"Infinite Jump",5,function(s)
InfiniteJump=s if JumpConnection then JumpConnection:Disconnect() JumpConnection=nil end
if InfiniteJump then JumpConnection=UserInputService.JumpRequest:Connect(function()
local c=Player.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end end)end end)
CreateToggle(ScrollPlayer,"Noclip",6,function(s)
Noclip=s if NoclipConnection then NoclipConnection:Disconnect() NoclipConnection=nil end
if Noclip then NoclipConnection=RunService.Stepped:Connect(function()
local c=Player.Character if not c then return end
for _,obj in ipairs(c:GetDescendants())do if obj:IsA("BasePart")then obj.CanCollide=false end end end)end end)
CreateToggle(ScrollPlayer,"Fly",7,function(s)
Fly=s if FlyConnection then FlyConnection:Disconnect() FlyConnection=nil end
local c=Player.Character local h=c and c:FindFirstChildOfClass("Humanoid")local r=c and c:FindFirstChild("HumanoidRootPart")
if not s then if h then h.PlatformStand=false end if r then r.AssemblyLinearVelocity=Vector3.zero end return end
if not c or not h or not r then return end h.PlatformStand=true
FlyConnection=RunService.RenderStepped:Connect(function()if not Fly then return end
local cc=Player.Character if not cc then return end
local ch=cc:FindFirstChildOfClass("Humanoid")local cr=cc:FindFirstChild("HumanoidRootPart")local cam=Workspace.CurrentCamera
if not ch or not cr or not cam then return end
local md=ch.MoveDirection local cl=cam.CFrame.LookVector local crv=cam.CFrame.RightVector
if md.Magnitude>0.05 then local fa=md:Dot(cl)local ra=md:Dot(crv)local dir=(cl*fa)+(crv*ra)if dir.Magnitude>0 then dir=dir.Unit cr.AssemblyLinearVelocity=dir*FlySpeed end
else cr.AssemblyLinearVelocity=Vector3.zero end ch.PlatformStand=true end)end)
CreateToggle(ScrollPlayer,"GodMode",8,function(s)
GodMode=s local c=Player.Character if not c then return end local h=c:FindFirstChildOfClass("Humanoid")if h then
if GodMode then h.MaxHealth=math.huge h.Health=math.huge h.BreakJointsOnDeath=false
else h.MaxHealth=100 h.Health=100 h.BreakJointsOnDeath=true end end end)
CreateToggle(ScrollPlayer,"Infinite Yield",9,function(s)
InfiniteYield=s if InfiniteYield then
for _,tool in pairs(Player.Backpack:GetChildren())do if tool:IsA("Tool")then tool.Parent=Player.Character end end
print("Infinite Yield ativado!")else print("Infinite Yield desativado")end end)
CreateActionButton(ScrollPlayer,"Script Loader",10,function()
local fr=Instance.new("Frame")fr.Size=UDim2.new(1,-10,0,80)fr.BackgroundColor3=Color3.fromRGB(25,25,30)fr.BackgroundTransparency=0.3 fr.BorderSizePixel=0 fr.Parent=ScrollPlayer
local lb=Instance.new("TextLabel")lb.Size=UDim2.new(1,0,0,20)lb.BackgroundTransparency=1 lb.Text="Cole o script abaixo e clique em EXECUTAR"lb.TextColor3=Color3.fromRGB(200,200,200)lb.TextSize=11 lb.Font=Enum.Font.Gotham lb.Parent=fr
local tb=Instance.new("TextBox")tb.Size=UDim2.new(1,0,0,35)tb.Position=UDim2.new(0,0,0,22)tb.BackgroundColor3=Color3.fromRGB(40,40,50)tb.TextColor3=Color3.fromRGB(255,255,255)tb.Text=""tb.PlaceholderText="Cole o script aqui..."tb.TextSize=12 tb.Font=Enum.Font.Gotham tb.ClearTextOnFocus=true tb.Parent=fr
local eb=Instance.new("TextButton")eb.Size=UDim2.new(1,0,0,25)eb.Position=UDim2.new(0,0,0,60)eb.BackgroundColor3=Color3.fromRGB(0,160,0)eb.Text="EXECUTAR"eb.TextColor3=Color3.fromRGB(255,255,255)eb.Font=Enum.Font.GothamBold eb.TextSize=12 eb.Parent=fr
eb.MouseButton1Click:Connect(function()local scriptText=tb.Text if scriptText and scriptText~=""then loadstring(scriptText)()print("Script executado!")end end)end)
local SectionTroll=Instance.new("TextLabel")
SectionTroll.Size=UDim2.new(1,-5,0,20)
SectionTroll.BackgroundTransparency=1
SectionTroll.Text="TROLL"
SectionTroll.TextColor3=Color3.fromRGB(255,180,180)
SectionTroll.TextSize=14
SectionTroll.Font=Enum.Font.GothamBold
SectionTroll.TextXAlignment=Enum.TextXAlignment.Left
SectionTroll.LayoutOrder=1
SectionTroll.Parent=ScrollTroll
CreateActionButton(ScrollTroll,"ANNOY",2,function()print("Carregando ANNOY...")loadstring(game:HttpGet("https://pastebin.com/raw/MbQkURD1"))()end)
CreateActionButton(ScrollTroll,"FLING",3,function()print("Carregando FLING...")loadstring(game:HttpGet("https://pastebin.com/raw/2tTWjAQW"))()end)
local SectionMira=Instance.new("TextLabel")
SectionMira.Size=UDim2.new(1,-5,0,20)
SectionMira.BackgroundTransparency=1
SectionMira.Text="MIRA"
SectionMira.TextColor3=Color3.fromRGB(180,220,255)
SectionMira.TextSize=14
SectionMira.Font=Enum.Font.GothamBold
SectionMira.TextXAlignment=Enum.TextXAlignment.Left
SectionMira.LayoutOrder=1
SectionMira.Parent=ScrollMira
CreateToggle(ScrollMira,"AIMBOT",2,function(s)
MiraAtiva=s if MiraAtiva then print("AIMBOT ATIVADO")AtivarAimbot()
else if MiraConexao then MiraConexao:Disconnect() MiraConexao=nil end print("AIMBOT DESATIVADO")end end)
CreateInput(ScrollMira,"FOV (Distancia)",100,3,function(v)MiraFOV=v print("FOV ajustado para: "..v)end)
CreateToggle(ScrollMira,"ESP PLAYERS",4,function(s)
ESPAtivo=s if ESPAtivo then print("ESP ATIVADO")AtivarESP()
else if ESPConexao then ESPConexao:Disconnect() ESPConexao=nil end
for _,obj in pairs(ESPObjects)do if obj and obj.Parent then obj:Destroy()end end ESPObjects={} print("ESP DESATIVADO")end end)-- NIGHTLESS HUB - PARTE 10 (FINAL)
local SectionTeleport=Instance.new("TextLabel")
SectionTeleport.Size=UDim2.new(1,-5,0,20)
SectionTeleport.BackgroundTransparency=1
SectionTeleport.Text="TELEPORT"
SectionTeleport.TextColor3=Color3.fromRGB(180,255,200)
SectionTeleport.TextSize=14
SectionTeleport.Font=Enum.Font.GothamBold
SectionTeleport.TextXAlignment=Enum.TextXAlignment.Left
SectionTeleport.LayoutOrder=1
SectionTeleport.Parent=ScrollTeleport
CreateActionButton(ScrollTeleport,"Teleport to Player",2,function()
local players={}for _,p in pairs(Players:GetPlayers())do if p~=Player then table.insert(players,p)end end
if #players==0 then print("Nenhum player disponivel!")return end
local fr=Instance.new("Frame")fr.Size=UDim2.new(1,-10,0,100)fr.BackgroundColor3=Color3.fromRGB(25,25,30)fr.BackgroundTransparency=0.3 fr.BorderSizePixel=0 fr.Parent=ScrollTeleport
local lb=Instance.new("TextLabel")lb.Size=UDim2.new(1,0,0,20)lb.BackgroundTransparency=1 lb.Text="Digite o numero do player:"lb.TextColor3=Color3.fromRGB(200,200,200)lb.TextSize=12 lb.Font=Enum.Font.Gotham lb.Parent=fr
local ll=Instance.new("TextLabel")ll.Size=UDim2.new(1,0,0,20)ll.Position=UDim2.new(0,0,0,20)ll.BackgroundTransparency=1 local names=""for i,p in ipairs(players)do names=names..i.."."..p.Name.." "end ll.Text=names ll.TextColor3=Color3.fromRGB(255,255,200)ll.TextSize=10 ll.Font=Enum.Font.Gotham ll.Parent=fr
local inp=Instance.new("TextBox")inp.Size=UDim2.new(0.6,0,0,25)inp.Position=UDim2.new(0,0,0,45)inp.BackgroundColor3=Color3.fromRGB(40,40,50)inp.TextColor3=Color3.fromRGB(255,255,255)inp.PlaceholderText="Numero..."inp.TextSize=12 inp.Font=Enum.Font.Gotham inp.ClearTextOnFocus=true inp.Parent=fr
local btn=Instance.new("TextButton")btn.Size=UDim2.new(0.35,0,0,25)btn.Position=UDim2.new(0.62,0,0,45)btn.BackgroundColor3=Color3.fromRGB(0,160,0)btn.Text="TELEPORTAR"btn.TextColor3=Color3.fromRGB(255,255,255)btn.Font=Enum.Font.GothamBold btn.TextSize=12 btn.Parent=fr
btn.MouseButton1Click:Connect(function()local num=tonumber(inp.Text)if num and num<=#players then TeleportToPlayer(players[num])print("Teleportado para "..players[num].Name)else print("Numero invalido!")end end)end)
local clickConn=nil
CreateToggle(ScrollTeleport,"Click Teleport",3,function(s)
if s then if clickConn then clickConn:Disconnect()end
local mouse=Player:GetMouse()ClickTeleport=true
clickConn=mouse.Button1Down:Connect(function()if ClickTeleport then local target=mouse.Hit.Position local mc=Player.Character if mc then local mr=mc:FindFirstChild("HumanoidRootPart")if mr then mr.CFrame=CFrame.new(target+Vector3.new(0,3,0))end end end end)
print("Click Teleport ativado!")else ClickTeleport=false if clickConn then clickConn:Disconnect()clickConn=nil end print("Click Teleport desativado")end end)
CreateActionButton(ScrollTeleport,"Salvar Posicao",4,function()
local c=Player.Character if not c then return end local r=c:FindFirstChild("HumanoidRootPart")if r then SavedPosition=r.CFrame print("Posicao salva!")end end)
CreateActionButton(ScrollTeleport,"Voltar para Posicao Salva",5,function()
if not SavedPosition then print("Nenhuma posicao salva!")return end
local c=Player.Character if not c then return end local r=c:FindFirstChild("HumanoidRootPart")if r then r.CFrame=SavedPosition print("Voltou para posicao salva!")end end)
local SectionVisual=Instance.new("TextLabel")
SectionVisual.Size=UDim2.new(1,-5,0,20)
SectionVisual.BackgroundTransparency=1
SectionVisual.Text="VISUAL"
SectionVisual.TextColor3=Color3.fromRGB(255,220,180)
SectionVisual.TextSize=14
SectionVisual.Font=Enum.Font.GothamBold
SectionVisual.TextXAlignment=Enum.TextXAlignment.Left
SectionVisual.LayoutOrder=1
SectionVisual.Parent=ScrollVisual
CreateToggle(ScrollVisual,"Full Bright",2,function(s)FullBright=s ToggleFullBright(FullBright)if FullBright then print("Full Bright ATIVADO")else print("Full Bright DESATIVADO")end end)
CreateToggle(ScrollVisual,"No Fog",3,function(s)NoFog=s ToggleNoFog(NoFog)if NoFog then print("No Fog ATIVADO")else print("No Fog DESATIVADO")end end)
CreateToggle(ScrollVisual,"FPS Counter",4,function(s)
FPSVisible=s if FPSVisible then
local fps=Instance.new("TextLabel")fps.Name="FPSLabel"fps.Size=UDim2.new(0,80,0,30)fps.Position=UDim2.new(0,10,0,10)fps.BackgroundColor3=Color3.fromRGB(0,0,0)fps.BackgroundTransparency=0.5 fps.TextColor3=Color3.fromRGB(0,255,0)fps.TextSize=16 fps.Font=Enum.Font.GothamBold fps.Text="FPS: 0"fps.Parent=Gui
local frames=0 local lastTime=tick()
FPSConnection=RunService.RenderStepped:Connect(function()frames=frames+1 local currentTime=tick()if currentTime-lastTime>=1 then fps.Text="FPS: "..frames frames=0 lastTime=currentTime end end)
else if FPSConnection then FPSConnection:Disconnect() FPSConnection=nil end
local fpsLabel=Gui:FindFirstChild("FPSLabel")if fpsLabel then fpsLabel:Destroy()end end end)
CreateInput(ScrollVisual,"Zoom",1,5,function(v)ZoomLevel=v local cam=Workspace.CurrentCamera if cam then cam.FieldOfView=ZoomLevel*70 end end)
local SectionAuto=Instance.new("TextLabel")
SectionAuto.Size=UDim2.new(1,-5,0,20)
SectionAuto.BackgroundTransparency=1
SectionAuto.Text="AUTOMACAO"
SectionAuto.TextColor3=Color3.fromRGB(180,255,180)
SectionAuto.TextSize=14
SectionAuto.Font=Enum.Font.GothamBold
SectionAuto.TextXAlignment=Enum.TextXAlignment.Left
SectionAuto.LayoutOrder=1
SectionAuto.Parent=ScrollAutomacao
CreateToggle(ScrollAutomacao,"Anti-AFK",2,function(s)
AntiAFK=s if AntiAFK then StartAntiAFK()print("Anti-AFK ATIVADO")
else if AntiAFKConnection then AntiAFKConnection:Disconnect() AntiAFKConnection=nil end print("Anti-AFK DESATIVADO")end end)
CreateToggle(ScrollAutomacao,"Auto-Talk",3,function(s)
AutoTalk=s if AutoTalk then StartAutoTalk()print("Auto-Talk ATIVADO")
else if TalkConnection then TalkConnection:Disconnect() TalkConnection=nil end print("Auto-Talk DESATIVADO")end end)
local SectionFun=Instance.new("TextLabel")
SectionFun.Size=UDim2.new(1,-5,0,20)
SectionFun.BackgroundTransparency=1
SectionFun.Text="FUN"
SectionFun.TextColor3=Color3.fromRGB(255,200,255)
SectionFun.TextSize=14
SectionFun.Font=Enum.Font.GothamBold
SectionFun.TextXAlignment=Enum.TextXAlignment.Left
SectionFun.LayoutOrder=1
SectionFun.Parent=ScrollFun
CreateInput(ScrollFun,"Nome do NPC","NPC",2,function(v)NPCName=v print("Nome do NPC: "..NPCName)end)
CreateInput(ScrollFun,"Skin do NPC (nome do player)","",3,function(v)NPCPlayerSkin=v print("Skin do NPC: "..NPCPlayerSkin)end)
CreateInput(ScrollFun,"Talk do NPC","Ola!",4,function(v)NPCText=v print("Talk do NPC: "..NPCText)end)
CreateActionButton(ScrollFun,"Spawn NPC",5,function()
if NPCModel then NPCModel:Destroy() NPCModel=nil end
CreateNPC(NPCPlayerSkin,NPCText,NPCName)end)
CreateActionButton(ScrollFun,"Remove NPC",6,function()
if NPCModel then NPCModel:Destroy() NPCModel=nil end
if NPCBillboard then NPCBillboard:Destroy() NPCBillboard=nil end
if NPCDistanceCheck then NPCDistanceCheck:Disconnect() NPCDistanceCheck=nil end
print("NPC removido!")end)
CreateToggle(ScrollFun,"Dance",7,function(s)
DanceActive=s if DanceActive then StartDance()print("Dance ATIVADO")
else if DanceConnection then DanceConnection:Disconnect() DanceConnection=nil end print("Dance DESATIVADO")end end)
CreateToggle(ScrollFun,"Big Head",8,function(s)
BigHead=s ToggleBigHead(BigHead)
if BigHead then print("Big Head ATIVADO")else print("Big Head DESATIVADO")end end)
local function SwitchTab(tab)
local scrolls={player=ScrollPlayer,troll=ScrollTroll,mira=ScrollMira,teleport=ScrollTeleport,visual=ScrollVisual,automacao=ScrollAutomacao,fun=ScrollFun}
for _,s in pairs(scrolls)do s.Visible=false end
if scrolls[tab]then scrolls[tab].Visible=true end
for nome,btn in pairs(Abas)do
if string.lower(nome)==tab then btn.BackgroundColor3=Color3.fromRGB(65,65,75)btn.TextColor3=Color3.fromRGB(255,255,255)
else btn.BackgroundColor3=Color3.fromRGB(35,35,42)btn.TextColor3=Color3.fromRGB(200,200,210)end end end
Abas["PLAYER"].MouseButton1Click:Connect(function()SwitchTab("player")end)
Abas["TROLL"].MouseButton1Click:Connect(function()SwitchTab("troll")end)
Abas["MIRA"].MouseButton1Click:Connect(function()SwitchTab("mira")end)
Abas["TELEPORT"].MouseButton1Click:Connect(function()SwitchTab("teleport")end)
Abas["VISUAL"].MouseButton1Click:Connect(function()SwitchTab("visual")end)
Abas["AUTOMACAO"].MouseButton1Click:Connect(function()SwitchTab("automacao")end)
Abas["FUN"].MouseButton1Click:Connect(function()SwitchTab("fun")end)
local Minimized=false
Minimize.MouseButton1Click:Connect(function()
Minimized=not Minimized
Sidebar.Visible=not Minimized
for _,s in pairs({ScrollPlayer,ScrollTroll,ScrollMira,ScrollTeleport,ScrollVisual,ScrollAutomacao,ScrollFun})do s.Visible=not Minimized and s.Visible end
if Minimized then Main.Size=UDim2.fromOffset(450,40)Minimize.Text="+"
else Main.Size=UDim2.fromOffset(450,450)Minimize.Text="-" end end)
local Dragging=false local DragStart,StartPosition
TopBar.InputBegan:Connect(function(Input)
if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then
Dragging=true DragStart=Input.Position StartPosition=Main.Position end end)
TopBar.InputEnded:Connect(function(Input)
if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then Dragging=false end end)
UserInputService.InputChanged:Connect(function(Input)
if not Dragging then return end
if Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch then
local Delta=Input.Position-DragStart
Main.Position=UDim2.new(StartPosition.X.Scale,StartPosition.X.Offset+Delta.X,StartPosition.Y.Scale,StartPosition.Y.Offset+Delta.Y)end end)
print("NIGHTLESS HUB CARREGADO! Todas as abas funcionando!")
