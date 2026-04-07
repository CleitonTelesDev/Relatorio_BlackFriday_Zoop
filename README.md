📊 Análise de Vendas da Black Friday

Insights Estratégicos com SQL para Tomada de Decisão 
🧠 Sobre o Projeto

Este projeto tem como objetivo analisar o desempenho de vendas durante as últimas edições da Black Friday, identificando padrões, tendências e fatores que impactam os resultados. A análise foi desenvolvida com foco em gerar insights acionáveis para apoiar decisões estratégicas de negócio.
🎯 Problema de Negócio

Apesar das diversas ações executadas nas últimas Black Fridays, a ausência de uma análise aprofundada dificultava a compreensão dos resultados reais. Este projeto busca responder questões críticas, tais como:

    As vendas estão crescendo ou caindo? 

    Algum fornecedor impacta negativamente os resultados? 

    Existem padrões sazonais que podem ser explorados? 

🛠️ Tecnologias Utilizadas

    SQL (SQLite) para extração e manipulação de dados.

    Análise exploratória de dados.

    Modelagem de métricas de performance.

    (Opcional: Power BI / Python para visualização).

📂 Dataset

O conjunto de dados utilizado contém informações de vendas estruturadas nos seguintes campos principais:

    data_venda 

    fornecedor 

    categoria 

    marca 

🔍 Análises Realizadas
📉 Performance de Fornecedores

Identificou-se que o fornecedor NebulaNetworks apresentou a pior performance recente, com apenas 529 vendas na última Black Friday analisada e uma tendência de queda contínua nos últimos 4 anos.

    Insight: Os problemas podem estar relacionados ao portfólio, precificação ou relevância dos produtos.

🤝 Comparação entre Fornecedores

Ao comparar os principais players, observou-se que todos apresentam um comportamento semelhante ao longo do tempo.

    Insight: O fornecedor isolado não é o principal fator de variação nas vendas.

📊 Tendência Geral de Vendas

Foi detectada uma queda consistente nas vendas ao longo dos últimos 4 anos.

    Insight: Fatores externos como economia, concorrência e mudanças no comportamento do consumidor podem estar impactando o desempenho.

📅 Sazonalidade

Os meses com maior volume de vendas são Janeiro (1), Novembro (11) e Dezembro (12).

    Destaque: O mês de Maio (5) apresentou um crescimento consistente e inesperado.

    Insight: Existe uma oportunidade clara para campanhas estratégicas fora do período tradicional de Black Friday.

🔥 Principais Insights

    📉 Queda consistente nas vendas ao longo dos anos.

    🤝 Fornecedores não impactam significativamente o volume total.

    📅 Forte sazonalidade com oportunidades em meses não tradicionais (Maio).

    ⚠️ Provável influência de fatores macroeconômicos no desempenho.

📐 Métrica de Acompanhamento (SQL)

A query abaixo foi desenvolvida para comparar o desempenho da Black Friday atual em relação à média histórica:
