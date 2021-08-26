CREATE TABLE "clients"(
    "id_clients" INTEGER NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "postal_code" INTEGER NOT NULL,
    "adress" VARCHAR(255) NOT NULL,
    "adress_number" INTEGER NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "state" VARCHAR(255) NULL,
    "country" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "phone" INTEGER NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "card_name" VARCHAR(255) NOT NULL,
    "card_number" INTEGER NOT NULL,
    "card_securance_code" INTEGER NOT NULL,
    "card_month_due" INTEGER NOT NULL,
    "card_year_due" INTEGER NOT NULL,
    "billing_adress" VARCHAR(255) NOT NULL,
    "billing_postal_code" VARCHAR(255) NOT NULL,
    "billing_city" VARCHAR(255) NOT NULL,
    "billing_state" VARCHAR(255) NOT NULL,
    "billing_country" VARCHAR(255) NOT NULL,
    "shipping_adress" VARCHAR(255) NULL,
    "sipping_postal_code" VARCHAR(255) NULL,
    "shipping_city" VARCHAR(255) NULL,
    "shipping_state" VARCHAR(255) NULL,
    "shipping_country" VARCHAR(255) NULL,
    "entrance_date" DATE NOT NULL
);
ALTER TABLE
    "clients" ADD PRIMARY KEY("id_clients");
CREATE TABLE "orders"(
    "id_orders" INTEGER NOT NULL,
    "id_client" INTEGER NOT NULL,
    "order_number" INTEGER NOT NULL,
    "id_payment" INTEGER NOT NULL,
    "order_date" DATE NOT NULL,
    "shipping_date" DATE NULL,
    "id_shipper" INTEGER NOT NULL,
    "freight_value" INTEGER NOT NULL,
    "transaction_status" VARCHAR(255) NOT NULL,
    "deleted" BOOLEAN NOT NULL,
    "payed" BOOLEAN NOT NULL,
    "payment_date" DATE NULL
);
ALTER TABLE
    "orders" ADD PRIMARY KEY("id_orders");
CREATE TABLE "payments"(
    "id_payment" INTEGER NOT NULL,
    "payment_type" VARCHAR(255) NOT NULL,
    "allowed" BOOLEAN NOT NULL
);
ALTER TABLE
    "payments" ADD PRIMARY KEY("id_payment");
CREATE TABLE "shippers"(
    "id_shipper" INTEGER NOT NULL,
    "shipper_name" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "shippers" ADD PRIMARY KEY("id_shipper");
CREATE TABLE "order_details"(
    "id_order_details" INTEGER NOT NULL,
    "id_order" INTEGER NOT NULL,
    "isbn" INTEGER NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "discount" DECIMAL(8, 2) NOT NULL,
    "total" DECIMAL(8, 2) NOT NULL,
    "shipping_date" DATE NULL,
    "billing_date" DATE NOT NULL
);
ALTER TABLE
    "order_details" ADD PRIMARY KEY("id_order_details");
CREATE TABLE "books"(
    "isbn" INTEGER NOT NULL,
    "book_title" TEXT NOT NULL,
    "autor" TEXT NOT NULL,
    "publishing_year" INTEGER NOT NULL,
    "language" VARCHAR(255) NULL,
    "cover_type" VARCHAR(255) NOT NULL,
    "synopsis" TEXT NULL,
    "unitary_price" DECIMAL(8, 2) NOT NULL,
    "id_supplier" INTEGER NOT NULL,
    "publisher" VARCHAR(255) NOT NULL,
    "dimensions_mm" VARCHAR(255) NOT NULL,
    "unitary_weight_g" DECIMAL(8, 2) NOT NULL,
    "stock" INTEGER NOT NULL,
    "unities_in_orders" INTEGER NOT NULL,
    "available_products" BOOLEAN NOT NULL,
    "available_discount" BOOLEAN NOT NULL,
    "image" bytea NULL,
    "id_primary_category" INTEGER NOT NULL,
    "id_secondary_category" INTEGER NULL,
    "ranking" DECIMAL(8, 2) NULL
);
ALTER TABLE
    "books" ADD PRIMARY KEY("isbn");
CREATE TABLE "categories"(
    "id_category" INTEGER NOT NULL,
    "name_category" VARCHAR(255) NOT NULL,
    "description" TEXT NULL
);
ALTER TABLE
    "categories" ADD PRIMARY KEY("id_category");
CREATE TABLE "suppliers"(
    "id_suplier" INTEGER NOT NULL,
    "name_supplier" VARCHAR(255) NOT NULL,
    "first_name_contact" VARCHAR(255) NULL,
    "last_name_contat" VARCHAR(255) NULL,
    "contact_tile" VARCHAR(255) NULL,
    "adress_1" VARCHAR(255) NOT NULL,
    "posatl_code_1" INTEGER NOT NULL,
    "adress_2" VARCHAR(255) NULL,
    "postal_code_2" INTEGER NULL,
    "city" VARCHAR(255) NOT NULL,
    "state" VARCHAR(255) NULL,
    "country" VARCHAR(255) NOT NULL,
    "company_phone" VARCHAR(255) NOT NULL,
    "contact_phone" VARCHAR(255) NULL,
    "email" VARCHAR(255) NOT NULL,
    "site" VARCHAR(255) NULL,
    "payment_methods" VARCHAR(255) NOT NULL,
    "discount" BOOLEAN NULL,
    "publishers" TEXT NOT NULL,
    "open_orders" BOOLEAN NOT NULL,
    "id_order" INTEGER NULL
);
ALTER TABLE
    "suppliers" ADD PRIMARY KEY("id_suplier");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_id_payment_foreign" FOREIGN KEY("id_payment") REFERENCES "payments"("id_payment");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_id_client_foreign" FOREIGN KEY("id_client") REFERENCES "clients"("id_clients");
ALTER TABLE
    "order_details" ADD CONSTRAINT "order_details_id_order_foreign" FOREIGN KEY("id_order") REFERENCES "orders"("id_orders");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_id_shipper_foreign" FOREIGN KEY("id_shipper") REFERENCES "shippers"("id_shipper");
ALTER TABLE
    "order_details" ADD CONSTRAINT "order_details_isbn_foreign" FOREIGN KEY("isbn") REFERENCES "books"("isbn");
ALTER TABLE
    "books" ADD CONSTRAINT "books_id_primary_category_foreign" FOREIGN KEY("id_primary_category") REFERENCES "categories"("id_category");
ALTER TABLE
    "books" ADD CONSTRAINT "books_id_secondary_category_foreign" FOREIGN KEY("id_secondary_category") REFERENCES "categories"("id_category");
ALTER TABLE
    "books" ADD CONSTRAINT "books_id_supplier_foreign" FOREIGN KEY("id_supplier") REFERENCES "suppliers"("id_suplier");