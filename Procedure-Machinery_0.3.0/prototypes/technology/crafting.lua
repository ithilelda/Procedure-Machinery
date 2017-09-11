require("common")


-- modify the existing sulfur research to include my new recipe.
tech_add_unlock("sulfur-processing", "sulfuric-acid-catalyst")

-- add the oil cracking recipes to basic oil processing tech. You don't have to live with a flawed system and rush for advanced processing as fast as possible now.
tech_add_unlock("oil-processing", "heavy-oil-cracking")
tech_add_unlock("oil-processing", "light-oil-cracking")

-- replace the vanilla oil cracking recipes with my version of recipe in advanced oil processing tech. This way, you can use copper as catalyst to give better yield.
tech_remove_unlock("advanced-oil-processing", "heavy-oil-cracking")
tech_remove_unlock("advanced-oil-processing", "light-oil-cracking")
tech_add_unlock("advanced-oil-processing", "heavy-oil-cracking-catalyst")
tech_add_unlock("advanced-oil-processing", "light-oil-cracking-catalyst")