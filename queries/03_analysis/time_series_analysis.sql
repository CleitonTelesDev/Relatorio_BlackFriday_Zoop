-- Quais foram os resultados na série temporal do fornecedor que menos vendeu?
SELECT strftime('%Y/%m', v.data_venda) as "Ano/Mes", COUNT(iv.produto_id) as Qtd_Vendas
from itens_venda iv
JOIN vendas v on v.id_venda = iv.venda_id
JOIN produtos p on p.id_produto = iv.produto_id
JOIN fornecedores f on f.id_fornecedor = p.fornecedor_id
WHERE f.nome = 'NebulaNetworks'
GROUP by f.nome, "Ano/Mes"
order by "Ano/Mes", Qtd_Vendas;

-- Quais foram os resultados na série temporal dos dois fornecedores que mais venderam comparando com o fornecedor que menos vendeu?
SELECT "Ano/Mes", 
SUM(case WHEN Nome_Fornecedor == 'NebulaNetworks' THEN Qtd_Vendas ELSE 0 end) as Qtd_Vendas_NebulaNetworks,
SUM(case WHEN Nome_Fornecedor == 'HorizonDistributors' THEN Qtd_Vendas ELSE 0 end) as Qtd_Vendas_HorizonDistributors,
SUM(case WHEN Nome_Fornecedor == 'AstroSupply' THEN Qtd_Vendas ELSE 0 end) as Qtd_Vendas_AstroSupply
FROM(
  SELECT strftime('%Y/%m', v.data_venda) as "Ano/Mes", f.nome as Nome_Fornecedor, COUNT(iv.produto_id) as Qtd_Vendas
  from itens_venda iv
  JOIN vendas v on v.id_venda = iv.venda_id
  JOIN produtos p on p.id_produto = iv.produto_id
  JOIN fornecedores f on f.id_fornecedor = p.fornecedor_id
  WHERE Nome_Fornecedor = 'AstroSupply' or Nome_Fornecedor = 'HorizonDistributors' or Nome_Fornecedor = 'NebulaNetworks'
  GROUP by Nome_Fornecedor, "Ano/Mes"
  order by "Ano/Mes", Qtd_Vendas
  )
  GROUP by "Ano/Mes";