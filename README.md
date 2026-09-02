# db-comissao-telecom
Modelagem de banco de dados relacional para gestão de vendas e cálculo de comissões.
# Sistema de Banco de Dados para Gestão de Vendas e Comissões (Telecom) 📈

Este projeto apresenta a modelagem conceitual, lógica e os scripts de consulta SQL para um sistema de gestão de vendas e cálculo automatizado de comissões de consultores comerciais. A regra de negócio foi baseada na minha experiência de mais de 14 anos no setor de telecomunicações (operando cenários reais de grandes empresas como Nextel, Oi e Vivo).

---

### 🎯 O Problema de Negócio

Em grandes operadoras, o cálculo de comissão envolve múltiplos fatores: tipos de produtos (Controle, Pós-Pago, Fibra), cumprimento de metas individuais e faixas de bonificação. Erros manuais nesse processo geram retrabalho e desmotivação. Este sistema automatiza a consolidação das vendas e aplica as regras financeiras diretamente via banco de dados.

---

### 🏗️ Estrutura do Banco de Dados (Modelagem Lógica)

O banco de dados é composto por 4 tabelas principais interligadas:

1. **`Consultores`**: Armazena os dados dos vendedores, cargos e metas mensais.
2. **`Produtos`**: Catálogo de planos e serviços (Ex: Plano Controle 20GB, Vivo Fibra 500MB) com seus respectivos valores de comissão base.
3. **`Vendas`**: Registro de cada venda realizada (quem vendeu, o que vendeu, quando e o status da ativação).
4. **`Comissoes_Calculadas`**: Tabela gerada para consolidar os pagamentos mensais de cada consultor após a aplicação das regras de metas.

---

---

### 📂 Progresso do Projeto

- [x] Publicar o Script DDL (Criação das tabelas e chaves estrangeiras).
- [x] Construir as Queries de consultas complexas (JOINS) que realizam o cálculo automático das comissões.
- [ ] Inserir dados fictícios de teste (DML) para simular o cenário de uma loja real.


### 📂 Próximos Passos do Projeto

- [ ] Publicar o Script DDL (Criação das tabelas e chaves estrangeiras).
- [ ] Inserir dados fictícios de teste (DML) para simular o cenário de uma loja real.
- [ ] Construir as Queries de consultas complexas (JOINS) que realizam o cálculo automático das comissões com base no atingimento de metas.
