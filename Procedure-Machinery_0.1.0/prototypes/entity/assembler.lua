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
      type = "assembling-machine",
      name = "assembling-machine-" .. i,
      icon = "__Procedure-Machinery__/graphics/icons/assembler/assembling-machine-" .. i .. ".png",
      flags = {"placeable-neutral","placeable-player", "player-creation"},
      minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-" .. i},
      max_health = 150 + 50 * i,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      resistances =
      {
        {
          type = "fire",
          percent = 70
        }
      },
      fluid_boxes =
      {
        {
          production_type = "input",
          pipe_picture = assembler3pipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = -1,
          pipe_connections = {{ type="input", position = {0, -2} }}
        },
        {
          production_type = "output",
          pipe_picture = assembler3pipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = 1,
          pipe_connections = {{ type="output", position = {0, 2} }}
        },
        off_when_no_fluid_recipe = true
      },
      open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
      close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound =
      {
        sound = {
          {
            filename = "__base__/sound/assembling-machine-t3-1.ogg",
            volume = 0.8
          },
          {
            filename = "__base__/sound/assembling-machine-t3-2.ogg",
            volume = 0.8
          },
        },
        idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
        apparent_volume = 1.5,
      },
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      fast_replaceable_group = "assembling-machine",
      animation =
      {
        filename = "__Procedure-Machinery__/graphics/entity/assembling-machine-" .. i .. ".png",
        priority = "high",
        width = 142,
        height = 113,
        frame_count = 32,
        line_length = 8,
        shift = {0.84, -0.09}
      },
      crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
      crafting_speed = 0.5 + i * (i - 1) / 8,
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.03 / 3.5
      },
      energy_usage = 1.4 ^ (i - 2) * 150 .. "kW",
      ingredient_count = 8,
      module_specification =
      {
        module_slots = 1 + i
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution"}
    }
  )
end
data:extend(assembler_data)