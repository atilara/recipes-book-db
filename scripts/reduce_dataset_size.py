import pandas as pd
import random

def select_random_rows(input_file, output_file, percentage):
    df = pd.read_csv(input_file)
    num_rows = len(df)
    num_rows_to_select = int(num_rows * percentage)

    selected_indices = random.sample(range(num_rows), num_rows_to_select)
    selected_df = df.iloc[selected_indices]

    selected_df.to_csv(output_file, index=False)
    print(f"{num_rows_to_select} rows selected randomly and written to {output_file}")


# Usage example
input_file = 'data/recipes_ingredients.csv'
output_file = 'data/reduced_recipes_ingredients.csv'
percentage = 0.01

select_random_rows(input_file, output_file, percentage)
