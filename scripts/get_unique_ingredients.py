import pandas as pd
import json

def get_unique_ingredients(csv_file):
    # Leitura do arquivo CSV
    df = pd.read_csv(csv_file, encoding='utf-8')
    
    # Inicialização de um conjunto para armazenar os itens únicos
    unique_items = set()
    
    # Iteração sobre cada linha do dataframe
    for index, row in df.iterrows():
        # Dividir a string em itens separados por vírgula e adicionar ao conjunto
        items = row['Cleaned-Ingredients'].split(',')
        unique_items.update(items)
    
    # Criar uma lista de objetos JSON com os itens únicos
    json_objects = [{'name': item.strip()} for item in unique_items]
    
    return json_objects

def main():
    # Arquivo CSV de entrada
    csv_file = 'data/cleaned_indian_food_dataset.csv'
    
    # Extrair os itens únicos e criar o JSON
    unique_items = get_unique_ingredients(csv_file)
    
    # Escrever o JSON em um arquivo
    with open('data/unique_ingredients.json', 'w') as json_file:
        json.dump(unique_items, json_file, indent=2)
    
if __name__ == "__main__":
    main()
