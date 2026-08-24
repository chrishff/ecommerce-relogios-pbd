USE ecommerce_relogios;


-- WHERE + ORDER BY
SELECT nome, estoque, preco
FROM Relogios
WHERE estoque < 3
ORDER BY estoque ASC;
-- Relogios com o estoque baixo 

-- JOIN
SELECT r.nome AS relogio, m.nome AS MARCA, c.nome AS categoria, r.preco
FROM Relogios r
JOIN Marcas m ON r.id_marca = m.id_marca
JOIN Categorias c ON r.id_categoria = c.id_categoria;
-- Catalogo completo de relógios mostrando a marca e a categoria de cada um.alter

-- JOIN + WHERE
SELECT p.id_pedido, cl.nome AS cliente, p.data_pedido, p.valor_total
FROM Pedidos p
JOIN Clientes cl ON p.id_cliente = cl.id_cliente
WHERE p.status = 'Entregue';
-- Pedidos que já foram entregues e para quais clientes

-- GROUP BY + COUNT
SELECT m.nome AS marca, COUNT(r.id_relogio) AS qtd_modelo
FROM Marcas m
JOIN Relogios r ON m.id_marca = r.id_marca
GROUP BY m.nome;
-- Quanto modelos tem de cada marca na loja.

-- GROUP BY + SUM
SELECT cl.nome AS cliente, SUM(p.valor_total) AS total_gasto
FROM Clientes cl
JOIN Pedidos p ON cl.id_cliente = p.id_cliente
GROUP BY cl.nome
ORDER BY total_gasto DESC;
-- Quanto cada cliente já gastou na loja, somando todos os pedidos.

-- GROUP BY + AVG
SELECT c.nome  AS categoria, AVG(r.preco) AS preco_medio
FROM Categorias c 
JOIN Relogios r ON c.id_categoria = r.id_categoria
GROUP BY c.nome;
-- Qual o preço médio dos relógios em cada categoria.alter

-- MAX/MIN 
SELECT MAX(preco) AS relogio_mais_caro, MIN(preco) AS relogio_mais_barato
FROM Relogios;
-- Relogio mais caro e o mais barato do catálogo atualmente.

-- GROUP BY + HAVING
SELECT cl.nome AS cliente, SUM(p.valor_total) AS total_gasto
FROM Clientes cl
JOIN Pedidos p ON cl.id_cliente = p.id_cliente
GROUP BY cl.nome
HAVING SUM(p.valor_total) > 100000;
-- Cliente que gastaram mais de R$100.000 na loja.

-- SUBCONSULTA
SELECT nome, preco
FROM Relogios
WHERE PRECO > (SELECT AVG(preco) FROM Relogios)
ORDER BY preco DESC;
-- Visualizar os relógios com o preço acima da média geral do catálogo.

-- APOIO TOMADA DE DECISÃO
SELECT r.nome AS relogio, m.nome AS marca,
	SUM(ip.quantidade) AS total_vendido,
    SUM(ip.quantidade * ip.preco_unitario) AS receita_gerada
FROM ItensPedido ip
JOIN Relogios r ON ip.id_relogio = r.id_relogio
JOIN Marcas m ON r.id_marca = m.id_marca
GROUP BY r.nome, m.nome
ORDER BY total_vendido DESC, receita_gerada DESC;
-- Os relogios mais vendidos em  quantidade.
