-- =====================================================================
-- EXERCÍCIO AULA 08 - CRIAÇÃO DE TABELA E MANIPULAÇÃO DE DADOS
-- =====================================================================
-- Disciplina: Banco de Dados com MySQL
-- Professora: Tainá Isabela
-- Objetivo: Criar tabela CLIENTE, inserir dados e consultar registros
-- =====================================================================

-- Criação da tabela CLIENTE
CREATE TABLE cliente (
    id_c INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL
);

-- Inserção do primeiro registro
INSERT INTO cliente (nome, cpf) VALUES ('João Silva', '12345678901');

-- Inserção do segundo registro
INSERT INTO cliente (nome, cpf) VALUES ('Maria Santos', '98765432100');

-- Consulta para visualizar todos os registros
SELECT * FROM cliente;

-- Consulta com alias para melhor legibilidade
SELECT 
    id_c AS 'ID do Cliente',
    nome AS 'Nome Completo',
    cpf AS 'CPF'
FROM cliente;

-- Contagem total de clientes
SELECT COUNT(*) AS 'Total de Clientes' FROM cliente;