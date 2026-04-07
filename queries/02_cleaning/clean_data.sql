-- Busca produtos específicos que estão fora da faixa de preço considerada normal/esperada para cada categoria
SELECT * FROM produtos
WHERE nome_produto = 'Bola de Futebol' AND preco NOT BETWEEN 20 AND 100
OR
nome_produto = 'Chocolate' AND preco NOT BETWEEN 10 AND 50
OR
nome_produto = 'Celular' AND preco NOT BETWEEN 80 AND 5000
OR
nome_produto = 'Livro de Ficção' AND preco NOT BETWEEN 10 AND 200
OR
nome_produto = 'Camisa' AND preco NOT BETWEEN 80 AND 200;


-- Normaliza os preços dos produtos para faixas específicas usando escala linear (min-max scaling)
-- Mantém a proporção relativa entre os preços, mas ajusta para faixas pré-definidas
BEGIN TRANSACTION;

UPDATE produtos SET preco = 
    ROUND(20 + (preco - (SELECT MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Bola de Futebol')) * (80.0 / (SELECT MAX(preco) - MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Bola de Futebol')), 2)
WHERE nome_produto = 'Bola de Futebol';

-- Chocolate (faixa 10-50)
UPDATE produtos SET preco = 
    ROUND(10 + (preco - (SELECT MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Chocolate')) * (40.0 / (SELECT MAX(preco) - MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Chocolate')), 2)
WHERE nome_produto = 'Chocolate';

-- Celular (faixa 80-5000)
UPDATE produtos SET preco = 
    ROUND(80 + (preco - (SELECT MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Celular')) * (4920.0 / (SELECT MAX(preco) - MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Celular')), 2)
WHERE nome_produto = 'Celular';

-- Livro de Ficção (faixa 10-200)
UPDATE produtos SET preco = 
    ROUND(10 + (preco - (SELECT MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Livro de Ficção')) * (190.0 / (SELECT MAX(preco) - MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Livro de Ficção')), 2)
WHERE nome_produto = 'Livro de Ficção';

-- Camisa (faixa 80-200)
UPDATE produtos SET preco = 
    ROUND(80 + (preco - (SELECT MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Camisa')) * (120.0 / (SELECT MAX(preco) - MIN(preco) FROM produtos p2 WHERE p2.nome_produto = 'Camisa')), 2)
WHERE nome_produto = 'Camisa';

COMMIT;
