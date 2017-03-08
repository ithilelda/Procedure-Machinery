require("config")


-- I always have the safety measures in case users mess up the config.
if module_maxlevel <= 3 then
  module_maxlevel = 4
elseif module_maxlevel > 25 then
  module_maxlevel = 25
end

for i  = 4, module_maxlevel do
  data:extend(
  {
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
      energy_required = 15 * 2 ^ (i - 1),
      result = "speed-module-" .. i
    },
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
      energy_required = 15 * 2 ^ (i - 1),
      result = "effectivity-module-" .. i
    },
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
      energy_required = 15 * 2 ^ (i - 1),
      result = "productivity-module-" .. i
    },
  }
  )
end