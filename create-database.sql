CREATE DATABASE ECommerce;
USE ECommerce;

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    NomeCliente VARCHAR(100),
    EmailCliente VARCHAR(100)
);

CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,
    NomeCategoria VARCHAR(50)
);

CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(200),
    Preco DECIMAL(10, 2),
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE ItensPedido (
    ItemID INT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

INSERT INTO Clientes (ClienteID, NomeCliente, EmailCliente) VALUES
(1, 'João Silva', 'joao@email.com'),
(2, 'Maria Oliveira', 'maria@email.com'),
(3, 'Carlos Pereira', 'carlos@email.com'),
(4, 'José Oliveira', 'jose@email.com'),
(5, 'Ana Silva', 'ana@email.com'),
(6, 'Fernanda Lima', 'fernanda@email.com'),
(7, 'Ricardo Santos', 'ricardo@email.com'),
(8, 'Beatriz Costa', 'beatriz@email.com'),
(9, 'Lucas Silva', 'lucas@email.com'),
(10, 'Mariana Oliveira', 'mariana@email.com');

INSERT INTO Categorias (CategoriaID, NomeCategoria) VALUES
(1, 'Eletrônicos'),
(2, 'Móveis'),
(3, 'Roupas');

INSERT INTO Produtos (ProdutoID, NomeProduto, Preco, CategoriaID) VALUES
(1, 'Smartphone', 799.99, 1),
(2, 'Notebook', 1499.99, 1),
(3, 'TV 4K', 899.99, 1),
(4, 'Câmera DSLR', 599.99, 2),
(5, 'Fones de Ouvido', 129.99, 2),
(6, 'Sofá', 799.99, 3),
(7, 'Mesa de Jantar', 299.99, 3),
(8, 'Camiseta', 29.99, 3),
(9, 'Calça Jeans', 49.99, 3),
(10, 'Cadeira de Escritório', 199.99, 2);

CREATE TABLE Pagamentos (
    PagamentoID INT PRIMARY KEY,
    PedidoID INT,
    ValorPagamento DECIMAL(10, 2),
    MetodoPagamento VARCHAR(50),
    DataPagamento DATE,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido) VALUES
(101, 1, '2024-01-15'),
(102, 2, '2024-01-16'),
(103, 3, '2024-01-17'),
(104, 4, '2024-01-18'),
(105, 5, '2024-01-19'),
(106, 6, '2024-01-20'),
(107, 7, '2024-01-21'),
(108, 8, '2024-01-22'),
(109, 9, '2024-01-23'),
(110, 10, '2024-01-24');

INSERT INTO ItensPedido (ItemID, PedidoID, ProdutoID, Quantidade, PrecoUnitario) VALUES
(1, 101, 1, 2, 799.99),
(2, 101, 2, 1, 1499.99),
(3, 102, 3, 3, 899.99),
(4, 103, 1, 1, 799.99),
(5, 103, 2, 2, 1499.99),
(6, 104, 4, 2, 599.99),
(7, 104, 5, 1, 129.99),
(8, 105, 1, 1, 799.99),
(9, 105, 2, 3, 1499.99),
(10, 106, 3, 2, 899.99);

INSERT INTO Pagamentos (PagamentoID, PedidoID, ValorPagamento, MetodoPagamento, DataPagamento) VALUES
(1, 101, 2299.97, 'Cartão de Crédito', '2024-01-15'),
(2, 102, 4499.97, 'PayPal', '2024-01-16'),
(3, 103, 2099.97, 'Boleto Bancário', '2024-01-17'),
(4, 104, 1799.97, 'Transferência Bancária', '2024-01-18'),
(5, 105, 3299.97, 'Cartão de Débito', '2024-01-19'),
(6, 106, 1899.97, 'Boleto Bancário', '2024-01-20'),
(7, 107, 999.97, 'PayPal', '2024-01-21'),
(8, 108, 1499.97, 'Cartão de Crédito', '2024-01-22'),
(9, 109, 799.97, 'Boleto Bancário', '2024-01-23'),
(10, 110, 899.97, 'Transferência Bancária', '2024-01-24');

SELECT Pedidos.PedidoID, Clientes.NomeCliente, Pedidos.DataPedido, Pagamentos.ValorPagamento, Pagamentos.MetodoPagamento
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID
JOIN Pagamentos ON Pedidos.PedidoID = Pagamentos.PedidoID
ORDER BY Pedidos.DataPedido;
