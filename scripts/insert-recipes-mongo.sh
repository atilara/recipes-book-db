mongoimport \
   --collection='recipes' \
   --file='/tmp/data/reduced_recipes_ingredients.csv' \
   --type=csv \
   --fields="name","description","ingredients","ingredients_raw","steps","servings","serving_size","tags"