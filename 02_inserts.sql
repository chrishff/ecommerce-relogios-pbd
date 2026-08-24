USE ecommerce_relogios;

INSERT INTO Marcas (nome, pais_origem) VALUES
('Rolex', 'Suíça'),
('Omega', 'Suíça'),
('Patek Philippe', 'Suíça'),
('Audemars Piguet', 'Suíça'),
('TAG Heuer', 'Suíça');

INSERT INTO Categorias (nome) VALUES
('Esportivo'),
('Clássico'),
('Mergulho'),
('Edição Limitada'),
('Piloto');

INSERT INTO Fornecedores (nome, pais, contato) VALUES
('Swiss Luxury Distributors', 'Suíça', 'contato@swissluxury.ch'),
('Genebra Import Co.', 'Suíça', 'vendas@genebraimport.ch'),
('Global Watch Trading', 'Alemanha', 'info@globalwatch.de'),
('Prestige Timepieces Ltda', 'EUA', 'comercial@prestigetime.com.br'),
('Horologe International', 'França', 'contact@horologe.fr');

INSERT INTO Clientes (nome, email, telefone, endereco, data_cadastro) VALUES
('Carlos Menezes', 'carlos.menezes@email.com', '16991234567', 'Rua Pernambuco, 12 - Araraquara/SP', '2025-02-10'),
('Fernanda Ribeiro', 'fernanda.ribeiro@email.com', '16992345678', 'Av. Brasil, 500 - São Carlos/SP', '2022-03-05'),
('Ricardo Alves', 'ricardo.alves@email.com', '11993456789', 'Rua Augusta, 890 - São Paulo/SP', '2026-04-18'),
('Juliana Costa', 'juliana.costa@email.com', '19994567890', 'Rua XV de Novembro, 45 - Campinas/SP', '2024-05-22'),
('Marcelo Santos', 'marcelo.santos@email.com', '16995678901', 'Av. Portugal, 300 - Ribeirão Preto/SP', '2024-06-30');

INSERT INTO Relogios (nome, id_marca, id_categoria, id_fornecedor, material, preco, estoque) VALUES
('Rolex Submariner Date', 1, 3, 1, 'Aço Oyster', 65000.00, 4),
('Omega Speedmaster Professional', 2, 5, 2, 'Aço Inoxidável', 38000.00, 6),
('Patek Philippe Calatrava', 3, 2, 3, 'Ouro 18k', 210000.00, 2),
('Audemars Piguet Royal Oak', 4, 1, 4, 'Aço/Titânio', 185000.00, 3),
('TAG Heuer Carrera Chronograph', 5, 1, 5, 'Aço Inoxidável', 22000.00, 8),
('Rolex GMT-Master II', 1, 5, 1, 'Aço Oystersteel', 78000.00, 3);

INSERT INTO Pedidos (id_cliente, data_pedido, status, valor_total) VALUES
(1, '2026-06-01', 'Entregue', 65000.00),
(2, '2026-06-15', 'Enviado', 38000.00),
(3, '2026-07-02', 'Entregue', 232000.00),
(4, '2026-07-20', 'Pendente', 22000.00),
(5, '2026-08-05', 'Entregue', 143000.00);

INSERT INTO ItensPedido (id_pedido, id_relogio, quantidade, preco_unitario) VALUES
(1, 1, 1, 65000.00),
(2, 2, 1, 38000.00),
(3, 3, 1, 210000.00),
(3, 5, 1, 22000.00),
(4, 5, 1, 22000.00),
(5, 4, 1, 143000.00);

INSERT INTO Pagamentos (id_pedido, forma_pagamento, valor, data_pagamento, status) VALUES
(1, 'Cartão', 65000.00, '2026-06-01', 'Aprovado'),
(2, 'PIX', 38000.00, '2026-06-15', 'Aprovado'),
(3, 'Boleto', 232000.00, '2026-07-03', 'Aprovado'),
(4, 'Cartão', 22000.00, '2026-07-20', 'Pendente'),
(5, 'PIX', 143000.00, '2026-08-05', 'Aprovado');