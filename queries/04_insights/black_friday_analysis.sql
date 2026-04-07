-- Qual é o papel dos fornecedores na Black Friday?
SELECT strftime('%Y/%m', v.data_venda) as "Ano/Mes", f.nome as Nome_Fornecedor, COUNT(iv.produto_id) as Qtd_Vendas
from itens_venda iv
JOIN vendas v on v.id_venda = iv.venda_id
JOIN produtos p on p.id_produto = iv.produto_id
JOIN fornecedores f on f.id_fornecedor = p.fornecedor_id
where strftime('%m', v.data_venda) = '11'
GROUP by Nome_Fornecedor, "Ano/Mes"
order by "Ano/Mes", Qtd_Vendas;

-- Quais são as categorias de produtos Black Friday 
SELECT strftime('%Y/%m', v.data_venda) as "Ano/Mes", c.nome_categoria as Nome_Categoria, COUNT(iv.produto_id) as Qtd_Vendas
from itens_venda iv
JOIN vendas v on v.id_venda = iv.venda_id
JOIN produtos p on p.id_produto = iv.produto_id
JOIN categorias c on c.id_categoria = p.categoria_id
where strftime('%m', v.data_venda) = '11'
GROUP by Nome_Categoria, "Ano/Mes"
order by "Ano/Mes", Qtd_Vendas;
