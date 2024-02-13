LOAD CSV WITH HEADERS FROM "file:///cleaned_indian_food_dataset.csv" AS row
CREATE (recipe:Recipe {name: row.TranslatedRecipeName, cuisine: row.cuisine})
with recipe, split(row.CleanedIngredients, ',') as list
UNWIND list AS i
MERGE (ingredient:Ingredient {name:i})
MERGE (recipe)-[:HAS_INGREDIENT]->(ingredient);