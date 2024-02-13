mongoimport \
   --collection='recipes' \
   --file='/tmp/data/cleaned_indian_food_dataset.csv' \
   --type=csv \
   --fields="name","unprocessed-ingredients","total_time_in_mins","cuisine","instructions","url","ingredients","ingredient-count","image-url","ingredient-count" \
   --uri="mongodb://root:root@localhost:27017/recipes-book?authSource=admin"