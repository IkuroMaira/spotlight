-- Création des tables principales d'abord
CREATE TABLE "users" (
                         "id" UUID PRIMARY KEY,
                         "email" VARCHAR(255) NOT NULL,
                         "password" VARCHAR(255) NOT NULL,
                         "pseudo" VARCHAR(255) NOT NULL
);

CREATE TABLE "impact_categories" (
                                     "id" UUID PRIMARY KEY,
                                     "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "tags" (
                        "id" UUID PRIMARY KEY,
                        "name" VARCHAR(255) NOT NULL,
                        "color" VARCHAR(255) NOT NULL
);

CREATE TABLE "spots" (
                         "id" UUID PRIMARY KEY,
                         "longitude" FLOAT(53) NOT NULL,
                         "latitude" FLOAT(53) NOT NULL,
                         "name" VARCHAR(255) NOT NULL,
                         "impact_category_id" UUID NULL
);

-- Ajout de la contrainte de clé étrangère pour la table spots
ALTER TABLE "spots"
    ADD CONSTRAINT "spots_impact_category_id_foreign"
        FOREIGN KEY ("impact_category_id")
            REFERENCES "impact_categories"("id");

-- Création des tables de jointure
CREATE TABLE "users_spots" (
                               "id" UUID PRIMARY KEY,
                               "user_id" UUID NOT NULL,
                               "spot_id" UUID NOT NULL
);

CREATE TABLE "spots_tags" (
                              "id" UUID PRIMARY KEY,
                              "spot_id" UUID NOT NULL,
                              "tag_id" UUID NOT NULL
);

-- Ajout des contraintes de clés étrangères pour les tables de jointure
ALTER TABLE "users_spots"
    ADD CONSTRAINT "users_spots_user_id_foreign"
        FOREIGN KEY ("user_id")
            REFERENCES "users"("id");

ALTER TABLE "users_spots"
    ADD CONSTRAINT "users_spots_spot_id_foreign"
        FOREIGN KEY ("spot_id")
            REFERENCES "spots"("id");

ALTER TABLE "spots_tags"
    ADD CONSTRAINT "spots_tags_tag_id_foreign"
        FOREIGN KEY ("tag_id")
            REFERENCES "tags"("id");

ALTER TABLE "spots_tags"
    ADD CONSTRAINT "spots_tags_spot_id_foreign"
        FOREIGN KEY ("spot_id")
            REFERENCES "spots"("id");