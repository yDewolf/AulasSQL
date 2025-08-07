SELECT * FROM relatorio_pedidos;

CREATE VIEW pedidos_simples AS
SELECT id, id_cliente, produto, valor, data_pedido
FROM pedidos;

-- Forma errada:
INSERT INTO pedidos_simples (id_cliente, produto, valor, data_pedido)
VALUES (3, "SSD", 270.0, "2025-06-01");

SELECT * FROM pedidos_simples;

-- Forma correta:
INSERT INTO clientes (nome, cidade, estado) VALUES
("Ana", "Marília", '2025-06-01');

INSERT INTO pedidos (id_cliente, produto, valor, data_pedido) VALUES
(4, "SSD", 270.0, "2025-06-01");

SELECT * FROM relatorio_pedidos;