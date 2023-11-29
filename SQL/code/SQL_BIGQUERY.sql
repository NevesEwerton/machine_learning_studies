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
