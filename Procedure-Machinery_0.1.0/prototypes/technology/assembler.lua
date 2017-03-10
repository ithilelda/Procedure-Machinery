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
      type = "technology",
      name = "automation-" .. i,
      icon = "__base__/graphics/technology/automation.png",
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "assembling-machine-" .. i
        }
      },
      prerequisites = {"speed-module-" .. (i - 2), "automation-" .. (i - 1)},
      unit =
      {
        count = 50 + (i - 2) * 50,
        ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
        time = 45 + (i - 2) * 15
      },
      order = "a-b-" .. order_string(i)
    }
  )
end
data:extend(assembler_data)