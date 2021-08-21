CREATE TABLE review
(
    id VARCHAR2 (100),
    updated_at DATE, -- aca tambien podemos usar timestamp
    created_at DATE DEFAULT sysdate, -- aca tambien podemos usar timestamp
    user_id VARCHAR2 (100),
    place_id VARCHAR2 (100),
    text VARCHAR2 (100)
);

CREATE TABLE usuario
(
    id VARCHAR2 (100),
    updated_at DATE, -- aca tambien podemos usar timestamp
    created_at DATE DEFAULT sysdate, -- aca tambien podemos usar timestamp
    email VARCHAR2 (100),
    password VARCHAR2 (100),
    first_name VARCHAR2 (100),
    last_name VARCHAR2 (100)
);

CREATE TABLE place
(
    id VARCHAR2 (100),
    updated_at DATE, -- aca tambien podemos usar timestamp
    created_at DATE DEFAULT sysdate, -- aca tambien podemos usar timestamp
    user_id VARCHAR2 (100),
    name VARCHAR2 (100),
    city_id VARCHAR2 (100),
    description VARCHAR2 (100),
    number_rooms NUMBER DEFAULT 0,
    number_bathrooms NUMBER DEFAULT 0,
    max_guest NUMBER default 0,
    price_by_night NUMBER DEFAULT 0
);

CREATE TABLE amenity
(
    id VARCHAR2 (100),
    updated_at DATE, -- aca tambien podemos usar timestamp
    created_at DATE DEFAULT sysdate, -- aca tambien podemos usar timestamp
    name VARCHAR2 (100)
);

CREATE TABLE placeamenity
(
    amenity_id VARCHAR2 (100),
    place_id VARCHAR2 (100)
    );

CREATE TABLE state
(
    id VARCHAR2 (100),
    updated_at DATE, -- aca tambien podemos usar timestamp
    created_at DATE DEFAULT sysdate, -- aca tambien podemos usar timestamp
    name VARCHAR2 (100)
    );

CREATE TABLE city
(
    id VARCHAR2 (100),
    updated_at DATE, -- aca tambien podemos usar timestamp
    created_at DATE DEFAULT sysdate, -- aca tambien podemos usar timestamp
    state_id VARCHAR2 (100),
    name VARCHAR2 (100)
    );

-- CREAMOS LLAVES PRIMARIAS

ALTER TABLE review ADD CONSTRAINT review_id_pk PRIMARY KEY (id);

ALTER TABLE usuario ADD CONSTRAINT usuario_id_pk PRIMARY KEY (id);

ALTER TABLE place ADD CONSTRAINT place_id_pk PRIMARY KEY (id);

ALTER TABLE amenity ADD CONSTRAINT amenity_id_pk PRIMARY KEY (id);

ALTER TABLE state ADD CONSTRAINT state_id_pk PRIMARY KEY (id);

ALTER TABLE city ADD CONSTRAINT city_id_pk PRIMARY KEY (id);

-- CREAMOS LLAVES FORANEAS

ALTER TABLE review ADD CONSTRAINT review_usuario_fk FOREIGN KEY (user_id) REFERENCES usuario(id);

ALTER TABLE review ADD CONSTRAINT review_place_fk FOREIGN KEY (place_id) REFERENCES place(id);

ALTER TABLE place ADD CONSTRAINT place_usuario_fk FOREIGN KEY (user_id) REFERENCES usuario(id);

ALTER TABLE place ADD CONSTRAINT place_city_fk FOREIGN KEY (city_id) REFERENCES city(id);

ALTER TABLE placeamenity ADD CONSTRAINT placeamenity_place_fk FOREIGN KEY (place_id) REFERENCES place(id);

ALTER TABLE placeamenity ADD CONSTRAINT placeamenity_amenity_fk FOREIGN KEY (amenity_id) REFERENCES amenity(id);

ALTER TABLE city ADD CONSTRAINT city_state_fk FOREIGN KEY (state_id) REFERENCES state(id);