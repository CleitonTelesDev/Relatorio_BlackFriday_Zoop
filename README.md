# 📊 Análise de Vendas da Black Friday  
**Insights Estratégicos com SQL para Tomada de Decisão**
________________________________________
## 🧠 Sobre o Projeto  
Este projeto tem como objetivo analisar o desempenho de vendas durante as últimas edições da Black Friday, identificando padrões, tendências e fatores que impactam os resultados.  
A análise foi desenvolvida com foco em gerar insights acionáveis para apoiar decisões estratégicas de negócio.
________________________________________
## 🎯 Problema de Negócio
Apesar de diversas ações terem sido executadas nas últimas Black Fridays, não havia uma análise aprofundada dos resultados.
Isso dificultava responder perguntas como:
*	As vendas estão crescendo ou caindo? 
*	Algum fornecedor impacta negativamente os resultados? 
*	Existem padrões sazonais que podem ser explorados? 
________________________________________
## 🛠️ Tecnologias Utilizadas
*	SQL (SQLite) 
*	Análise exploratória de dados 
*	Modelagem de métricas 
________________________________________
📂 Dataset
O dataset contém informações de vendas com os seguintes campos principais:
•	data_venda 
•	fornecedor 
•	categoria 
•	marca 
________________________________________
🔍 Análises Realizadas
📉 Performance de Fornecedores
•	O fornecedor NebulaNetworks apresentou a pior performance recente 
•	Apenas 529 vendas na última Black Friday analisada 
•	Tendência de queda contínua ao longo dos últimos 4 anos 
📌 Insight:
Problemas podem estar relacionados a portfólio, precificação ou relevância dos produtos.
________________________________________
🤝 Comparação entre Fornecedores
•	Todos os principais fornecedores apresentaram comportamento semelhante ao longo do tempo 
📌 Insight:
O fornecedor não é o principal fator de variação nas vendas
________________________________________
📊 Tendência Geral de Vendas
•	Identificada uma queda nas vendas ao longo dos últimos 4 anos 
📌 Insight:
Fatores externos podem estar impactando:
•	Economia 
•	Concorrência 
•	Mudança no comportamento do consumidor 
________________________________________
📅 Sazonalidade de Vendas
Meses com maior volume de vendas:
•	Janeiro (1) 
•	Novembro (11) 
•	Dezembro (12) 
📌 Destaque:
•	Mês 5 (Maio) apresenta crescimento consistente inesperado 
📌 Insight:
Existe oportunidade de campanhas estratégicas fora da Black Friday.
________________________________________
🔥 Principais Insights
•	📉 Queda consistente nas vendas ao longo dos anos 
•	🤝 Fornecedores não impactam significativamente o volume 
•	📅 Forte sazonalidade com oportunidade fora do período tradicional 
•	⚠️ Influência provável de fatores externos no desempenho 
________________________________________
📐 Métrica de Acompanhamento (SQL)
Para avaliar rapidamente o desempenho da Black Friday atual em relação ao histórico:
WITH Media_Vendas_Anteriores AS (
  SELECT AVG(Qtd_Vendas) AS Media_Vendas
  FROM (
    SELECT COUNT(*) AS Qtd_Vendas,
           strftime("%Y", data_venda) AS Ano,
           strftime("%m", data_venda) AS Mes
    FROM vendas
    WHERE Ano != "2022" AND Mes = "11"
    GROUP BY Ano
  )
),
Vendas_Atual AS (
  SELECT Qtd_Vendas AS Qtd_Vendas_Atual
  FROM (
    SELECT COUNT(*) AS Qtd_Vendas,
           strftime("%Y", data_venda) AS Ano,
           strftime("%m", data_venda) AS Mes
    FROM vendas
    WHERE Ano = "2022" AND Mes = "11"
    GROUP BY Ano
  )
)
SELECT 
  Media_Vendas_Anteriores.Media_Vendas,
  Vendas_Atual.Qtd_Vendas_Atual,
  ROUND(
    (Vendas_Atual.Qtd_Vendas_Atual - Media_Vendas_Anteriores.Media_Vendas) 
    / Media_Vendas_Anteriores.Media_Vendas * 100, 2
  ) || "%" AS Porcentagem
FROM Vendas_Atual, Media_Vendas_Anteriores;

📊 Exemplo de saída
Média Histórica	Vendas Atual	Crescimento
2049.5	3200	+56.14%
________________________________________
✅ Conclusão
•	Nenhum fornecedor isolado explica a queda nas vendas 
•	Existe uma tendência geral negativa que precisa ser investigada 
•	O comportamento sazonal abre oportunidades estratégicas 
________________________________________
🚀 Próximos Passos
•	Analisar impacto de: 
o	Categorias 
o	Marcas 
•	Criar dashboards interativos 
•	Desenvolver novas métricas de performance 
•	Investigar fatores externos (mercado/economia) 
________________________________________
▶️ Como Reproduzir
1.	Carregue o dataset em um banco SQLite 
2.	Execute as queries SQL disponíveis 
3.	Analise os resultados 
________________________________________
💼 Sobre Mim
(coloque aqui)
Sou um profissional de dados focado em transformar dados em insights estratégicos.

📫 Contato:
- LinkedIn: (seu link)
- Email: (seu email)

