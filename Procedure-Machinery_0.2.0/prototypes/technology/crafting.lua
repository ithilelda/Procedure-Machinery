data:extend({
  {
    type = "technology",
    name = "elite-oil-processing",
    icon = "__base__/graphics/technology/oil-processing.png",
    prerequisites = {"advanced-oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "extreme-oil-cracking"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1},
                     {"science-pack-2", 1},
                     {"science-pack-3", 1},
                     {"production-science-pack", 1}},
      time = 30
    },
    order = "d-c"
  }
})