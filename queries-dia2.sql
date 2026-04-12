CREATE TABLE vendas (
    id       INT,
    cidade   VARCHAR(50),
    produto  VARCHAR(50),
    valor    DECIMAL(10,2)
);

INSERT INTO vendas VALUES
(1, 'São Paulo',      'Notebook',  3500.00),
(2, 'Brasília',       'Celular',   1200.00),
(3, 'São Paulo',      'Tablet',    1800.00),
(4, 'Rio de Janeiro', 'Notebook',  3500.00),
(5, 'Brasília',       'Notebook',  3500.00),
(6, 'São Paulo',      'Celular',   1200.00),
(7, 'Rio de Janeiro', 'Tablet',    1800.00),
(8, 'Brasília',       'Tablet',    1800.00);

-- Quantas vendas por cidade?
SELECT cidade, COUNT(*) AS total_vendas
FROM vendas
GROUP BY cidade;

-- Total vendido por cidade?
SELECT cidade, SUM(valor) AS receita_total
FROM vendas
GROUP BY cidade
ORDER BY receita_total DESC;

-- Média de valor por produto?
SELECT produto, AVG(valor) AS media_valor
FROM vendas
GROUP BY produto;

select produto , count (*) as total_produto
from vendas 
group by produto

-- Só produtos com mais de 2 vendas
SELECT produto, COUNT(*) AS total_vendas
FROM vendas
GROUP BY produto
HAVING COUNT(*) > 2;

-- Só cidades com receita total acima de R$6.000
SELECT cidade, SUM(valor) AS receita_total
FROM vendas
GROUP BY cidade
HAVING SUM(valor) > 6000;
