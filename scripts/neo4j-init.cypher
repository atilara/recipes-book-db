LOAD CSV WITH HEADERS FROM "file:///cleaned_indian_food_dataset.csv" AS row
CREATE (recipe:Recipe {name: row.recipe_name})

MERGE (cuisine:Cuisine {cuisine: row.cuisine})
MERGE (recipe)-[:FROM_CUISINE]->(cuisine)

MERGE (time_mins:TimeMins {minutes: toInteger(row.time_minutes)})
MERGE (recipe)-[:TAKES_TIME]->(time_mins)

WITH recipe, split(row['processed_ingredients'], ',') AS list
UNWIND list AS i
MERGE (ingredient:Ingredient {name:i})
MERGE (recipe)-[:HAS_INGREDIENT]->(ingredient);
