mongoimport \
   --collection='recipes' \
   --file='/tmp/data/cleaned_indian_food_dataset.csv' \
   --type=csv \
   --headerline \
   --uri="mongodb://root:root@localhost:27017/recipes-book?authSource=admin"