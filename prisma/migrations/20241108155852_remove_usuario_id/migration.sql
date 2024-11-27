/*
  Warnings:

  - You are about to drop the column `usuario_id` on the `Compra` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Compra" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "data_compra" DATETIME NOT NULL,
    "data_emissao" DATETIME NOT NULL,
    "data_envio" DATETIME NOT NULL,
    "valor_total" REAL NOT NULL,
    "produto_id" INTEGER,
    "projeto_id" INTEGER,
    "fornecedor_id" INTEGER,
    "cliente_id" INTEGER,
    "adicionais_id" INTEGER,
    CONSTRAINT "Compra_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_projeto_id_fkey" FOREIGN KEY ("projeto_id") REFERENCES "Projeto" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_fornecedor_id_fkey" FOREIGN KEY ("fornecedor_id") REFERENCES "Fornecedor" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "Cliente" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Compra_adicionais_id_fkey" FOREIGN KEY ("adicionais_id") REFERENCES "Adicionais" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Compra" ("adicionais_id", "cliente_id", "data_compra", "data_emissao", "data_envio", "fornecedor_id", "id", "produto_id", "projeto_id", "valor_total") SELECT "adicionais_id", "cliente_id", "data_compra", "data_emissao", "data_envio", "fornecedor_id", "id", "produto_id", "projeto_id", "valor_total" FROM "Compra";
DROP TABLE "Compra";
ALTER TABLE "new_Compra" RENAME TO "Compra";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
