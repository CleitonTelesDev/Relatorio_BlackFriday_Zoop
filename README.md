# 🧠 Sobre o Projeto  

Este projeto tem como objetivo analisar o desempenho de vendas durante as últimas edições da Black Friday, identificando **padrões, tendências e fatores que impactam os resultados**.

A análise foi desenvolvida com foco em gerar **insights acionáveis** para apoiar decisões estratégicas de negócio.

---

## 🎯 Problema de Negócio  

Apesar de diversas ações terem sido executadas nas últimas Black Fridays, **não havia uma análise aprofundada dos resultados**.

Isso dificultava responder perguntas como:

- As vendas estão crescendo ou caindo?  
- Algum fornecedor impacta negativamente os resultados?  
- Existem padrões sazonais que podem ser explorados?  

---

## 🛠️ Tecnologias Utilizadas  

- SQL (SQLite)  
- Análise exploratória de dados  
- Modelagem de métricas
________________________________________
## 📂 Dataset

O dataset foi estruturado em um modelo relacional, contendo tabelas de fatos, dimensões e uma tabela ponte para suportar análises de vendas.

---

## 🧠 Modelagem de Dados

O modelo segue o padrão **Star Schema (Esquema Estrela)**, garantindo melhor performance e organização das análises.

- 🧾 **Tabela Fato:** vendas  
- 🔗 **Tabela Ponte:** itens_venda  
- 📊 **Tabelas Dimensão:** clientes, produtos, categorias, marcas, fornecedores  

---

## 🧾 Tabela Fato

### 🛒 vendas

Tabela principal contendo as transações de vendas.

| Coluna       | Tipo    | Descrição |
|-------------|--------|----------|
| id_venda    | INTEGER | Identificador da venda |
| data_venda  | DATE    | Data da venda |
| total_venda | REAL    | Valor total da venda |
| cliente_id  | INTEGER | Referência ao cliente |

---

## 🔗 Tabela Ponte

### 📦 itens_venda

Relaciona produtos às vendas (resolvendo relacionamento N:N).

| Coluna      | Tipo    | Descrição |
|------------|--------|----------|
| venda_id   | INTEGER | Referência à venda |
| produto_id | INTEGER | Referência ao produto |

---

## 📊 Tabelas Dimensão

### 👤 clientes

| Coluna        | Tipo    | Descrição |
|--------------|--------|----------|
| id_cliente   | INTEGER | Identificador do cliente |
| nome_cliente | TEXT    | Nome do cliente |
| idade        | INTEGER | Idade |
| endereco     | TEXT    | Endereço |

---

### 📦 produtos

| Coluna         | Tipo    | Descrição |
|---------------|--------|----------|
| id_produto    | INTEGER | Identificador do produto |
| nome_produto  | TEXT    | Nome do produto |
| preco         | REAL    | Preço do produto |
| categoria_id  | INTEGER | Referência à categoria |
| marca_id      | TEXT    | Referência à marca |
| fornecedor_id | INTEGER | Referência ao fornecedor |
| data_estoque  | DATE    | Data de entrada em estoque |
| status        | TEXT    | Status do produto |

---

### 🏷️ categorias

| Coluna          | Tipo | Descrição |
|----------------|------|----------|
| id_categoria   | TEXT | Identificador da categoria |
| nome_categoria | TEXT | Nome da categoria |

---

### 🏢 fornecedores

| Coluna         | Tipo    | Descrição |
|---------------|--------|----------|
| id_fornecedor | INTEGER | Identificador do fornecedor |
| nome          | TEXT    | Nome do fornecedor |
| contato       | TEXT    | Contato |

---

### 🏷️ marcas

| Coluna   | Tipo | Descrição |
|----------|------|----------|
| id_marca | TEXT | Identificador da marca |
| nome     | TEXT | Nome da marca |

---

## 🔗 Relacionamentos

- vendas.cliente_id → clientes.id_cliente  
- itens_venda.venda_id → vendas.id_venda  
- itens_venda.produto_id → produtos.id_produto  
- produtos.categoria_id → categorias.id_categoria  
- produtos.marca_id → marcas.id_marca  
- produtos.fornecedor_id → fornecedores.id_fornecedor  

---

## 🖼️ Modelo de Dados

![Diagrama do Banco de Dados](https://github.com/CleitonTelesDev/Relatorio_BlackFriday_Zoop/blob/main/docs/diagram.png?raw=true)
________________________________________
# 🔍 Análises Realizadas  

---

## 📉 Performance de Fornecedores  

- O fornecedor **NebulaNetworks** apresentou a pior performance recente  
- Apenas **529 vendas na última Black Friday analisada**  
- Tendência de queda contínua ao longo dos últimos 4 anos  

📌 **Insight:**  
Problemas podem estar relacionados a portfólio, precificação ou relevância dos produtos.

---

## 🤝 Comparação entre Fornecedores  

- Todos os principais fornecedores apresentaram comportamento semelhante ao longo do tempo  

📌 **Insight:**  
O fornecedor não é o principal fator de variação nas vendas.

---

## 📊 Tendência Geral de Vendas  

- Identificada uma queda nas vendas ao longo dos últimos 4 anos  

📌 **Insight:**  
Fatores externos podem estar impactando:

- Economia  
- Concorrência  
- Mudança no comportamento do consumidor  

---

## 📅 Sazonalidade de Vendas  

Meses com maior volume de vendas:

- Janeiro (1)  
- Novembro (11)  
- Dezembro (12)  

📌 **Destaque:**

- Mês 5 (Maio) apresenta crescimento consistente inesperado  

📌 **Insight:**  
Existe oportunidade de campanhas estratégicas fora da Black Friday.

---

## 🔥 Principais Insights  

- 📉 Queda consistente nas vendas ao longo dos anos  
- 🤝 Fornecedores não impactam significativamente o volume  
- 📅 Forte sazonalidade com oportunidade fora do período tradicional  
- ⚠️ Influência provável de fatores externos no desempenho  

---

## 📐 Métrica de Acompanhamento (SQL)  

Para avaliar rapidamente o desempenho da Black Friday atual em relação ao histórico:

```sql
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
```

## 📊 Exemplo de saída  

| 📉 **Média Vendas Anteriores** | 📈 **Vendas Novembro Atual** | 🚀 **% Aumento** |
|:-----------------------------:|:---------------------------:|:----------------:|
| **2049.5**                    | **3200**                    | **56.14%**       |
________________________________________
## ✅ Conclusão  

- Nenhum fornecedor isolado explica a queda nas vendas  
- Existe uma tendência geral negativa que precisa ser investigada  
- O comportamento sazonal abre oportunidades estratégicas  

---

## 🚀 Próximos Passos  

- Analisar impacto de:
  - Categorias  
  - Marcas  
- Criar dashboards interativos  
- Desenvolver novas métricas de performance  
- Investigar fatores externos (mercado/economia)  

---

## ▶️ Como Reproduzir  

1. Carregue o dataset em um banco SQLite  
2. Execute as queries SQL disponíveis  
3. Analise os resultados  

---

## 💼 Sobre Mim  

*(Cleiton Teles)*  

Sou um profissional de dados focado em transformar dados em insights estratégicos.

📫 Contato:

- LinkedIn: (www.linkedin.com/in/cleitonteles)  
- Email: (juantrick@gmail.com)  

