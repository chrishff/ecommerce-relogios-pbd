CREATE DATABASE IF NOT EXISTS ecommerce_relogios;
USE ecommerce_relogios;

CREATE TABLE Marcas (
	id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    pais_origem VARCHAR(50)
);

CREATE TABLE Categorias (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Fornecedores (
	id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    contato VARCHAR(100)
);

CREATE TABLE Clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR (100) NOT NULL,
    telefone VARCHAR (20),
    endereco VARCHAR (150),
    data_cadastro DATE
);

CREATE TABLE Relogios (
	id_relogio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_marca INT NOT NULL,
    id_categoria INT NOT NULL,
    id_fornecedor INT NOT NULL,
    material VARCHAR(50),
    preco DECIMAL (10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    valor_total DECIMAL(10 , 2 ) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
);

CREATE TABLE ItensPedido (
	id_item INT AUTO_INCREMENT PRIMARY KEY,
	id_pedido INT NOT NULL,
	id_relogio INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

CREATE TABLE Pagamentos (
	id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATE,
    status VARCHAR(30) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

