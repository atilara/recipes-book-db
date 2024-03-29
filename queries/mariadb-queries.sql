# QUAIS RECEITAS O USUARIO FAVORITOU ?

SELECT
    favorites.recipe_id
FROM
    users
JOIN
    favorites ON users.id = favorites.user_id
WHERE
    users.id = 'c96adc15-caa9-11ee-885d-18c04df2b611';

#==================================================================================================================================================================
# QUAIS USUARIOS FAVORITARAM ESTA RECEITA ?

SELECT
    users.id as user_id,
    users.username,
    users.email
FROM
    users
JOIN
    favorites ON users.id = favorites.user_id
WHERE
    favorites.recipe_id= 'd38b17ff-849b-4a84-adfa-f860ffb849c7';

#==================================================================================================================================================================
# QUANTOS FAVS ESTA RECEITA POSSUI ?

SELECT
    COUNT(favorites.recipe_id) AS total
FROM
    favorites
WHERE
    favorites.recipe_id= 'd38b17ff-849b-4a84-adfa-f860ffb849c7';

#==================================================================================================================================================================
# QUAIS RECEITAS MAIS FAVORITADAS PELOS USUARIOS ?

SELECT
	favorites.recipe_id,
    COUNT(favorites.recipe_id) AS total
FROM
    favorites
GROUP BY
    favorites.recipe_id
ORDER BY
    total DESC;   

#==================================================================================================================================================================
# QUAIS AS ULTIMAS BUSCAS FEITAS POR UM USUARIO ?

SELECT
    id,
    user_id,
    search_type,
    value
FROM
    search_logs
WHERE
    user_id = 'c96ade90-caa9-11ee-885d-18c04df2b611'
ORDER BY
    timestamp DESC
LIMIT 5;