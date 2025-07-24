CREATE TABLE funcionario (
    funcionario_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(50) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    administrador BOOLEAN DEFAULT FALSE 
);

CREATE TABLE bloco (
    bloco_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(50) NOT NULL    
);

CREATE TABLE local (
    local_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    bloco_id INTEGER NOT NULL,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),

    FOREIGN KEY (bloco_id) REFERENCES bloco(bloco_id)
);

CREATE TABLE sala_aula (
    sala_aula_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    numero VARCHAR(10)
);

CREATE TABLE turma (
    turma_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE turno (
    turno_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE horario_aula (
    horario_aula_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sala_id INTEGER NOT NULL,
    turma_id INTEGER NOT NULL,
    turno_id INTEGER NOT NULL,

    FOREIGN KEY (sala_id) REFERENCES sala_aula(sala_aula_id),
    FOREIGN KEY (turma_id) REFERENCES turma(turma_id),
    FOREIGN KEY (turno_id) REFERENCES turno(turno_id)
);

CREATE TABLE sala_professores (
    sala_professores_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    capacidade INTEGER,
    acesso_restrito BOOLEAN DEFAULT TRUE
);

CREATE TABLE laboratorio (
    laboratorio_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    tipo VARCHAR(100),
    capacidade INTEGER
);

CREATE TABLE biblioteca (
    biblioteca_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    responsavel VARCHAR(100)
);

CREATE TABLE auditorio (
    auditorio_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    capacidade INTEGER,
    equipamentos_audio_video TEXT
);

CREATE TABLE refeitorio (
    refeitorio_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    capacidade_assentos INTEGER,
    horario_abertura TIME,
    horario_fechamento TIME,
    tipo_servico VARCHAR(100)
);

CREATE TABLE quadra_esportes (
    quadra_esportes_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    tipo_esporte VARCHAR(100),
    superficie VARCHAR(100),
    iluminacao BOOLEAN DEFAULT TRUE,
    capacidade INTEGER
);

CREATE TABLE banheiro (
    banheiro_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    genero VARCHAR(50),
    funcional BOOLEAN DEFAULT TRUE
);

CREATE TABLE lanchonete (
    lanchonete_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
        tipo_comida VARCHAR(100),
        horario_abertura TIME,
        horario_fechamento TIME,
        contato VARCHAR(100)
);

CREATE TABLE enfermaria (
    enfermaria_id INTEGER PRIMARY KEY
        REFERENCES local(local_id),
    horario_atendimento VARCHAR(50),
    responsavel VARCHAR(100)
);