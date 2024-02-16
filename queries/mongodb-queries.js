// Quais pratos da culinária x temos no livro de receita?

db.recipes.find({
  cuisine: "South Indian Recipes",
});

// Quais pratos posso preparar em menos de x minutos?

db.recipes.find({
  time_minutes: { $lt: 20 },
});

db.recipes.find({ time_minutes: { $gte: 10, $lte: 20 } }); //range

// Como preparo uma receita x?

db.recipes.find(
  {
    uuid: "77e39e78-6495-4a51-a459-d3c7b59ab64c",
  },
  {
    instructions: 1,
  }
);

// Quais ingredientes são necessários para preparar um prato x?

// Quais pratos posso preparar com menos de x ingredientes?

db.recipes.find({ ingredients_number: { $lt: 4 } });

// Quais pratos posso preparar em menos de x minutos e com menos de y ingredientes?

db.recipes.find({ time_minutes: { $lt: 20 }, ingredients_number: { $lt: 8 } });

// Quais foram os pratos favoritados pelo usuário x?
// [Recebe array de IDs recebidos pelo MariaDB, caso a aplicação estivesse em execução]

db.recipes.find({
  uuid: {
    $in: [
      "d38b17ff-849b-4a84-adfa-f860ffb849c7",
      "7ef42ddf-e777-4241-bdc5-289653510892",
      "73bf1610-6b50-4728-8e49-161790f0a542",
      "148afc68-66c8-4684-80ad-b956d486886d",
      "1971afee-6b10-4b59-99a5-fc99e9c4063b",
      "77e39e78-6495-4a51-a459-d3c7b59ab64c",
    ],
  },
});

// Dados que precisam ser gerados aleatoriamente:
// Custo de preparo de um prato
// Calorias
// Dificuldade

// Quais pratos posso preparar com menos de x reais?

// Quais pratos posso preparar com menos de x calorias e menos de x reais?

// Quais pratos posso preparar facilmente?
