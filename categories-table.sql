-- * Retorna todas as categorias disponíveis na tabela.
SELECT * FROM Categorias;

-- * Retorna informações específicas de uma categoria com base no ID.
SELECT * FROM Categorias WHERE CategoriaID = 1;

-- * Conta quantas categorias estão cadastradas.
SELECT COUNT(*) AS TotalCategorias FROM Categorias;

-- * Retorna produtos pertencentes a uma categoria específica.
SELECT
    P.NomeProduto,
    P.Preco
FROM Produtos P
JOIN Categorias CA ON P.CategoriaID = CA.CategoriaID
WHERE CA.CategoriaID = 1;


-- * Retorna categorias com a média dos preços dos produtos associados.
SELECT
    CA.CategoriaID,
    CA.NomeCategoria,
    AVG(P.Preco) AS MediaPreco
FROM Categorias CA
JOIN Produtos P ON CA.CategoriaID = P.CategoriaID
GROUP BY CA.CategoriaID, CA.NomeCategoria;

-- * Conta o número de produtos em cada categoria.
SELECT
    CA.CategoriaID,
    CA.NomeCategoria,
    COUNT(P.ProdutoID) AS NumeroProdutos
FROM Categorias CA
LEFT JOIN Produtos P ON CA.CategoriaID = P.CategoriaID
GROUP BY CA.CategoriaID, CA.NomeCategoria;

-- * Retorna categorias sem produtos associados.
SELECT
    CA.CategoriaID,
    CA.NomeCategoria
FROM Categorias CA
LEFT JOIN Produtos P ON CA.CategoriaID = P.CategoriaID
WHERE P.ProdutoID IS NULL;

