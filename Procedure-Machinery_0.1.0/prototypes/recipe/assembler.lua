require("config")

-- I always have the safety measures in case users mess up the config.
if assembler_maxlevel <= 3 then
  assembler_maxlevel = 4
elseif assembler_maxlevel > 10 then
  assembler_maxlevel = 10
end

assembler_data = {}
for i = 4, assembler_maxlevel do
  table.insert(assembler_data, 
    {
      type = "recipe",
      name = "assembling-machine-" .. i,
      enabled = false,
      ingredients =
      {
        {"speed-module-" .. (i - 2), 4},
        {"assembling-machine-" .. (i - 1), 2}
      },
      result = "assembling-machine-" .. i
    }
  )
end
data:extend(assembler_data)