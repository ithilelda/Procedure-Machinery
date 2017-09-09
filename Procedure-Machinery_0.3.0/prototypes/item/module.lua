require("config")
require("common")


-- I always have the safety measures in case users mess up the config.
if module_maxlevel <= 3 then
  module_maxlevel = 4
elseif module_maxlevel > 25 then
  module_maxlevel = 25
end

-- adding the modules based on config. check config for details.
module_data = {}
for i  = 4, module_maxlevel do
  table.insert(module_data,
    {
      type = "module",
      name = "speed-module-" .. i,
      icon = "__Procedure-Machinery__/graphics/icons/module/speed-module-" .. i ..".png",
      flags = {"goes-to-main-inventory"},
      subgroup = "module",
      category = "speed",
      tier = i,
      order = "a[speed]-" .. order_string(i) .. "[speed-module-" .. i .. "]",
      stack_size = 50,
      default_request_amount = 10,
      effect = { speed = {bonus = i ^ module_power * 0.25 - 0.25}, consumption = {bonus = i ^ module_power * 0.25 - 0.1}}
    }
  )
  table.insert(module_data,
    {
      type = "module",
      name = "effectivity-module-" .. i,
      icon = "__Procedure-Machinery__/graphics/icons/module/effectivity-module-" .. i ..".png",
      flags = {"goes-to-main-inventory"},
      subgroup = "module",
      category = "effectivity",
      tier = i,
      order = "c[effectivity]-" .. order_string(i) .. "[effectivity-module-" .. i .. "]",
      stack_size = 50,
      default_request_amount = 10,
      effect = { consumption = {bonus = i ^ module_power / -10.0 - 0.1}},
      limitation = production
    }
  )
  table.insert(module_data,
    {
      type = "module",
      name = "productivity-module-" .. i,
      icon = "__Procedure-Machinery__/graphics/icons/module/productivity-module-" .. i ..".png",
      flags = {"goes-to-main-inventory"},
      subgroup = "module",
      category = "productivity",
      tier = i,
      order = "c[productivity]-" .. order_string(i) .. "[productivity-module-" .. i .. "]",
      stack_size = 50,
      default_request_amount = 10,
      effect = { productivity = {bonus = i ^ module_power * 0.05}, consumption = {bonus = 0.1 + i ^ module_power / 5}, speed = {bonus = -0.15}},
      limitation = productivitymodulelimitation(),
      limitation_message_key = "production-module-usable-only-on-intermediates"
    }
  )
end

-- The design is that productivity module's speed decrease will come in handy when inserters are big bottle neck for 0.5 sec crafting recipes. Industrial modules, on the other hand, does not have that penalty.
-- so it is great for multistaging your odd ratio factories to make each stage even. However, this handiness does not come without price. Since it is crafted by combining speed with productivity, the comsumption is summed.
table.insert(module_data,
  {
    type = "module",
    name = "industrial-module",
    icon = "__Procedure-Machinery__/graphics/icons/module/industrial-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    category = "productivity",
    tier = 1,
    order = "a[industrial]-a[industrial-module]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { productivity = {bonus = 0.05}, consumption = {bonus = 0.9}},
    limitation_message_key = "production-module-usable-only-on-intermediates"
  }
)
for i  = 2, module_maxlevel do
  table.insert(module_data,
    {
      type = "module",
      name = "industrial-module-" .. i,
      icon = "__Procedure-Machinery__/graphics/icons/module/industrial-module-" .. i ..".png",
      flags = {"goes-to-main-inventory"},
      subgroup = "module",
      category = "productivity",
      tier = i,
      order = "a[industrial]-" .. order_string(i) .. "[industrial-module-" .. i .. "]",
      stack_size = 50,
      default_request_amount = 10,
      effect = { productivity = {bonus = i ^ module_power * 0.05}, consumption = {bonus = i ^ module_power * 0.45 + 0.1}},
      limitation_message_key = "production-module-usable-only-on-intermediates"
    }
  )
end
data:extend(module_data)

-- modifying the base productivity modules to remove the pollution penalty, also nerfed the effectivity modules.
data:extend(
{
  {
    type = "module",
    name = "productivity-module",
    icon = "__base__/graphics/icons/productivity-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    category = "productivity",
    tier = 1,
    order = "c[productivity]-a[productivity-module-1]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { productivity = {bonus = 0.05}, consumption = {bonus = 0.4}, speed = {bonus = -0.15}},
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "productivity-module-2",
    icon = "__base__/graphics/icons/productivity-module-2.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    category = "productivity",
    tier = 2,
    order = "c[productivity]-b[productivity-module-2]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { productivity = {bonus = 0.1}, consumption = {bonus = 0.6}, speed = {bonus = -0.15}},
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "productivity-module-3",
    icon = "__base__/graphics/icons/productivity-module-3.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    category = "productivity",
    tier = 3,
    order = "c[productivity]-c[productivity-module-3]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { productivity = {bonus = 0.15}, consumption = {bonus = 0.8}, speed = {bonus = -0.15}},
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "effectivity-module",
    icon = "__base__/graphics/icons/effectivity-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    category = "effectivity",
    tier = 1,
    order = "c[effectivity]-a[effectivity-module-1]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { consumption = {bonus = -0.2}},
    limitation = production
  },
  {
    type = "module",
    name = "effectivity-module-2",
    icon = "__base__/graphics/icons/effectivity-module-2.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    category = "effectivity",
    tier = 2,
    order = "c[effectivity]-b[effectivity-module-2]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { consumption = {bonus = -0.3}}
  },
  {
    type = "module",
    name = "effectivity-module-3",
    icon = "__base__/graphics/icons/effectivity-module-3.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    category = "effectivity",
    tier = 3,
    order = "c[effectivity]-c[effectivity-module-3]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { consumption = {bonus = -0.4}}
  }
}
)