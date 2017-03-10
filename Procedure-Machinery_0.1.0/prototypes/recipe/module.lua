require("config")


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
      type = "recipe",
      name = "speed-module-" .. i,
      enabled = false,
      ingredients =
      {
        {"speed-module-" .. (i - 1), 4},
        {"advanced-circuit", 5 * (i - 2)},
        {"processing-unit", 5 * (i - 2)},
        {"alien-artifact", 1 * (i - 2)}
      },
      energy_required = 60 * (i - 2),
      result = "speed-module-" .. i
    }
  )
  table.insert(module_data,
    {
      type = "recipe",
      name = "effectivity-module-" .. i,
      enabled = false,
      ingredients =
      {
        {"effectivity-module-" .. (i - 1), 4},
        {"advanced-circuit", 5 * (i - 2)},
        {"processing-unit", 5 * (i - 2)},
        {"alien-artifact", 1 * (i - 2)}
      },
      energy_required = 60 * (i - 2),
      result = "effectivity-module-" .. i
    }
  )
  table.insert(module_data,
    {
      type = "recipe",
      name = "productivity-module-" .. i,
      enabled = false,
      ingredients =
      {
        {"productivity-module-" .. (i - 1), 4},
        {"advanced-circuit", 5 * (i - 2)},
        {"processing-unit", 5 * (i - 2)},
        {"alien-artifact", 1 * (i - 2)}
      },
      energy_required = 60 * (i - 2),
      result = "productivity-module-" .. i
    }
  )
end
data:extend(module_data)