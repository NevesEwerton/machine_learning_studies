# PROJETANDO OS VALORES DA COLUNA 'NAME'

SELECT 
  name
FROM
  ecommerce.categories;

  # TAMBÉM FUNCIONA PONTERANDO O NOME DO PROJETO
 SELECT 
  name
FROM
  `sim-project-360116.ecommerce.categories`;


 SELECT
  name, 
  price
FROM 
  `sim-project-360116.ecommerce.products`;


# PROJETANDO APENAS CINCO LINHAS DA TABELA DESEJADA

SELECT 
  * 
FROM ecommerce.categories 
LIMIT 5

# USO DO DISTINCT - traz os valores não duplicados

SELECT distinct
  category_id
from ecommerce.products

SELECT distinct
  FIRST_NAME
FROM ecommerce.customers;


# NO GOOGLE BIG QUERY NÃO SE COLOCA O APELIDO ENTRE ASPAS
SELECT 
  COUNT(distinct FIRST_NAME) AS 'NOMES DISTINTOS'
FROM
  ecommerce.customers;

# OPERADORES MATEMÁTICOS

SELECT 
  7 + 7 AS SOMA,
  20 - 50 AS SUBTRACAO,
  30 * 80 AS MULTIPLICACAO,
  ROUND(60 / 4,1) AS DIVISAO;

  # COMPARAÇÃO

  SELECT 
    7 = 7 AS COLUNA1,
    7 != 7 AS COLUNA2,
    7 > 8 AS COLUNA3,
    7 < 8 AS COLUNA4,
    7 <= 8 AS COLUNA5,
    7 >= 8 AS COLUNA6;

  # BETWEEN

  SELECT 
    10 BETWEEN 8 AND 15,
    -13 BETWEEN 0 AND 100;

SELECT 
  * 
FROM ecommerce.products 
WHERE 
  PRICE BETWEEN 30 AND 80;

# like

SELECT 
  * 
FROM 
  ecommerce.customers
WHERE FIRST_NAME LIKE 'J%';

SELECT 
  * 
FROM 
  ecommerce.customers
WHERE FIRST_NAME LIKE '%r';


SELECT 
  * 
FROM 
  ecommerce.customers
WHERE FIRST_NAME LIKE 'J%r';

# IN

SELECT * FROM ecommerce.products WHERE PRICE IN (10,11,15);

SELECT * FROM ecommerce.customers WHERE STATE IN ('Acre','Ceará');