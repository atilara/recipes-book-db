import pandas as pd
import json
from pathlib import Path

def read_unique_ingredients(csv_file, column_name):
    df = pd.read_csv(csv_file)
    unique_ingredients = set()

    for ingredients in df[column_name].str.strip('[]').str.replace("'", "").str.replace('"', '').str.split(", "):
        unique_ingredients.update(ingredients)

    # Convert unique ingredients to a list of dictionaries
    ingredients_list = [{'name': ingredient} for ingredient in unique_ingredients]

    return ingredients_list

# Example usage:
# Open reduced_recipes_ingredients.csv going back a folder and then into the data folder

csv_file = Path('data/reduced_recipes_ingredients.csv')
column_name = 'ingredients'
unique_ingredients_json = read_unique_ingredients(csv_file, column_name)

# Writing the JSON to a file
with open('data/unique_ingredients.json', 'w') as outfile:
    json.dump(unique_ingredients_json, outfile, indent=4)

print("JSON file 'unique_ingredients.json' has been generated.")
