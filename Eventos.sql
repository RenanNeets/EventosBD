-- Cria��o da tabela eventos
CREATE TABLE eventos (
  id_evento NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  nome_evento VARCHAR2(255) NOT NULL,
  data_evento DATE NOT NULL,
  local_evento VARCHAR2(255) NOT NULL,
  descricao_evento CLOB,
  preco_evento NUMBER(8,2) NOT NULL
);

-- Cria��o da tabela participantes
CREATE TABLE participantes (
  id_participante NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  nome_participante VARCHAR2(255) NOT NULL,
  email_participante VARCHAR2(255) NOT NULL,
  telefone_participante VARCHAR2(20) NOT NULL,
  idade_participante INTEGER,
  empresa_participante VARCHAR2(255)
);

-- Cria��o da tabela inscricoes
CREATE TABLE inscricoes (
  id_inscricao NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  id_participante NUMBER REFERENCES participantes(id_participante),
  id_evento NUMBER REFERENCES eventos(id_evento),
  data_inscricao TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- Inser��o de dados na tabela eventos
INSERT INTO eventos (nome_evento, data_evento, local_evento, descricao_evento, preco_evento)
VALUES ('Confer�ncia de Tecnologia', TO_DATE('2023-09-01', 'YYYY-MM-DD'), 'Centro de Conven��es', 'Uma confer�ncia para discutir as �ltimas tend�ncias em tecnologia', 250.00);

INSERT INTO eventos (nome_evento, data_evento, local_evento, descricao_evento, preco_evento)
VALUES ('Show de Rock', TO_DATE('2023-07-15', 'YYYY-MM-DD'), 'Est�dio de Futebol', 'Um show de rock com bandas famosas', 80.00);

-- Inser��o de dados na tabela participantes
INSERT INTO participantes (nome_participante, email_participante, telefone_participante, idade_participante, empresa_participante)
VALUES ('Jo�o Silva', 'joao.silva@email.com', '(11) 99999-9999', 32, 'Empresa X');

INSERT INTO participantes (nome_participante, email_participante, telefone_participante, idade_participante, empresa_participante)
VALUES ('Maria Souza', 'maria.souza@email.com', '(21) 99999-9999', 28, NULL);

-- Inser��o de dados na tabela inscricoes
INSERT INTO inscricoes (id_participante, id_evento, data_inscricao)
VALUES (1, 1, TO_TIMESTAMP('2023-08-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO inscricoes (id_participante, id_evento, data_inscricao)
VALUES (2, 2, TO_TIMESTAMP('2023-06-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));