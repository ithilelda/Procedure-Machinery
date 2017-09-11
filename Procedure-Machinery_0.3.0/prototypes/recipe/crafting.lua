data:extend({
  {
    -- electrolysis to make sulfuric acid with copper and coal electrodes. This requires a lot more energy but has a slight better yield.
    type = "recipe",
    name = "sulfuric-acid-catalyst",
    category = "chemistry",
    energy_required = 20,
    enabled = false,
    ingredients =
    {
      {type="item", name="coal", amount=1},
      {type="item", name="copper-plate", amount=1},
      {type="fluid", name="petroleum-gas", amount=50},
      {type="fluid", name="water", amount=100}
    },
    results=
    {
      {type="fluid", name="sulfuric-acid", amount=50}
    },
    icon = "__Procedure-Machinery__/graphics/icons/fluid/sulfuric-acid-electrolysis.png",
    subgroup = "fluid-recipes",
    crafting_machine_tint =
    {
      primary = {r = 0.875, g = 0.735, b = 0.000, a = 0.000}, -- #dfbb0000
      secondary = {r = 0.103, g = 0.940, b = 0.000, a = 0.000}, -- #1aef0000
      tertiary = {r = 0.564, g = 0.795, b = 0.000, a = 0.000}, -- #8fca0000
    },
  },
  {
    -- 
    type = "recipe",
    name = "heavy-oil-cracking-catalyst",
    category = "chemistry",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {type="item", name="copper-plate", amount=1},
      {type="fluid", name="water", amount=30},
      {type="fluid", name="heavy-oil", amount=40}
    },
    results=
    {
      {type="fluid", name="light-oil", amount=35}
    },
    main_product= "",
    icon = "__Procedure-Machinery__/graphics/icons/fluid/heavy-oil-cracking-catalyst.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    }
  },
  {
    type = "recipe",
    name = "light-oil-cracking-catalyst",
    category = "chemistry",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {type="item", name="copper-plate", amount=1},
      {type="fluid", name="water", amount=30},
      {type="fluid", name="light-oil", amount=35}
    },
    results=
    {
      {type="fluid", name="petroleum-gas", amount=30}
    },
    main_product= "",
    icon = "__Procedure-Machinery__/graphics/icons/fluid/light-oil-cracking-catalyst.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-b[light-oil-cracking]",
    crafting_machine_tint =
    {
      primary = {r = 0.785, g = 0.406, b = 0.000, a = 0.000}, -- #c8670000
      secondary = {r = 0.795, g = 0.805, b = 0.605, a = 0.000}, -- #cacd9a00
      tertiary = {r = 0.835, g = 0.551, b = 0.000, a = 0.000}, -- #d48c0000
    }
  },
  {
    -- this is a modification to vanilla recipe. Batteries now use coal and copper plate.
    type = "recipe",
    name = "battery",
    category = "chemistry",
    normal =
    {
      energy_required = 5,
      enabled = false,
      ingredients =
      {
        {type="fluid", name="sulfuric-acid", amount=20},
        {"coal", 1},
        {"copper-plate", 1}
      },
      result= "battery"
    },
    expensive =
    {
      energy_required = 5,
      enabled = false,
      ingredients =
      {
        {type="fluid", name="sulfuric-acid", amount=40},
        {"coal", 1},
        {"copper-plate", 1}
      },
      result= "battery"
    },
    crafting_machine_tint =
    {
      primary = {r = 0.970, g = 0.611, b = 0.000, a = 0.000}, -- #f79b0000
      secondary = {r = 0.000, g = 0.680, b = 0.894, a = 0.357}, -- #00ade45b
      tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900
    }
  },
})