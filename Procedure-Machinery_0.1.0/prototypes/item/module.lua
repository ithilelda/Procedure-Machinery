require("config")


-- I always have the safety measures in case users mess up the config.
if module_maxlevel <= 3 then
    module_maxlevel = 4
elseif module_maxlevel > 25 then
    module_maxlevel = 25
end

-- adding the modules based on config. check config for details.
for i  = 4, module_maxlevel do
    data:extend(
    {
        {
            type = "module",
            name = "speed-module-" .. i,
            icon = "__Procedure-Machinery__/graphics/icons/module/speed-module-" .. i ..".png",
            flags = {"goes-to-main-inventory"},
            subgroup = "module",
            category = "speed",
            tier = i,
            order = "a[speed]-d[speed-module-" .. i .. "]",
            stack_size = 50,
            default_request_amount = 10,
            effect = { speed = {bonus = 0.2 + i ^ module_power * 0.1}, consumption = {bonus = 0.4 + i ^ module_power * 0.1}}
        },
        {
            type = "module",
            name = "effectivity-module-" .. i,
            icon = "__Procedure-Machinery__/graphics/icons/module/effectivity-module-" .. i ..".png",
            flags = {"goes-to-main-inventory"},
            subgroup = "module",
            category = "effectivity",
            tier = i,
            order = "c[effectivity]-d[effectivity-module-" .. i .. "]",
            stack_size = 50,
            default_request_amount = 10,
            effect = { consumption = {bonus = -0.2 - i ^ module_power / 10}},
            limitation = production
        },
        {
            type = "module",
            name = "productivity-module-" .. i,
            icon = "__Procedure-Machinery__/graphics/icons/module/productivity-module-" .. i ..".png",
            flags = {"goes-to-main-inventory"},
            subgroup = "module",
            category = "productivity",
            tier = i,
            order = "c[productivity]-d[productivity-module-" .. i .. "]",
            stack_size = 50,
            default_request_amount = 10,
            effect = { productivity = {bonus = 0.025 + i ^ module_power * 0.025}, consumption = {bonus = 0.2 + i ^ module_power / 5}, speed = {bonus = -0.15}},
            limitation = productivitymodulelimitation(),
            limitation_message_key = "production-module-usable-only-on-intermediates"
        },
    }
    )
end

-- The design is that productivity modules are usable only in parts, but provides better productivity bonus and no extra pollution, only pollution from extra energy use.
-- Another module called industrial module can increase productivity in anything, but causes heavy pollution as well as extreme power usage (no speed penalty though).
--[[for i  = 1, module_maxlevel do
    data:extend(
    {
        {
            type = "module",
            name = "industrial-module-" .. i,
            icon = "__Procedure-Machinery__/graphics/icons/module/industrial-module-" .. i ..".png",
            flags = {"goes-to-main-inventory"},
            subgroup = "module",
            category = "industrial",
            tier = i,
            order = "a[industrial]-a[industrial-module-" .. i .. "]",
            stack_size = 50,
            default_request_amount = 10,
            effect = { productivity = {bonus = i ^ module_power * 0.015}, consumption = {bonus = i ^ module_power / 2}, pollution = {bonus = 0.2 * i ^ module_power}},
        }
    }
    )
end]]--

-- modifying the base productivity modules to remove the pollution penalty.
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
    effect = { productivity = {bonus = 0.04}, consumption = {bonus = 0.4}, speed = {bonus = -0.15}},
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
    effect = { productivity = {bonus = 0.06}, consumption = {bonus = 0.6}, speed = {bonus = -0.15}},
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
    effect = { productivity = {bonus = 0.1}, consumption = {bonus = 0.8}, speed = {bonus = -0.15}},
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  }
}
)