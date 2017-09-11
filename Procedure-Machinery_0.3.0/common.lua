function order_string (i)
  if i < 10 then
    return "d"
  else
    return "e"
  end
end

function tech_add_unlock (technology_name, recipe_name)
  if data.raw.technology[technology_name] and data.raw.technology[technology_name].effects then
    local recipe = {type = "unlock-recipe", recipe = recipe_name}
    table.insert(data.raw.technology[technology_name].effects, recipe)
  end
end

function tech_remove_unlock (technology_name, recipe_name)
  if data.raw.technology[technology_name] and data.raw.technology[technology_name].effects then
    effects = data.raw.technology[technology_name].effects
    for i, t in ipairs(effects) do
      if t.type == "unlock-recipe" and t.recipe == recipe_name then
        table.remove(data.raw.technology[technology_name].effects, i)
        break
      end
    end
  end
end

function tech_remove_pack (technology_name, pack_name)
  if data.raw.technology[technology_name] and data.raw.technology[technology_name].unit and data.raw.technology[technology_name].unit.ingredients then
    ingredients = data.raw.technology[technology_name].unit.ingredients
    for i, t in ipairs(ingredients) do
      if t[1] == pack_name then
        table.remove(data.raw.technology[technology_name].unit.ingredients, i)
        break
      end
    end
  end
end