-- * Retorna todos os produtos ordenados por nome de forma CASE SENSITIVE.
SELECT * FROM Produtos ORDER BY NomeProduto COLLATE SQL_Latin1_General_CP1_CS_AS;

-- * Retorna todos os produtos ordenados por nome de forma CASE INSENSITIVE.
SELECT * FROM Produtos ORDER BY NomeProduto COLLATE SQL_Latin1_General_CP1_CI_AS;

-- * Retorna todos os clientes ordenados por nome de forma ACCENT SENSITIVE.
SELECT * FROM Clientes ORDER BY NomeCliente COLLATE SQL_Latin1_General_CP1_CS_AS;

-- * Retorna todos os clientes ordenados por nome de forma ACCENT INSENSITIVE.
SELECT * FROM Clientes ORDER BY NomeCliente COLLATE SQL_Latin1_General_CP1_CI_AI;

-- * Lista os produtos mais vendidos, ordenados por nome de forma CASE INSENSITIVE.
SELECT
    P.NomeProduto,
    SUM(IP.Quantidade) AS QuantidadeVendida
FROM Produtos P
JOIN ItensPedido IP ON P.ProdutoID = IP.ProdutoID
GROUP BY P.NomeProduto
ORDER BY QuantidadeVendida DESC COLLATE SQL_Latin1_General_CP1_CI_AS;

-- * Retorna clientes que compraram produtos de uma categoria específica de forma ACCENT SENSITIVE.
SELECT
    C.NomeCliente,
    P.NomeProduto
FROM Clientes C
JOIN Pedidos PD ON C.ClienteID = PD.ClienteID
JOIN ItensPedido IP ON PD.PedidoID = IP.PedidoID
JOIN Produtos P ON IP.ProdutoID = P.ProdutoID
WHERE P.CategoriaID = 1
ORDER BY C.NomeCliente COLLATE SQL_Latin1_General_CP1_CS_AS;

-- * Retorna pagamentos associados a pedidos dentro de um intervalo de datas de forma CASE INSENSITIVE.
SELECT *
FROM Pagamentos P
JOIN Pedidos PD ON P.PedidoID = PD.PedidoID
WHERE PD.DataPedido BETWEEN '2024-01-15' AND '2024-01-18'
ORDER BY P.MetodoPagamento COLLATE SQL_Latin1_General_CP1_CI_AS;




