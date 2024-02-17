LOAD CSV WITH HEADERS FROM "file:///cleaned_indian_food_dataset.csv" AS row
CREATE (recipe:Recipe {name: row.recipe_name, cuisine: row.cuisine})
with recipe, split(row['processed_ingredients'], ',') as list
UNWIND list AS i
MERGE (ingredient:Ingredient {name:i})
MERGE (recipe)-[:HAS_INGREDIENT]->(ingredient);
