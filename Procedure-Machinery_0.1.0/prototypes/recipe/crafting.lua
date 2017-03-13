data:extend({
  {
    type = "recipe",
    name = "extreme-oil-cracking",
    category = "chemistry",
    enabled = false,
    energy_required = 16,
    ingredients =
    {
      {type="fluid", name="water", amount=10},
      {type="fluid", name="heavy-oil", amount=12}
    },
    results=
    {
      {type="fluid", name="petroleum-gas", amount=12}
    },
    main_product= "",
    icon = "__Procedure-Machinery__/graphics/icons/fluid/extreme-oil-cracking.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-d[extreme-oil-cracking]"
  }
})