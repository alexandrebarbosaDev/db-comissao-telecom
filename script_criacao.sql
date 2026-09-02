-- Criação do Banco de Dados para Controle de Comissões de Telecom
CREATE TABLE Consultores (
    id_consultor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) DEFAULT 'Consultor de Negócios',
    meta_mensal_pontos INT NOT NULL
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50), -- Controle, Pós-Pago, Fibra, etc.
    comissao_base DECIMAL(10, 2) NOT NULL,
    pontos INT NOT NULL -- ADICIONE ESTA LINHA
);

CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_consultor INT,
    id_produto INT,
    data_venda DATE NOT NULL,
    status_ativacao VARCHAR(20) DEFAULT 'Pendente', -- Pendente, Ativo, Cancelado
    FOREIGN KEY (id_consultor) REFERENCES Consultores(id_consultor),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
