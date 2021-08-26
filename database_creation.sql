CREATE TABLE "clientes"(
    "cpf" INTEGER NOT NULL,
    "primeiro_nome" VARCHAR(255) NOT NULL,
    "ultimo_nome" VARCHAR(255) NOT NULL,
    "cep" INTEGER NOT NULL,
    "endereco" VARCHAR(255) NOT NULL,
    "numero_endereco" INTEGER NOT NULL,
    "cidade" VARCHAR(255) NOT NULL,
    "estado" VARCHAR(255) NULL,
    "pais" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "telefone" INTEGER NOT NULL,
    "senha" VARCHAR(255) NOT NULL,
    "nome_cartao" VARCHAR(255) NOT NULL,
    "numero_cartao" INTEGER NOT NULL,
    "codigo_seguranca_cartao" INTEGER NOT NULL,
    "mes_vencimento_cartao" INTEGER NOT NULL,
    "ano_vencimento_cartao" INTEGER NOT NULL,
    "endereco_cobranca" VARCHAR(255) NOT NULL,
    "cep_cobranca" VARCHAR(255) NOT NULL,
    "cidade_cobranca" VARCHAR(255) NOT NULL,
    "estado_cobranca" VARCHAR(255) NOT NULL,
    "pais_cobranca" VARCHAR(255) NOT NULL,
    "endereco_entrega" VARCHAR(255) NULL,
    "cep_entrega" VARCHAR(255) NULL,
    "cidade_entrega" VARCHAR(255) NULL,
    "estado_entrega" VARCHAR(255) NULL,
    "pais_entrega" VARCHAR(255) NULL,
    "data_entrada" DATE NOT NULL
);
ALTER TABLE
    "clientes" ADD PRIMARY KEY("cpf");
CREATE TABLE "pedidos"(
    "id_pedido" INTEGER NOT NULL,
    "cpf" INTEGER NOT NULL,
    "numero_pedido" INTEGER NOT NULL,
    "id_pagamento" INTEGER NOT NULL,
    "data_pedido" DATE NOT NULL,
    "data_envio" DATE NULL,
    "cnpj_entregador" INTEGER NOT NULL,
    "frete_valor" INTEGER NOT NULL,
    "status_transacao" VARCHAR(255) NOT NULL,
    "deletado" BOOLEAN NOT NULL,
    "pago" BOOLEAN NOT NULL,
    "data_pagamento" DATE NULL
);
ALTER TABLE
    "pedidos" ADD PRIMARY KEY("id_pedido");
CREATE TABLE "pagamento"(
    "id_pagamento" INTEGER NOT NULL,
    "tipo_pagamento" VARCHAR(255) NOT NULL,
    "permitido" BOOLEAN NOT NULL
);
ALTER TABLE
    "pagamento" ADD PRIMARY KEY("id_pagamento");
