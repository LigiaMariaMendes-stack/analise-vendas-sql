CREATE TABLE clientes (
    id       INT,
    nome     VARCHAR(50),
    cidade   VARCHAR(50),
    valor_gasto DECIMAL(10,2)
);

CREATE TABLE vendas (
    id       INT,
    cidade   VARCHAR(50),
    produto  VARCHAR(50),
    valor    DECIMAL(10,2)
);

INSERT INTO clientes VALUES
(1, 'Ana Silva',     'São Paulo',      1500.00),
(2, 'Carlos Lima',   'Rio de Janeiro',  800.00),
(3, 'Fernanda Dias', 'Brasília',       2200.00),
(4, 'Roberto Souza', 'São Paulo',       450.00),
(5, 'Julia Mendes',  'Brasília',       3100.00),
(6, 'Marcos Paulo',  'São Paulo',      1900.00),
(7, 'Carla Souza',   'Rio de Janeiro', 2700.00),
(8, 'Pedro Lima',    'Brasília',        600.00);

INSERT INTO vendas VALUES
(1, 'São Paulo',      'Notebook',  3500.00),
(2, 'Brasília',       'Celular',   1200.00),
(3, 'São Paulo',      'Tablet',    1800.00),
(4, 'Rio de Janeiro', 'Notebook',  3500.00),
(5, 'Brasília',       'Notebook',  3500.00),
(6, 'São Paulo',      'Celular',   1200.00),
(7, 'Rio de Janeiro', 'Tablet',    1800.00),
(8, 'Brasília',       'Tablet',    1800.00);

select nome, cidade from clientes
order by nome ;

select * from clientes 
where valor_gasto > 1000
order by valor_gasto desc

select nome , valor_gasto from clientes 
where nome like 'c%'

select cidade, count (*) as total_clientes 
from clientes 
group by cidade 
order by total_clientes desc

select cidade , sum (valor_gasto) as total_gasto
from clientes
group by cidade 
having sum (valor_gasto) > 3000

SELECT produto, COUNT(*) AS mais_vendido
FROM vendas
GROUP BY produto
ORDER BY mais_vendido DESC;

select cidade, SUM (valor) as receita_total
from vendas
where produto = 'Notebook' or produto = 'Tablet'
group by cidade
order by receita_total desc

SELECT cidade, AVG(valor_gasto) AS media_gastos
FROM clientes
GROUP BY cidade
HAVING AVG(valor_gasto) > 1500
ORDER BY media_gastos DESC;
