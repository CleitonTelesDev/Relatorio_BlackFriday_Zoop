-- Em quais períodos acontecem as vendas?
SELECT DISTINCT STRFTIME('%Y', data_venda) AS Ano FROM vendas ORDER BY Ano;
-- As vendas acontecem no período de 4 anos, de 2020 à 2023 - OBS.: O ano de 2023 ainda está em curso

-- Quais são as vendas ao longo dos anos?
SELECT STRFTIME('%Y', data_venda) AS Ano, COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano
ORDER BY Ano;

-- Quais são as vendas ao longo dos anos e meses?
SELECT STRFTIME('%Y', data_venda) AS Ano, STRFTIME('%m', data_venda) AS Mes, COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano, Mes
ORDER BY Ano;

-- Quais são as vendas ao longo dos anos dos meses de Janeiro, Novembro e Dezembro?
SELECT STRFTIME('%Y', data_venda) AS Ano, STRFTIME('%m', data_venda) AS Mes, COUNT(id_venda) AS Total_Vendas
FROM vendas
WHERE Mes = '01' OR Mes = '11' OR Mes = '12'
GROUP BY Ano, Mes
ORDER BY Ano;