-- * Retorna todos os produtos dispon�veis na tabela.
SELECT * FROM Produtos;

-- * Retorna informa��es espec�ficas de um produto com base no ID.
SELECT * FROM Produtos WHERE ProdutoID = 1;

-- * Retorna todos os produtos ordenados alfabeticamente pelo nome.
SELECT * FROM Produtos ORDER BY NomeProduto;

-- * Conta quantos produtos est�o cadastrados.
SELECT COUNT(*) AS TotalProdutos FROM Produtos;

-- * Retorna produtos com pre�os acima de um valor espec�fico.
SELECT * FROM Produtos WHERE Preco > 1000;

-- * Lista os produtos mais vendidos, ordenados pela quantidade total vendida.
SELECT
    P.NomeProduto,
    SUM(IP.Quantidade) AS QuantidadeVendida
FROM Produtos P
JOIN ItensPedido IP ON P.ProdutoID = IP.ProdutoID
GROUP BY P.NomeProduto
ORDER BY QuantidadeVendida DESC;

-- * Retorna produtos pertencentes a uma categoria espec�fica.
SELECT * FROM Produtos WHERE CategoriaID = 1;

-- * Calcula a m�dia dos pre�os de todos os produtos.
SELECT AVG(Preco) AS MediaPreco FROM Produtos;

-- * Exibe produtos junto com suas categorias associadas.
SELECT
    P.NomeProduto,
    P.Preco,
    CA.NomeCategoria
FROM Produtos P
JOIN Categorias CA ON P.CategoriaID = CA.CategoriaID;

-- * Retorna produtos com pre�os abaixo de uma quantia espec�fica.
SELECT * FROM Produtos WHERE Preco < 500;

