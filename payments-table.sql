-- * Retorna todos os registros de pagamento da tabela.
SELECT * FROM Pagamentos;

-- * Retorna informa��es espec�ficas de um pagamento com base no ID.
SELECT * FROM Pagamentos WHERE PagamentoID = 1;

-- * Retorna o total de pagamentos agrupados por m�todo de pagamento.
SELECT
    MetodoPagamento,
    SUM(ValorPagamento) AS TotalPagamentos
FROM Pagamentos
GROUP BY MetodoPagamento;

-- * Retorna pagamentos realizados em uma data espec�fica.
SELECT * FROM Pagamentos WHERE DataPagamento = '2024-01-15';

-- * Calcula a m�dia dos valores pagos agrupados por m�todo de pagamento.
SELECT
    MetodoPagamento,
    AVG(ValorPagamento) AS MediaPagamento
FROM Pagamentos
GROUP BY MetodoPagamento;

-- * Retorna pagamentos associados a pedidos dentro de um intervalo de datas.
SELECT *
FROM Pagamentos P
JOIN Pedidos PD ON P.PedidoID = PD.PedidoID
WHERE PD.DataPedido BETWEEN '2024-01-15' AND '2024-01-18';

-- * Conta o n�mero total de pagamentos realizados.
SELECT COUNT(*) AS TotalPagamentos FROM Pagamentos;
