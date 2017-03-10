require("config")
require("common")


-- I always have the safety measures in case users mess up the config.
if module_maxlevel <= 3 then
  module_maxlevel = 4
elseif module_maxlevel > 25 then
  module_maxlevel = 25
end

module_data = {}
for i  = 4, module_maxlevel do
  table.insert(module_data,
    {
      type = "technology",
      name = "speed-module-" .. i,
      icon = "__base__/graphics/technology/speed-module.png",
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "speed-module-" .. i
        }
      },
      prerequisites = {"speed-module-" .. (i - 1)},
      unit =
      {
        count = 400 * (i - 3) ^ module_tech_power,
        ingredients =
        {
          {"science-pack-1", 1},
          {"science-pack-2", 1},
          {"science-pack-3", 1},
          {"alien-science-pack", 1}
        },
        time = 30 * math.ceil(i / 2)
      },
      upgrade = true,
      order = "i-c-" .. order_string(i)
    }
  )
  table.insert(module_data,
    {
      type = "technology",
      name = "productivity-module-" .. i,
      icon = "__base__/graphics/technology/productivity-module.png",
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "productivity-module-" .. i
        }
      },
      prerequisites = {"productivity-module-" .. (i - 1)},
      unit =
      {
        count = 400 * (i - 3) ^ module_tech_power,
        ingredients =
        {
          {"science-pack-1", 1},
          {"science-pack-2", 1},
          {"science-pack-3", 1},
          {"alien-science-pack", 1}
        },
        time = 30 * math.ceil(i / 2)
      },
      upgrade = true,
      order = "i-e-" .. order_string(i)
    }
  )
  table.insert(module_data,
    {
      type = "technology",
      name = "effectivity-module-" .. i,
      icon = "__base__/graphics/technology/effectivity-module.png",
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "effectivity-module-" .. i
        }
      },
      prerequisites = {"effectivity-module-" .. (i - 1)},
      unit =
      {
        count = 400 * (i - 3) ^ module_tech_power,
        ingredients =
        {
          {"science-pack-1", 1},
          {"science-pack-2", 1},
          {"science-pack-3", 1},
          {"alien-science-pack", 1}
        },
        time = 30 * math.ceil(i / 2)
      },
      upgrade = true,
      order = "i-g-" .. order_string(i)
    }
  )
end
data:extend(module_data)