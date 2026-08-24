# Projeto — Arquitetura de Dados e Banco de Dados

## 📋 Sobre o projeto

O projeto consiste em um e-commerce especializado na venda de relógios de luxo, oferecendo peças de marcas renomadas como Rolex, Omega e Patek Philippe. A plataforma permite que clientes naveguem por relógios organizados por marca e categoria (esportivo, clássico, mergulho, edição limitada), realizem pedidos com um ou mais itens, e efetuem pagamentos por diferentes formas (cartão, boleto, PIX). O sistema também controla os fornecedores responsáveis pelo abastecimento do estoque, garantindo rastreabilidade das peças — algo essencial no mercado de relógios de alto padrão, onde autenticidade e procedência são fatores críticos de decisão de compra.

## 🗂️ Diagrama de arquitetura de dados

O fluxo de dados do sistema foi organizado em 4 blocos:

Origem dos Dados → Aplicação → Banco de Dados → Consumo dos Dados

Esse diagrama representa o fluxo macro do sistema — diferente do DER, que detalha a estrutura interna das tabelas do banco.

![Diagrama de Arquitetura de Dados](E:\Faculdade\DBS\DAD.png)

## 🧩 Modelagem — Diagrama Entidade-Relacionamento (DER)

O banco é composto por **8 tabelas relacionadas**, organizadas em 3 níveis de dependência:

- **Tabelas independentes:** Marcas, Categorias, Fornecedores, Clientes
- **Tabelas com 1 FK:** Relogios (depende de Marcas, Categorias e Fornecedores), Pedidos (depende de Clientes)
- **Tabelas com 2 FKs:** ItensPedido (depende de Pedidos e Relogios), Pagamentos (depende de Pedidos)

**Relacionamentos:**
- Marcas 1—N Relogios
- Categorias 1—N Relogios
- Fornecedores 1—N Relogios
- Clientes 1—N Pedidos
- Pedidos 1—N ItensPedido
- Relogios 1—N ItensPedido
- Pedidos 1—N Pagamentos

A decisão de modelagem mais importante foi separar **Pedidos** de **ItensPedido**: sem essa tabela intermediária, cada pedido só poderia conter um único relógio. Com ela, um cliente pode comprar vários relógios em uma mesma compra, refletindo o funcionamento real de um e-commerce.

![DER do banco de dados](E:\Faculdade\DBS\DER.png)

## 🗃️ Scripts SQL

| Arquivo | Conteúdo |
|---|---|
| `01_create_tables.sql` | Criação do banco e das 8 tabelas, com chaves primárias e estrangeiras |
| `02_inserts.sql` | Inserção de dados de exemplo (mínimo 5 registros por tabela) |
| `03_consultas.sql` | As 10 consultas SQL do projeto |

As tabelas foram criadas **na ordem de dependência** (independentes → 1 FK → 2 FKs), já que o MySQL não permite criar uma chave estrangeira apontando para uma tabela que ainda não existe.

## 🔍 Consultas SQL


| # | Técnica utilizada | Pergunta de negócio respondida |
|---|---|---|
| 1 | `WHERE` + `ORDER BY` | Quais relógios estão com estoque baixo? |
| 2 | `JOIN` | Qual o catálogo completo, com marca e categoria de cada relógio? |
| 3 | `JOIN` + `WHERE` | Quais pedidos já foram entregues, e para qual cliente? |
| 4 | `GROUP BY` + `COUNT` | Quantos modelos de relógio cada marca tem cadastrados? |
| 5 | `GROUP BY` + `SUM` | Quanto cada cliente já gastou na loja? |
| 6 | `GROUP BY` + `AVG` | Qual o preço médio dos relógios por categoria? |
| 7 | `MAX` / `MIN` | Qual o relógio mais caro e o mais barato do catálogo? |
| 8 | `GROUP BY` + `HAVING` | Quais clientes podem ser classificados como "VIP" (gastaram mais de R$100.000)? |
| 9 | Subconsulta | Quais relógios têm preço acima da média geral do catálogo? |
| **10** | **Apoio à tomada de decisão** | **Quais relógios são os mais vendidos em quantidade? (orienta reposição de estoque e investimento em divulgação)** |

## ⚙️ Como executar

1. Abra o MySQL Workbench (ou outro cliente MySQL)
2. Execute `01_create_tables.sql`
3. Execute `02_inserts.sql`
4. Execute `03_selects.sql`

## 👥 Integrantes

- Christian hugo Ferreira