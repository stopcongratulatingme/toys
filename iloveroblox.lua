local sg = Instance.new("ScreenGui")
local fr = Instance.new("Frame")
local tb = Instance.new("TextBox")
local btn = Instance.new("TextButton")

sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
sg.Name = "cg"

fr.Parent = sg
fr.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
fr.BorderColor3 = Color3.fromRGB(100, 100, 100)
fr.Position = UDim2.new(0.5, -125, 0.5, -75)
fr.Size = UDim2.new(0, 250, 0, 150)
fr.Draggable = true
fr.Active = true

tb.Parent = fr
tb.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
tb.BorderColor3 = Color3.fromRGB(150, 150, 150)
tb.Position = UDim2.new(0.1, 0, 0.2, 0)
tb.Size = UDim2.new(0.8, 0, 0.3, 0)
tb.Text = ""

btn.Parent = fr
btn.BackgroundColor3 = Color3.fromRGB(100, 170, 100)
btn.BorderColor3 = Color3.fromRGB(70, 70, 70)
btn.Position = UDim2.new(0.1, 0, 0.6, 0)
btn.Size = UDim2.new(0.8, 0, 0.3, 0)
btn.Text = "Send"

local replacements = {
    ["a"] = "ɑ",
    ["b"] = "в",
    ["c"] = "с",
    ["d"] = "ԁ",
    ["e"] = "е",
    ["f"] = "ғ",
    ["g"] = "ɡ",
    ["h"] = "һ",
    ["i"] = "і",
    ["j"] = "ј",
    ["k"] = "к",
    ["l"] = "|",
    ["m"] = "м",
    ["n"] = "и",
    ["o"] = "о",
    ["p"] = "р",
    ["q"] = "գ",
    ["r"] = "г",
    ["s"] = "ѕ",
    ["t"] = "т",
    ["u"] = "υ",
    ["v"] = "ν",
    ["w"] = "w",
    ["x"] = "х",
    ["y"] = "у",
    ["z"] = "ᴢ",
    ["A"] = "Α",
    ["B"] = "В",
    ["C"] = "С",
    ["D"] = "Ԛ",
    ["E"] = "Е",
    ["F"] = "Ғ",
    ["G"] = "Ԍ",
    ["H"] = "Н",
    ["I"] = "Ι",
    ["J"] = "Ј",
    ["K"] = "К",
    ["L"] = "|",
    ["M"] = "М",
    ["N"] = "Ν",
    ["O"] = "О",
    ["P"] = "Р",
    ["Q"] = "Ԛ",
    ["R"] = "Я",
    ["S"] = "Ѕ",
    ["T"] = "Т",
    ["U"] = "U",
    ["V"] = "V",
    ["W"] = "W",
    ["X"] = "Х",
    ["Y"] = "Υ",
    ["Z"] = "Ζ",
    [" "] = "⏎"
}

local function obfuscateText(text)
    local words = {}
    for word in string.gmatch(text, "%S+") do
        table.insert(words, word)
    end
    local result = ""
    for _, word in ipairs(words) do
        for i = 1, #word do
            local char = string.sub(word, i, i)
            result = result .. (replacements[char] or char)
        end
        result = result .. " "
    end
    return result:sub(1, -2)
end

btn.MouseButton1Click:Connect(
    function()
        local msg = tb.Text
        local obfuscatedMsg = obfuscateText(msg)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            obfuscatedMsg,
            "All"
        )
        tb.Text = ""
    end
)
