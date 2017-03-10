require("config")
require("common")

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
      type = "item",
      name = "assembling-machine-" .. i,
      icon = "__Procedure-Machinery__/graphics/icons/assembler/assembling-machine-" .. i .. ".png",
      flags = {"goes-to-quickbar"},
      subgroup = "production-machine",
      order = order_string(i) .. "[assembling-machine-" .. i .. "]",
      place_result = "assembling-machine-" .. i,
      stack_size = 50
    }
  )
end
data:extend(assembler_data)