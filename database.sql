-- 1- Criar o Database
CREATE DATABASE lojadesafio;

-- 2- Criar Tabelas
USE lojadesafio;

CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

CREATE TABLE ItensPedido (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- Inserir dados
INSERT INTO Clientes (nome, email) VALUES ('Ana Silva', 'ana.silva@email.com');
INSERT INTO Clientes (nome, email) VALUES ('Bruno Costa', 'bruno.costa@email.com');
INSERT INTO Clientes (nome, email) VALUES ('Carla Dias', 'carla.dias@email.com');
INSERT INTO Clientes (nome, email) VALUES ('David Moraes', 'david.moraes@email.com');

INSERT INTO Produtos (nome, preco) VALUES ('Caderno', 10.50);
INSERT INTO Produtos (nome, preco) VALUES ('Caneta', 1.50);
INSERT INTO Produtos (nome, preco) VALUES ('Mochila', 120.00);
INSERT INTO Produtos (nome, preco) VALUES ('Estojo', 15.75);
INSERT INTO Produtos (nome, preco) VALUES ('Lapiseira', 2.99);
INSERT INTO Produtos (nome, preco) VALUES ('Borracha', 0.99);

INSERT INTO Pedidos (cliente_id, data_pedido) VALUES (1, '2023-04-10');
INSERT INTO Pedidos (cliente_id, data_pedido) VALUES (2, '2023-04-11');
INSERT INTO Pedidos (cliente_id, data_pedido) VALUES (1, '2023-04-12');
INSERT INTO Pedidos (cliente_id, data_pedido) VALUES (3, '2023-04-13');

INSERT INTO ItensPedido (pedido_id, produto_id, quantidade) VALUES (1, 1, 3);
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade) VALUES (1, 2, 10);
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade) VALUES (2, 3, 1);
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade) VALUES (3, 1, 1);
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade) VALUES (3, 4, 1);
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade) VALUES (3, 5, 1);
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade) VALUES (4, 2, 5);
