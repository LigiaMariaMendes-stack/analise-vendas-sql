CREATE TABLE clientes (
    id        INT,
    nome      VARCHAR(50),
    cidade    VARCHAR(50),
    valor_gasto DECIMAL(10,2)
);

INSERT INTO clientes VALUES
(1, 'Ana Silva',    'São Paulo',  1500.00),
(2, 'Carlos Lima',  'Rio de Janeiro', 800.00),
(3, 'Fernanda Dias','Brasília',   2200.00),
(4, 'Roberto Souza','São Paulo',  450.00),
(5, 'Julia Mendes', 'Brasília',   3100.00);

SELECT * FROM clientes;
SELECT * FROM clientes
WHERE cidade = 'Brasília';

SELECT * FROM clientes
ORDER BY valor_gasto DESC;

SELECT nome, valor_gasto FROM clientes
WHERE valor_gasto > 1000;

SELECT nome, cidade, valor_gasto FROM clientes
where cidade = 'são paulo' 
order by valor_gasto desc;
