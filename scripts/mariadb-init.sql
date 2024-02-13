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
    ('c96ac389-caa9-11ee-885d-18c04df2b611', 'id_da_receita1'),
    ('c96adc15-caa9-11ee-885d-18c04df2b611', 'id_da_receita2'),
    ('c96adc15-caa9-11ee-885d-18c04df2b611', 'id_da_receita3'),
    ('c96adca1-caa9-11ee-885d-18c04df2b611', 'id_da_receita4'),
    ('c96adcd8-caa9-11ee-885d-18c04df2b611', 'id_da_receita5'),
    ('c96add07-caa9-11ee-885d-18c04df2b611', 'id_da_receita6'),
    ('c96add36-caa9-11ee-885d-18c04df2b611', 'id_da_receita7'),
    ('c96add64-caa9-11ee-885d-18c04df2b611', 'id_da_receita8'),
    ('c96addbd-caa9-11ee-885d-18c04df2b611', 'id_da_receita9'),
    ('c96ade90-caa9-11ee-885d-18c04df2b611', 'id_da_receita10');
    
CREATE TABLE search_logs (
    id VARCHAR(36) DEFAULT UUID() PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL REFERENCES users(id),
    search_type ENUM('recipe', 'ingredients') NOT NULL,
    value VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO search_logs (user_id, search_type, value) VALUES
    ('c96ac389-caa9-11ee-885d-18c04df2b611', 'recipe', 'Lasanha;Pizza;Bolo de Chocolate'),
    ('c96adc15-caa9-11ee-885d-18c04df2b611', 'ingredients', 'Tomate;Queijo;Massa'),
    ('c96adc15-caa9-11ee-885d-18c04df2b611', 'recipe', 'Salada Caesar;Sopa de Abóbora'),
    ('c96adca1-caa9-11ee-885d-18c04df2b611', 'ingredients', 'Alface;Frango;Abóbora'),
    ('c96adcd8-caa9-11ee-885d-18c04df2b611', 'recipe', 'Churrasco;Peixe Grelhado'),
    ('c96add07-caa9-11ee-885d-18c04df2b611', 'ingredients', 'Carne;Peixe;Legumes'),
    ('c96add36-caa9-11ee-885d-18c04df2b611', 'recipe', 'Camarão ao Alho e Óleo;Risoto de Cogumelos'),
    ('c96add64-caa9-11ee-885d-18c04df2b611', 'ingredients', 'Camarão;Arroz;Cogumelos'),
    ('c96addbd-caa9-11ee-885d-18c04df2b611', 'recipe', 'Macarrão à Carbonara;Salada de Frutas'),
    ('c96ade90-caa9-11ee-885d-18c04df2b611', 'ingredients', 'Macarrão;Ovos;Bacon');