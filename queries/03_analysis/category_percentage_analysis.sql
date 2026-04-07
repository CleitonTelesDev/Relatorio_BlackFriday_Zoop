-- Qual é a porcentagem de vendas por categorias
SELECT Nome_Categoria, Qtd_Vendas, ROUND(100.0 * Qtd_Vendas/(SELECT COUNT(*) FROM itens_venda), 2) || '%' AS Porcentagem
FROM(
  SELECT c.nome_categoria as Nome_Categoria, COUNT(iv.produto_id) as Qtd_Vendas
  from itens_venda iv
  JOIN vendas v on v.id_venda = iv.venda_id
  JOIN produtos p on p.id_produto = iv.produto_id
  JOIN categorias c on c.id_categoria = p.categoria_id
  GROUP by Nome_Categoria
  order by Qtd_Vendas DESC
);


