# Projeto de E-Commerce com SQL Server

Este projeto é uma simulação de um sistema de E-Commerce, implementado no Microsoft SQL Server, utilizando o SQL Server Management Studio (SSMS). Ele inclui a criação de tabelas para clientes, produtos, pedidos, itens de pedidos, categorias e pagamentos. O objetivo é fornecer uma estrutura básica para um sistema de comércio eletrônico, permitindo consultas e análises simples sobre clientes, vendas e produtos.

## Funcionalidades Principais

| Funcionalidade       | Descrição                                                                                    |
|----------------------|----------------------------------------------------------------------------------------------|
| **Clientes**         | Cadastro de clientes com informações como nome e e-mail.                                   |
| **Produtos**         | Registro de produtos contendo nome, preço e categoria.                                      |
| **Pedidos**          | Geração de pedidos associados a clientes, com informações de data.                           |
| **Itens de Pedidos** | Relacionamento entre pedidos e produtos, indicando quantidade e preço unitário.               |
| **Categorias**       | Classificação dos produtos em categorias.                                                    |
| **Pagamentos**       | Registro de pagamentos associados a pedidos, incluindo valor, método de pagamento e data.     |

## Consultas Exemplificadas

O projeto inclui consultas SQL exemplificadas que demonstram como extrair informações úteis, como os produtos mais vendidos, clientes que mais compraram e a média de gastos por cliente.

## Uso de COLLATION no SQL Server

As consultas e ordenações neste projeto utilizam COLLATION para lidar com questões de sensibilidade a maiúsculas/minúsculas e acentuação, garantindo a correta ordenação e comparação de dados.

Este projeto é uma ferramenta útil para entender conceitos básicos de modelagem de dados para comércio eletrônico, específicos para o ambiente do SQL Server. Pode ser estendido e adaptado para necessidades específicas neste ambiente.
