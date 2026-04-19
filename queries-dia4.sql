DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id          INT,
    nome        VARCHAR(50),
    cidade      VARCHAR(50),
    valor_gasto DECIMAL(10,2)
);

INSERT INTO clientes VALUES
(1, 'Ana Silva',     'São Paulo',      1500.00),
(2, 'Carlos Lima',   'Brasília',       800.00),
(3, 'Fernanda Dias', 'Rio de Janeiro', 2200.00),
(4, 'Roberto Souza', 'São Paulo',      450.00),
(5, 'Julia Mendes',  'Brasília',       3100.00);

-- Quem gastou mais que a média?
SELECT nome, valor_gasto
FROM clientes
WHERE valor_gasto > (
    SELECT AVG(valor_gasto)
    FROM clientes
);

-- Classificar clientes por faixa de gasto
SELECT nome, valor_gasto,
    CASE
        WHEN valor_gasto >= 2000 THEN 'Ouro'
        WHEN valor_gasto >= 1000 THEN 'Prata'
        ELSE 'Bronze'
    END AS categoria
FROM clientes
ORDER BY valor_gasto DESC;

-- Classificar como "Acima da média" ou "Abaixo da média"
SELECT nome, valor_gasto,
    CASE
        WHEN valor_gasto > (SELECT AVG(valor_gasto) FROM clientes)
        THEN 'Acima da média'
        ELSE 'Abaixo da média'
    END AS performance
FROM clientes
ORDER BY valor_gasto DESC;
