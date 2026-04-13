DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id     INT,
    nome   VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE pedidos (
    id         INT,
    cliente_id INT,
    produto    VARCHAR(50),
    valor      DECIMAL(10,2)
);

INSERT INTO clientes VALUES
(1, 'Ana Silva',     'São Paulo'),
(2, 'Carlos Lima',   'Brasília'),
(3, 'Fernanda Dias', 'Rio de Janeiro'),
(4, 'Roberto Souza', 'São Paulo');

INSERT INTO pedidos VALUES
(1, 1, 'Notebook', 3500.00),
(2, 1, 'Tablet',   1800.00),
(3, 2, 'Celular',  1200.00),
(4, 3, 'Notebook', 3500.00);

SELECT c.nome, c.cidade, p.produto, p.valor
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id;

-- LEFT JOIN: todos os clientes, mesmo sem pedido
SELECT c.nome, c.cidade, p.produto, p.valor
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;

SELECT c.nome, c.cidade, p.produto, p.valor
FROM pedidos p
LEFT JOIN clientes c ON c. id = p.cliente_id

DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id     INT,
    nome   VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE pedidos (
    id         INT,
    cliente_id INT,
    produto    VARCHAR(50),
    valor      DECIMAL(10,2)
);

INSERT INTO clientes VALUES
(1, 'Ana Silva',     'São Paulo'),
(2, 'Carlos Lima',   'Brasília'),
(3, 'Fernanda Dias', 'Rio de Janeiro'),
(4, 'Roberto Souza', 'São Paulo');

INSERT INTO pedidos VALUES
(1, 1, 'Notebook', 3500.00),
(2, 1, 'Tablet',   1800.00),
(3, 2, 'Celular',  1200.00),
(4, 5, 'Notebook', 3500.00);

-- RIGHT JOIN: tudo da direita (pedidos)
SELECT c.nome, c.cidade, p.produto, p.valor
FROM clientes c
RIGHT JOIN pedidos p ON c.id = p.cliente_id;
