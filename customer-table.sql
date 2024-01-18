-- Retorna todos os registros da tabela de Clientes.
SELECT * FROM Clientes;

-- *Retorna informações específicas de um cliente com base no ClienteID.
SELECT * FROM Clientes WHERE ClienteID = 1;

-- *Retorna todos os clientes ordenados alfabeticamente pelo nome.
SELECT * FROM Clientes ORDER BY NomeCliente;

-- *Conta o número total de registros na tabela de Clientes.
SELECT COUNT(*) AS TotalClientes FROM Clientes;

-- *Identifica clientes com e-mails duplicados e a quantidade de duplicatas.
SELECT EmailCliente, COUNT(EmailCliente) AS QtdDuplicados
FROM Clientes
GROUP BY EmailCliente
HAVING COUNT(EmailCliente) > 1;

-- *Retorna clientes ordenados pelo total gasto em pedidos.
SELECT
    C.ClienteID,
    C.NomeCliente,
    SUM(IP.Quantidade * IP.PrecoUnitario) AS TotalGasto
FROM Clientes C
JOIN Pedidos P ON C.ClienteID = P.ClienteID
JOIN ItensPedido IP ON P.PedidoID = IP.PedidoID
GROUP BY C.ClienteID, C.NomeCliente
ORDER BY TotalGasto DESC;


-- *Retorna clientes que fizeram mais de uma compra.
SELECT
    C.ClienteID,
    C.NomeCliente,
    COUNT(DISTINCT P.PedidoID) AS QuantidadeCompras
FROM Clientes C
JOIN Pedidos P ON C.ClienteID = P.ClienteID
GROUP BY C.ClienteID, C.NomeCliente
HAVING COUNT(DISTINCT P.PedidoID) > 1
ORDER BY QuantidadeCompras DESC;

-- *Retorna clientes e as categorias de produtos comprados.
SELECT
    C.NomeCliente,
    P.NomeProduto,
    CA.NomeCategoria
FROM Clientes C
JOIN Pedidos PE ON C.ClienteID = PE.ClienteID
JOIN ItensPedido IP ON PE.PedidoID = IP.PedidoID
JOIN Produtos P ON IP.ProdutoID = P.ProdutoID
JOIN Categorias CA ON P.CategoriaID = CA.CategoriaID;


--*Retorna clientes e seus últimos pedidos.
SELECT
    C.NomeCliente,
    P.PedidoID,
    P.DataPedido
FROM Clientes C
JOIN Pedidos P ON C.ClienteID = P.ClienteID
ORDER BY P.DataPedido DESC;

-- *Retorna clientes que ainda não fizeram nenhum pedido.
SELECT C.NomeCliente
FROM Clientes C
WHERE C.ClienteID NOT IN (SELECT DISTINCT ClienteID FROM Pedidos);


