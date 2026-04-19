DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id      INT,
    nome    VARCHAR(50),
    cidade  VARCHAR(50)
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
(4, 'Roberto Souza', 'São Paulo'),
(5, 'Julia Mendes',  'Brasília');

INSERT INTO pedidos VALUES
(1, 1, 'Notebook',  3500.00),
(2, 1, 'Tablet',    1800.00),
(3, 2, 'Celular',   1200.00),
(4, 3, 'Notebook',  3500.00),
(5, 3, 'Tablet',    1800.00),
(6, 4, 'Celular',   1200.00);

-- Ex 1: nome e produto de todos os clientes com pedido
SELECT c.nome, p.produto
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id;

-- Ex 2: clientes de São Paulo com pedidos
SELECT c.nome, c.cidade, p.produto
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
WHERE c.cidade = 'são paulo';

-- Ex 3: todos os clientes com ou sem pedido
SELECT c.nome, p.produto
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;

-- Ex 4: clientes sem pedido
SELECT c.nome, p.produto
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
WHERE p.cliente_id IS NULL;

-- Ex 5: total gasto por cliente
SELECT c.nome, SUM(p.valor) AS total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome
ORDER BY total_gasto DESC;

-- Ex 6: quantidade de pedidos por cliente
SELECT c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome
ORDER BY total_pedidos DESC;

-- Ex 7: maior compra por cliente
SELECT c.nome, MAX(p.valor) AS maior_compra
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome
ORDER BY maior_compra DESC;
