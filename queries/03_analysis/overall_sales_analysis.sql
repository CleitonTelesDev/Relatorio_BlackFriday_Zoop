-- Qual é a performance de vendas no quadro geral?
SELECT strftime('%Y/%m', data_venda) as "Ano/Mes", COUNT(*) as Qtd_Vendas
from vendas
GROUP BY "Ano/Mes"
ORDER by "Ano/Mes"
;

-- Comparação com múltiplos períodos anteriores (Comparação entre os anos/meses)
SELECT Mes,
SUM(CASE WHEN Ano == '2020' THEN Qtd_Vendas Else 0 END) as '2020',
SUM(CASE WHEN Ano == '2021' THEN Qtd_Vendas Else 0 END) as '2021',
SUM(CASE WHEN Ano == '2022' THEN Qtd_Vendas Else 0 END) as '2022',
SUM(CASE WHEN Ano == '2023' THEN Qtd_Vendas Else 0 END) as '2023'
From( 
  SELECT strftime('%m', data_venda) as Mes, strftime('%Y', data_venda) as Ano, COUNT(*) as Qtd_Vendas
  from vendas
  GROUP BY Mes, Ano
  ORDER by Mes
  )
  GROUP by Mes
;