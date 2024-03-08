local setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
local request = request or http_request or (http and http.request) or syn.request

local response = request({Url = "https://kya.jvck.gg/return-headers"}).Body
local decoded = game:GetService("HttpService"):JSONDecode(response)

local hwid = nil

for i, v in pairs(decoded) do
	local lowered = tostring(i):lower()

	print(i, v)

	if (string.find(lowered, "fingerprint") or string.find(lowered, "identifier")) and not (string.find(lowered, "user")) then
		hwid = v
		print(i, v)
	end
end

if getgenv().hwidRETURN then
  return hwid
else
  setclipboard(hwid)
end