CREATE TABLE "entregadores"(
    "cnpj_entregador" INTEGER NOT NULL,
    "nome_da_empresa" VARCHAR(255) NOT NULL,
    "telefone" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "entregadores" ADD PRIMARY KEY("cnpj_entregador");
CREATE TABLE "detalhes_pedidos"(
    "id_detalhe_pedido" INTEGER NOT NULL,
    "id_pedido" INTEGER NOT NULL,
    "isbn" INTEGER NOT NULL,
    "preço" DECIMAL(8, 2) NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "desconto" DECIMAL(8, 2) NOT NULL,
    "total" DECIMAL(8, 2) NOT NULL,
    "data_envio" DATE NULL,
    "data_fatura" DATE NOT NULL
);
ALTER TABLE
    "detalhes_pedidos" ADD PRIMARY KEY("id_detalhe_pedido");
CREATE TABLE "livros"(
    "isbn" INTEGER NOT NULL,
    "titulo_livro" TEXT NOT NULL,
    "autor" TEXT NOT NULL,
    "ano_publicacao" INTEGER NOT NULL,
    "lingua" VARCHAR(255) NULL,
    "capa_tipo" VARCHAR(255) NOT NULL,
    "sinopse" TEXT NULL,
    "preco_unitario" DECIMAL(8, 2) NOT NULL,
    "cnpj_fornecedor" INTEGER NOT NULL,
    "editora" VARCHAR(255) NOT NULL,
    "dimensões_mm" VARCHAR(255) NOT NULL,
    "peso_unitario_g" DECIMAL(8, 2) NOT NULL,
    "estoque" INTEGER NOT NULL,
    "unidades_em_pedidos" INTEGER NOT NULL,
    "produto_dispoivel" BOOLEAN NOT NULL,
    "desconto_disponivel" BOOLEAN NOT NULL,
    "imagem" bytea NULL,
    "id_categoria_primaria" INTEGER NOT NULL,
    "id_categoria_secundaria" INTEGER NULL,
    "nota" DECIMAL(8, 2) NULL
);
ALTER TABLE
    "livros" ADD PRIMARY KEY("isbn");
CREATE TABLE "categoria"(
    "id_categoria" INTEGER NOT NULL,
    "nome_categoria" VARCHAR(255) NOT NULL,
    "descricao" TEXT NULL
);
ALTER TABLE
    "categoria" ADD PRIMARY KEY("id_categoria");
CREATE TABLE "fornecedore"(
    "cnpj_fornecedor" INTEGER NOT NULL,
    "nome_fornecedor" VARCHAR(255) NOT NULL,
    "primeiro_nome_contato" VARCHAR(255) NULL,
    "ultimo_nome_contato" VARCHAR(255) NULL,
    "titulo_contato" VARCHAR(255) NULL,
    "endereco_1" VARCHAR(255) NOT NULL,
    "cep_1" INTEGER NOT NULL,
    "endereco_2" VARCHAR(255) NULL,
    "cep_2" INTEGER NULL,
    "cidade" VARCHAR(255) NOT NULL,
    "estado" VARCHAR(255) NULL,
    "pais" VARCHAR(255) NOT NULL,
    "telefone_empresa" VARCHAR(255) NOT NULL,
    "telefone_contato" VARCHAR(255) NULL,
    "email" VARCHAR(255) NOT NULL,
    "site" VARCHAR(255) NULL,
    "metodos_de_pagamento" VARCHAR(255) NOT NULL,
    "desconto" BOOLEAN NULL,
    "editoras" TEXT NOT NULL,
    "pedido_aberto" BOOLEAN NOT NULL,
    "id_pedido" INTEGER NULL
);
ALTER TABLE
    "fornecedore" ADD PRIMARY KEY("cnpj_fornecedor");
ALTER TABLE
    "pedidos" ADD CONSTRAINT "pedidos_id_pagamento_foreign" FOREIGN KEY("id_pagamento") REFERENCES "pagamento"("id_pagamento");
ALTER TABLE
    "pedidos" ADD CONSTRAINT "pedidos_cpf_foreign" FOREIGN KEY("cpf") REFERENCES "clientes"("cpf");
ALTER TABLE
    "detalhes_pedidos" ADD CONSTRAINT "detalhes_pedidos_id_pedido_foreign" FOREIGN KEY("id_pedido") REFERENCES "pedidos"("id_pedido");
ALTER TABLE
    "pedidos" ADD CONSTRAINT "pedidos_cnpj_entregador_foreign" FOREIGN KEY("cnpj_entregador") REFERENCES "entregadores"("cnpj_entregador");
ALTER TABLE
    "detalhes_pedidos" ADD CONSTRAINT "detalhes_pedidos_isbn_foreign" FOREIGN KEY("isbn") REFERENCES "livros"("isbn");
ALTER TABLE
    "livros" ADD CONSTRAINT "livros_id_categoria_primaria_foreign" FOREIGN KEY("id_categoria_primaria") REFERENCES "categoria"("id_categoria");
ALTER TABLE
    "livros" ADD CONSTRAINT "livros_id_categoria_secundaria_foreign" FOREIGN KEY("id_categoria_secundaria") REFERENCES "categoria"("id_categoria");
ALTER TABLE
    "livros" ADD CONSTRAINT "livros_cnpj_fornecedor_foreign" FOREIGN KEY("cnpj_fornecedor") REFERENCES "fornecedore"("cnpj_fornecedor");