-- CreateTable
CREATE TABLE "Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "funcao" TEXT NOT NULL,
    "admin" BOOLEAN NOT NULL,
    "usuario" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "observacoes" TEXT DEFAULT ''
);

-- CreateTable
CREATE TABLE "Produto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "numero_serie" INTEGER NOT NULL,
    "fabricante" TEXT NOT NULL,
    "descricao" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Compra" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "data_compra" DATETIME NOT NULL,
    "data_emissao" DATETIME NOT NULL,
    "data_envio" DATETIME NOT NULL,
    "valor_total" REAL NOT NULL,
    "usuario_id" INTEGER,
    "produto_id" INTEGER,
    "projeto_id" INTEGER,
    "fornecedor_id" INTEGER,
    "cliente_id" INTEGER,
    "adicionais_id" INTEGER,
    CONSTRAINT "Compra_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_projeto_id_fkey" FOREIGN KEY ("projeto_id") REFERENCES "Projeto" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_fornecedor_id_fkey" FOREIGN KEY ("fornecedor_id") REFERENCES "Fornecedor" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "Cliente" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_adicionais_id_fkey" FOREIGN KEY ("adicionais_id") REFERENCES "Adicionais" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Projeto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_projeto" TEXT NOT NULL,
    "responsavel_tecnico" TEXT NOT NULL,
    "gerente_projeto" TEXT NOT NULL,
    "cliente_id" INTEGER,
    CONSTRAINT "Projeto_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "Cliente" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Estoque" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "quantidade" INTEGER NOT NULL,
    "tipo_unitario" INTEGER NOT NULL,
    "produto_id" INTEGER,
    "projeto_id" INTEGER,
    "local_armazenamento_id" INTEGER,
    CONSTRAINT "Estoque_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Estoque_projeto_id_fkey" FOREIGN KEY ("projeto_id") REFERENCES "Projeto" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Estoque_local_armazenamento_id_fkey" FOREIGN KEY ("local_armazenamento_id") REFERENCES "Local_Armazenamento" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Local_Armazenamento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "andar" TEXT NOT NULL,
    "sala" TEXT NOT NULL,
    "armario" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Cliente" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "razao_social_cliente" TEXT NOT NULL,
    "CNPJ" TEXT NOT NULL,
    "inscricao_estadual" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "CEP" TEXT NOT NULL,
    "municipio" TEXT NOT NULL,
    "UF" TEXT NOT NULL,
    "telefone" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Fornecedor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "razao_social_fornecedor" TEXT NOT NULL,
    "CNPJ" TEXT NOT NULL,
    "inscricao_estadual" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "CEP" TEXT NOT NULL,
    "municipio" TEXT NOT NULL,
    "UF" TEXT NOT NULL,
    "telefone" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Adicionais" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "observacoes" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_usuario_key" ON "Usuario"("usuario");

-- CreateIndex
CREATE UNIQUE INDEX "Produto_numero_serie_key" ON "Produto"("numero_serie");

-- CreateIndex
CREATE UNIQUE INDEX "Cliente_CNPJ_key" ON "Cliente"("CNPJ");

-- CreateIndex
CREATE UNIQUE INDEX "Fornecedor_CNPJ_key" ON "Fornecedor"("CNPJ");
