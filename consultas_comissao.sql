-- ====================================================================
-- SCRIPTS DE CONSULTA E RELATÓRIOS DE NEGÓCIOS (QUERIES)
-- ====================================================================

-- 1. Consulta Básica: Listar todas as vendas ativas com o nome do consultor e do produto vendido
SELECT 
    v.id_venda,
    c.nome AS nome_consultor,
    p.nome_produto,
    p.categoria,
    v.data_venda,
    p.comissao_base
FROM Vendas v
INNER JOIN Consultores c ON v.id_consultor = c.id_consultor
INNER JOIN Produtos p ON v.id_produto = p.id_produto
WHERE v.status_ativacao = 'Ativo'
ORDER BY v.data_venda DESC;


-- 2. Consulta de Fechamento: Calcular o valor total de comissão acumulado por consultor no mês
SELECT 
    c.nome AS nome_consultor,
    c.cargo,
    COUNT(v.id_venda) AS total_linhas_vendidas,
    SUM(p.comissao_base) AS comissao_total_acumulada
FROM Vendas v
INNER JOIN Consultores c ON v.id_consultor = c.id_consultor
INNER JOIN Produtos p ON v.id_produto = p.id_produto
WHERE v.status_ativacao = 'Ativo'
GROUP BY c.id_consultor, c.nome, c.cargo
ORDER BY comissao_total_acumulada DESC;


-- 3. Visão Gerencial: Total de comissões pagas por categoria de produto (Controle, Pós, Fibra)
SELECT 
    p.categoria,
    COUNT(v.id_venda) AS quantidade_vendas,
    SUM(p.comissao_base) AS total_pago_por_categoria
FROM Vendas v
INNER JOIN Produtos p ON v.id_produto = p.id_produto
WHERE v.status_ativacao = 'Ativo'
GROUP BY p.categoria
ORDER BY total_pago_por_categoria DESC;


-- ====================================================================
-- QUERIES AVANÇADAS: DESAFIOS DE NEGÓCIO (PRODUTIVIDADE & METAS)
-- ====================================================================

-- 4. Ranking de Produtos: Identificar os planos mais vendidos na operação
SELECT 
    p.nome_produto,
    p.categoria,
    COUNT(v.id_venda) AS quantidade_vendas
FROM Vendas v
INNER JOIN Produtos p ON v.id_produto = p.id_produto
WHERE v.status_ativacao = 'Ativo'
GROUP BY p.nome_produto, p.categoria
ORDER BY quantidade_vendas DESC;


-- 5. Relatório de Atingimento de Metas (Cálculo de Pontuação usando CASE WHEN)
SELECT 
    c.nome AS nome_consultor,
    c.meta_mensal_pontos AS meta_do_mes,
    SUM(p.pontos) AS pontos_atingidos,
    CASE 
        WHEN SUM(p.pontos) >= c.meta_mensal_pontos THEN 'Bateu Meta! 🏆'
        ELSE 'Não Atingiu 📊'
    END AS status_meta
FROM Vendas v
INNER JOIN Consultores c ON v.id_consultor = c.id_consultor
INNER JOIN Produtos p ON v.id_produto = p.id_produto
WHERE v.status_ativacao = 'Ativo'
GROUP BY c.id_consultor, c.nome, c.meta_mensal_pontos;
