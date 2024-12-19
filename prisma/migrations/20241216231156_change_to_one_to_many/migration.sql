-- CreateTable
CREATE TABLE "Usuario" (
    "id" TEXT NOT NULL,
    "nomeCompleto" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "tokenRecuperacao" TEXT,
    "dataExpiracaoToken" TIMESTAMP(3),
    "doisFatoresAtivado" BOOLEAN NOT NULL DEFAULT false,
    "telefone" TEXT,
    "urlImagemPerfil" TEXT,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Perfil" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ativo" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Perfil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permissao" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ativo" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Permissao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsuarioPerfil" (
    "id" TEXT NOT NULL,
    "usuarioId" TEXT NOT NULL,
    "perfilId" TEXT NOT NULL,

    CONSTRAINT "UsuarioPerfil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PerfilPermissao" (
    "id" TEXT NOT NULL,
    "perfilId" TEXT NOT NULL,
    "permissaoId" TEXT NOT NULL,

    CONSTRAINT "PerfilPermissao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Perfil_nome_key" ON "Perfil"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "Permissao_nome_key" ON "Permissao"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "UsuarioPerfil_usuarioId_perfilId_key" ON "UsuarioPerfil"("usuarioId", "perfilId");

-- CreateIndex
CREATE UNIQUE INDEX "PerfilPermissao_perfilId_permissaoId_key" ON "PerfilPermissao"("perfilId", "permissaoId");

-- AddForeignKey
ALTER TABLE "UsuarioPerfil" ADD CONSTRAINT "UsuarioPerfil_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsuarioPerfil" ADD CONSTRAINT "UsuarioPerfil_perfilId_fkey" FOREIGN KEY ("perfilId") REFERENCES "Perfil"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PerfilPermissao" ADD CONSTRAINT "PerfilPermissao_perfilId_fkey" FOREIGN KEY ("perfilId") REFERENCES "Perfil"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PerfilPermissao" ADD CONSTRAINT "PerfilPermissao_permissaoId_fkey" FOREIGN KEY ("permissaoId") REFERENCES "Permissao"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
