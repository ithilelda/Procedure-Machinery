function order_string (i)
  if i < 10 then
    return "d"
  else
    return "e"
  end
end

function tech_add_unlock (technology_name, recipe_name)
  if data.raw.technology[technology_name] then
    local recipe = {type = "unlock-recipe", recipe = recipe_name}
    table.insert(data.raw.technology[technology_name].effects, recipe)
  end
end

function tech_remove_unlock (technology_name, recipe_name)
  if data.raw.technology[technology_name] then
    effects = data.raw.technology[technology_name].effects
    for i, t in ipairs(effects) do
      if t.recipe == recipe_name then
        table.remove(data.raw.technology[technology_name].effects, i)
      end
    end
  end
end