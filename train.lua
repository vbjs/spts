local function rejoin()
    queueonteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/vbjs/spts/train.lua"))()')
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end


local Dir = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
    Dir.DescendantAdded:Connect(function(Err)
        if Err.Name == "ErrorTitle" then
            Err:GetPropertyChangedSignal("Text"):Connect(function()
                if Err.Text:sub(0, 12) == "Disconnected" then
                        rejoin()
                end
            end)
        end
    end)

while task.wait() do
    if not game.Players.LocalPlayer.PrivateStats.CanTrainMS.Value then
        local args = {
            [1] = {
                [1] = "Respawn"
            }
        }
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    else
        local args = {
            [1] = {
                [1] = "+PP14"
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
end

task.wait(30)
rejoin()
