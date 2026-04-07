-- MÉTRICAS - KPI
-- Quantidade de vendas de Novembro de 2020 e 2021
SELECT COUNT(*) as Qtd_Vendas, strftime('%Y', v.data_venda) AS Ano
FROM vendas v
WHERE strftime('%m', v.data_venda) = '11' AND Ano != '2022'
GROUP by Ano
;

-- Média de quantidade de vendas de Novembro de 2020 e 2021
SELECT AVG(Qtd_Vendas) AS Media_Qtd_Vendas
From (
  SELECT COUNT(*) as Qtd_Vendas, strftime('%Y', v.data_venda) AS Ano
  FROM vendas v
  WHERE strftime('%m', v.data_venda) = '11' AND Ano != '2022'
  GROUP by Ano
)
;

-- Quantidade de vendas de Novembro de 2022 (Qtd_Vendas_Atual)
SELECT Qtd_Vendas as Qtd_Vendas_Atual
FROM(
  SELECT COUNT(*) as Qtd_Vendas, strftime('%Y', v.data_venda) AS Ano
  FROM vendas v
  WHERE strftime('%m', v.data_venda) = '11' AND Ano = '2022'
  GROUP by Ano
)
;

-- USANDO O WITH
-- Media + Vendas_Atual + Porcentagem
WITH Media_Vendas_Anteriores as (SELECT AVG(Qtd_Vendas) AS Media_Qtd_Vendas
From (
  SELECT COUNT(*) as Qtd_Vendas, strftime('%Y', v.data_venda) AS Ano
  FROM vendas v
  WHERE strftime('%m', v.data_venda) = '11' AND Ano != '2022'
  GROUP by Ano
)), Vendas_Atual as (SELECT Qtd_Vendas as Qtd_Vendas_Atual
FROM(
  SELECT COUNT(*) as Qtd_Vendas, strftime('%Y', v.data_venda) AS Ano
  FROM vendas v
  WHERE strftime('%m', v.data_venda) = '11' AND Ano = '2022'
  GROUP by Ano
))
SELECT 
mva.Media_Qtd_Vendas,
va.Qtd_Vendas_Atual,
ROUND((va.Qtd_Vendas_Atual - mva.Media_Qtd_Vendas) / mva.Media_Qtd_Vendas * 100.0, 2) || '%' AS Porcentagem
from Vendas_Atual va, Media_Vendas_Anteriores mva
