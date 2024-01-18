-- * Retorna todos os itens registrados na tabela de ItensPedido.
SELECT * FROM ItensPedido;

-- * Retorna informações específicas de um item de pedido com base no ItemID.
SELECT * FROM ItensPedido WHERE ItemID = 1;

-- * Retorna todos os itens de um pedido específico.
SELECT * FROM ItensPedido WHERE PedidoID = 101;

-- * Retorna a quantidade total de um produto específico vendido.
SELECT
    ProdutoID,
    SUM(Quantidade) AS TotalVendido
FROM ItensPedido
WHERE ProdutoID = 1
GROUP BY ProdutoID;

-- * Retorna os detalhes de itens de pedidos com o preço total calculado.
SELECT
    IP.ItemID,
    IP.ProdutoID,
    IP.Quantidade,
    IP.PrecoUnitario,
    IP.Quantidade * IP.PrecoUnitario AS PrecoTotal
FROM ItensPedido IP;


-- * Retorna detalhes de itens de pedidos com desconto aplicado.
SELECT
    IP.ItemID,
    IP.ProdutoID,
    IP.Quantidade,
    IP.PrecoUnitario,
    IP.PrecoUnitario * IP.Quantidade * 0.9 AS PrecoComDesconto
FROM ItensPedido IP;

-- * Lista os produtos mais vendidos, considerando a quantidade total nos itens de pedidos.
SELECT
    IP.ProdutoID,
    P.NomeProduto,
    SUM(IP.Quantidade) AS QuantidadeVendida
FROM ItensPedido IP
JOIN Produtos P ON IP.ProdutoID = P.ProdutoID
GROUP BY IP.ProdutoID, P.NomeProduto
ORDER BY QuantidadeVendida DESC;

-- * Retorna itens de pedidos que estão dentro de um intervalo de datas específico.
SELECT * FROM ItensPedido
WHERE PedidoID IN (
    SELECT PedidoID
    FROM Pedidos
    WHERE DataPedido BETWEEN '2024-01-15' AND '2024-01-18'
);







