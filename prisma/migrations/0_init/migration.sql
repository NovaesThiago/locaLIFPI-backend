-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateTable
CREATE TABLE "public"."auditorio" (
    "auditorio_id" BIGSERIAL NOT NULL,
    "capacidade" INTEGER,
    "equipamentos_audio_video" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "auditorio_pkey" PRIMARY KEY ("auditorio_id")
);

-- CreateTable
CREATE TABLE "public"."banheiro" (
    "banheiro_id" BIGSERIAL NOT NULL,
    "genero" VARCHAR,
    "funcional" BOOLEAN DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "banheiro_pkey" PRIMARY KEY ("banheiro_id")
);

-- CreateTable
CREATE TABLE "public"."biblioteca" (
    "biblioteca_id" BIGSERIAL NOT NULL,
    "responsavel" VARCHAR,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "biblioteca_pkey" PRIMARY KEY ("biblioteca_id")
);

-- CreateTable
CREATE TABLE "public"."bloco" (
    "bloco_id" BIGSERIAL NOT NULL,
    "nome" VARCHAR NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "bloco_pkey" PRIMARY KEY ("bloco_id")
);

-- CreateTable
CREATE TABLE "public"."enfermaria" (
    "enfermaria_id" BIGSERIAL NOT NULL,
    "horario_atendimento" VARCHAR,
    "responsavel" VARCHAR,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "enfermaria_pkey" PRIMARY KEY ("enfermaria_id")
);

-- CreateTable
CREATE TABLE "public"."funcionario" (
    "funcionario_id" BIGSERIAL NOT NULL,
    "nome" VARCHAR NOT NULL,
    "login" VARCHAR NOT NULL,
    "senha" VARCHAR NOT NULL,
    "administrador" BOOLEAN DEFAULT false,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "funcionario_pkey" PRIMARY KEY ("funcionario_id")
);

-- CreateTable
CREATE TABLE "public"."horario_aula" (
    "horario_aula_id" BIGSERIAL NOT NULL,
    "sala_id" BIGINT NOT NULL,
    "turma_id" BIGINT NOT NULL,
    "turno_id" BIGINT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "horario_aula_pkey" PRIMARY KEY ("horario_aula_id")
);

-- CreateTable
CREATE TABLE "public"."laboratorio" (
    "laboratorio_id" BIGSERIAL NOT NULL,
    "tipo" VARCHAR,
    "capacidade" INTEGER,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "laboratorio_pkey" PRIMARY KEY ("laboratorio_id")
);

-- CreateTable
CREATE TABLE "public"."lanchonete" (
    "lanchonete_id" BIGSERIAL NOT NULL,
    "tipo_comida" VARCHAR,
    "horario_abertura" TIME(6),
    "horario_fechamento" TIME(6),
    "contato" VARCHAR,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "lanchonete_pkey" PRIMARY KEY ("lanchonete_id")
);

-- CreateTable
CREATE TABLE "public"."local" (
    "local_id" BIGSERIAL NOT NULL,
    "nome" VARCHAR NOT NULL,
    "bloco_id" BIGINT NOT NULL,
    "x" INTEGER,
    "y" INTEGER,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "local_pkey" PRIMARY KEY ("local_id")
);

-- CreateTable
CREATE TABLE "public"."quadra_esportes" (
    "quadra_esportes_id" BIGSERIAL NOT NULL,
    "tipo_esporte" VARCHAR,
    "superficie" VARCHAR,
    "iluminacao" BOOLEAN DEFAULT true,
    "capacidade" INTEGER,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "quadra_esportes_pkey" PRIMARY KEY ("quadra_esportes_id")
);

-- CreateTable
CREATE TABLE "public"."refeitorio" (
    "refeitorio_id" BIGSERIAL NOT NULL,
    "capacidade_assentos" INTEGER,
    "horario_abertura" TIME(6),
    "horario_fechamento" TIME(6),
    "tipo_servico" VARCHAR,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "refeitorio_pkey" PRIMARY KEY ("refeitorio_id")
);

-- CreateTable
CREATE TABLE "public"."sala_aula" (
    "sala_aula_id" BIGSERIAL NOT NULL,
    "numero" VARCHAR NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "sala_aula_pkey" PRIMARY KEY ("sala_aula_id")
);

-- CreateTable
CREATE TABLE "public"."sala_professores" (
    "sala_professores_id" BIGSERIAL NOT NULL,
    "capacidade" INTEGER,
    "acesso_restrito" BOOLEAN DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "sala_professores_pkey" PRIMARY KEY ("sala_professores_id")
);

-- CreateTable
CREATE TABLE "public"."turma" (
    "turma_id" BIGSERIAL NOT NULL,
    "nome" VARCHAR NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "turma_pkey" PRIMARY KEY ("turma_id")
);

-- CreateTable
CREATE TABLE "public"."turno" (
    "turno_id" BIGSERIAL NOT NULL,
    "descricao" VARCHAR NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "turno_pkey" PRIMARY KEY ("turno_id")
);

-- AddForeignKey
ALTER TABLE "public"."auditorio" ADD CONSTRAINT "auditorio_auditorio_id_fkey" FOREIGN KEY ("auditorio_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."banheiro" ADD CONSTRAINT "banheiro_banheiro_id_fkey" FOREIGN KEY ("banheiro_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."biblioteca" ADD CONSTRAINT "biblioteca_biblioteca_id_fkey" FOREIGN KEY ("biblioteca_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."enfermaria" ADD CONSTRAINT "enfermaria_enfermaria_id_fkey" FOREIGN KEY ("enfermaria_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."horario_aula" ADD CONSTRAINT "horario_aula_sala_id_fkey" FOREIGN KEY ("sala_id") REFERENCES "public"."sala_aula"("sala_aula_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."horario_aula" ADD CONSTRAINT "horario_aula_turma_id_fkey" FOREIGN KEY ("turma_id") REFERENCES "public"."turma"("turma_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."horario_aula" ADD CONSTRAINT "horario_aula_turno_id_fkey" FOREIGN KEY ("turno_id") REFERENCES "public"."turno"("turno_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."laboratorio" ADD CONSTRAINT "laboratorio_laboratorio_id_fkey" FOREIGN KEY ("laboratorio_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."lanchonete" ADD CONSTRAINT "lanchonete_lanchonete_id_fkey" FOREIGN KEY ("lanchonete_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."local" ADD CONSTRAINT "local_bloco_id_fkey" FOREIGN KEY ("bloco_id") REFERENCES "public"."bloco"("bloco_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."quadra_esportes" ADD CONSTRAINT "quadra_esportes_quadra_esportes_id_fkey" FOREIGN KEY ("quadra_esportes_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."refeitorio" ADD CONSTRAINT "refeitorio_refeitorio_id_fkey" FOREIGN KEY ("refeitorio_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."sala_aula" ADD CONSTRAINT "sala_aula_sala_aula_id_fkey" FOREIGN KEY ("sala_aula_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."sala_professores" ADD CONSTRAINT "sala_professores_sala_professores_id_fkey" FOREIGN KEY ("sala_professores_id") REFERENCES "public"."local"("local_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

