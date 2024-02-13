mongoimport \
   --collection='recipes' \
   --file='/tmp/data/cleaned_indian_food_dataset.csv' \
   --type=csv \
   --fields="TranslatedRecipeName","TranslatedIngredients","TotalTimeInMins","Cuisine","TranslatedInstructions","Cleaned-Ingredients","Ingredient-count" \
   --uri="mongodb://root:root@localhost:27017/recipes-book?authSource=admin"