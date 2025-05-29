-- =============================================
-- Space Coffee - Sistema de Gerenciamento
-- =============================================
-- Este script cria a estrutura do banco de dados
-- para o sistema de gerenciamento da Space Coffee
-- =============================================

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS space_coffee;
USE space_coffee;

-- =============================================
-- Tabela: produtos
-- Armazena informações sobre os produtos da cafeteria
-- =============================================
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    estoque INT NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- Tabela: pedidos
-- Registra os pedidos feitos pelos clientes
-- =============================================
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pedido ENUM('pendente', 'em_preparo', 'concluido', 'entregue') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    observacoes TEXT
);

-- =============================================
-- Tabela: itens_pedido
-- Tabela de relacionamento que conecta produtos e pedidos
-- Permite que um pedido tenha vários produtos e
-- que um produto possa estar em vários pedidos
-- =============================================
CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- =============================================
-- Inserção de dados de exemplo
-- =============================================

-- Inserção de produtos
INSERT INTO produtos (nome, descricao, preco, categoria, estoque) VALUES
('Café Espresso', 'Café forte e concentrado', 5.90, 'Café', 100),
('Cappuccino', 'Café com leite e espuma', 8.90, 'Café', 80),
('Bolo de Chocolate', 'Bolo fofinho com cobertura de chocolate', 12.90, 'Sobremesa', 20);

-- Inserção de pedidos
INSERT INTO pedidos (status_pedido, valor_total, observacoes) VALUES
('concluido', 14.80, 'Pedido para viagem'),
('em_preparo', 21.70, 'Mesa 3'),
('pendente', 8.90, 'Sem açúcar');

-- Inserção de itens do pedido
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 5.90),  -- 2 cafés expresso no pedido 1
(2, 2, 1, 8.90),  -- 1 cappuccino no pedido 2
(2, 3, 1, 12.90), -- 1 bolo de chocolate no pedido 2
(3, 2, 1, 8.90);  -- 1 cappuccino no pedido 3 