local setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
local request = request or http_request or (http and http.request) or syn.request

local hwid = nil
local name = nil

local response = request({Url = "https://kya.jvck.gg/return-headers"}).Body
local decoded = game:GetService("HttpService"):JSONDecode(response)

for i, v in pairs(decoded) do
    local lowered = tostring(i):lower()

    print(i, v)

    if (string.find(lowered, "fingerprint") or string.find(lowered, "identifier")) and not (string.find(lowered, "user")) then
        hwid = v; name = i
        print(i, v)
    end
end

if getgenv().hwidRETURN then
    return name, hwid
else
    setclipboard(hwid)
end
