//Quais pratos podem ser feitos com os ingredientes [x,y,z]?
match (r:Recipe)-[:HAS_INGREDIENT]->(i:Ingredient)
where i.name IN ['salt', 'cumin seeds', 'tomato']
with r, COUNT(DISTINCT i) AS ingredient_count
WHERE ingredient_count = 3
return r
limit 10;

match (r:Recipe)-[:HAS_INGREDIENT]->(i:Ingredient)
where i.name = "green chilli"
return r
limit 10;

//Quais pratos da culinária C podem ser feitos com os ingredientes [x,y,z]?
match (c:Cuisine)<-[rel:FROM_CUISINE]-(r:Recipe)-[:HAS_INGREDIENT]->(i:Ingredient)
where i.name = "green chilli" and c.cuisine = 'Indian'
return r,rel,c
limit 10;

match (c:Cuisine)<-[rel:FROM_CUISINE]-(r:Recipe)-[:HAS_INGREDIENT]->(i:Ingredient)
where i.name IN ['salt', 'cumin seeds', 'tomato']
with r, COUNT(DISTINCT i) AS ingredient_count, c , rel
WHERE ingredient_count = 3 and c.cuisine = 'Indian'
return r, rel, c
limit 10;

//Quais pratos posso preparar com os ingredientes [x,y,z] em até N minutos?
match (t:TimeMins)<-[rel:TAKES_TIME]-(r:Recipe)-[:HAS_INGREDIENT]->(i:Ingredient)
where i.name = "green chilli" and t.minutes < 60
return r,rel,t
limit 10;

match (t:TimeMins)<-[rel:TAKES_TIME]-(r:Recipe)-[:HAS_INGREDIENT]->(i:Ingredient)
where i.name IN ['salt', 'cumin seeds', 'tomato']
with r, COUNT(DISTINCT i) AS ingredient_count, t, rel
WHERE ingredient_count = 3 and t.minutes < 60
return r, rel, t
limit 10;

//Quais pratos posso preparar com os ingredientes [x,y,z] e que possuem até N ingredientes?
match (n:IngredientsNumber)<-[rel:HAS_INGREDIENT_NUMBER]-(r:Recipe)-[:HAS_INGREDIENT]->(i:Ingredient)
where i.name IN ['salt', 'cumin seeds', 'tomato']
with r, COUNT(DISTINCT i) AS ingredient_count, n, rel
WHERE ingredient_count = 3 and n.number < 12
return r, rel, n
limit 10;

match (num:IngredientsNumber)<-[rel:HAS_INGREDIENT_NUMBER]-(r:Recipe)-[:HAS_INGREDIENT]->(i:Ingredient)
where i.name = "green chilli" and num.number < 10
return r,rel,num
limit 10;

//Quais pratos posso preparar com os ingredientes [x,y,z] e sem os ingredientes [u,v,w]?
MATCH (r:Recipe)-[rel:HAS_INGREDIENT]->(i:Ingredient)
with r, collect(i.name) as ing_list
where all(name in ['salt', 'cumin seeds', 'tomato'] where name in ing_list) and none(name in ['oil','onion'] where name in ing_list)
return r
limit 10;

//Quais pratos posso preparar da culinária C sem os ingredientes [x,y,z]?
MATCH (c:Cuisine)<-[:FROM_CUISINE]-(r:Recipe)-[rel:HAS_INGREDIENT]->(i:Ingredient)
with r, c, collect(i.name) as ing_list
where none(name in ['oil','onion'] where name in ing_list) and c.cuisine = 'Indian'
return r
limit 10;