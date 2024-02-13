LOAD CSV WITH HEADERS FROM "file:///cleaned_indian_food_dataset.csv" AS row
CREATE (recipe:Recipe {name: row.TranslatedRecipeName, ingredients: row.CleanedIngredients});

MATCH (recipe:Recipe)
WITH recipe, split(recipe.ingredients, ",") AS list
UNWIND list AS i
MERGE (ingredient:Ingredient {name:i})
MERGE (recipe)-[:HAS_INGREDIENT]->(ingredient);
