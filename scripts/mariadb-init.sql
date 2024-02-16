CREATE DATABASE IF NOT EXISTS recipes_book;

USE recipes_book;

CREATE TABLE users (
    id VARCHAR(36) DEFAULT UUID() PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (id, username, email, password) VALUES
    ('c96ac389-caa9-11ee-885d-18c04df2b611', 'joao_silva', 'joao.silva@example.com', '$2a$10$Ug9k3fGAVujpQKrlcIjjyOz0.zSwu9AcwLg/ouqZRpgmC2CjNZ.7C'), -- Senha: senha123
    ('c96adc15-caa9-11ee-885d-18c04df2b611', 'maria_oliveira', 'maria.oliveira@example.com', '$2a$10$yly1eCUAXKmp.XJSdIY4LuN82P5Gkm4PNeRu1NxTBd0w6rdkErG5W'), -- Senha: senha456
    ('c96adca1-caa9-11ee-885d-18c04df2b611', 'carlos_pereira', 'carlos.pereira@example.com', '$2a$10$Yv.bG0e0aY91.dJRR2FpneWfjCCIF3iYIzFJgA3Ghs.6LCaS69Vqi'), -- Senha: senha789
    ('c96adcd8-caa9-11ee-885d-18c04df2b611', 'ana_santos', 'ana.santos@example.com', '$2a$10$FVoP2Bye98Ebnz4oDdM/2eCMYYWG1zU3yckkKp9.0ckjM1cf.7Hy2'), -- Senha: senhaabc
    ('c96add07-caa9-11ee-885d-18c04df2b611', 'pedro_rodrigues', 'pedro.rodrigues@example.com', '$2a$10$zcS0gO98mD2kOqAeDbfe6eGdKRxt9Wt5OjLZDs7UZNJwviBK9rgl2'), -- Senha: senhadef
    ('c96add36-caa9-11ee-885d-18c04df2b611', 'claudia_ferreira', 'claudia.ferreira@example.com', '$2a$10$ocXpFq5YE1CzrA0lUiz6/e.4/XyQKSYw5UHbHl1y7S2MvQIv7vA9W'), -- Senha: senha555
    ('c96add64-caa9-11ee-885d-18c04df2b611', 'roberto_nunes', 'roberto.nunes@example.com', '$2a$10$.IVGZ5ykNXTA9ofBmqtA4uLl.xb0VcEP6ubq6TZye7IwesrjLym0K'), -- Senha: senha777
    ('c96addbd-caa9-11ee-885d-18c04df2b611', 'julia_amaral', 'julia.amaral@example.com', '$2a$10$vLTl8lVzE2/v4wHirx6HX.FDg4fqRpqPUsBq2YGzF.JALxSkY4cE6'), -- Senha: senha999
    ('c96ade67-caa9-11ee-885d-18c04df2b611', 'fernando_souza', 'fernando.souza@example.com', '$2a$10$BvAT9cUKkBaUSjL9t/3B2ujAaZKMm5Y2QU16ccEZmM.FhLlZg3Ld2'), -- Senha: senha000
    ('c96ade90-caa9-11ee-885d-18c04df2b611', 'luciana_oliveira', 'luciana.oliveira@example.com', '$2a$10$2.T4e6hMZ.jWu3SYwFJcQuCbfuWV8hQZyfV3BFMUqfX5.OgBdt.Mq'); -- Senha: senha4321
    
CREATE TABLE favorites (
    id VARCHAR(36) DEFAULT UUID() PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL REFERENCES users(id),
    recipe_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO favorites (user_id, recipe_id) VALUES
    ('c96ac389-caa9-11ee-885d-18c04df2b611', 'd38b17ff-849b-4a84-adfa-f860ffb849c7'),
    ('c96adc15-caa9-11ee-885d-18c04df2b611', '7ef42ddf-e777-4241-bdc5-289653510892'),
    ('c96adc15-caa9-11ee-885d-18c04df2b611', '73bf1610-6b50-4728-8e49-161790f0a542'),
    ('c96adca1-caa9-11ee-885d-18c04df2b611', '148afc68-66c8-4684-80ad-b956d486886d'),
    ('c96adcd8-caa9-11ee-885d-18c04df2b611', '1971afee-6b10-4b59-99a5-fc99e9c4063b'),
    ('c96add07-caa9-11ee-885d-18c04df2b611', '77e39e78-6495-4a51-a459-d3c7b59ab64c'),
    ('c96add36-caa9-11ee-885d-18c04df2b611', '93cf91d6-066c-45e4-807e-80b03e055f0d'),
    ('c96add64-caa9-11ee-885d-18c04df2b611', '66e61def-9833-41fc-a436-01fda1439f0e'),
    ('c96addbd-caa9-11ee-885d-18c04df2b611', '44920a43-8d3b-4bfd-a430-f2f291298cf5'),
    ('c96ade90-caa9-11ee-885d-18c04df2b611', '8e12607e-d179-485e-a5a5-b5711507ea8e');
    
CREATE TABLE search_logs (
    id VARCHAR(36) DEFAULT UUID() PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL REFERENCES users(id),
    search_type ENUM('recipe', 'ingredients') NOT NULL,
    value VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO search_logs (user_id, search_type, value) VALUES
    ('c96ac389-caa9-11ee-885d-18c04df2b611', 'recipe', 'Ragi Semiya Upma Recipe - Ragi Millet Vermicelli Breakfast'),
    ('c96adc15-caa9-11ee-885d-18c04df2b611', 'ingredients', 'salt;rice vermicelli noodles (thin);asafoetida (hing);mustard seeds'),
    ('c96adc15-caa9-11ee-885d-18c04df2b611', 'recipe', 'Gongura Chicken Curry Recipe - Andhra Style Gongura Chicken'),
    ('c96adca1-caa9-11ee-885d-18c04df2b611', 'ingredients', 'tomato;salt;ginger'),
    ('c96adcd8-caa9-11ee-885d-18c04df2b611', 'recipe', 'Mexican Style Black Bean Burrito Recipe'),
    ('c96add07-caa9-11ee-885d-18c04df2b611', 'ingredients', 'tomato;spring onion'),
    ('c96add36-caa9-11ee-885d-18c04df2b611', 'recipe', 'Andhra Style Alam Pachadi Recipe - Adrak Chutney (Recipe)'),
    ('c96add64-caa9-11ee-885d-18c04df2b611', 'ingredients', 'red chillies;curry'),
    ('c96addbd-caa9-11ee-885d-18c04df2b611', 'recipe', 'Udupi Style Ash Gourd Coconut Curry Recipe'),
    ('c96ade90-caa9-11ee-885d-18c04df2b611', 'ingredients', 'tamarind water;coconut;mustard seeds;jaggery');