-- **********************************
-- *********** Tables AG ************
-- **********************************

-- ###### Libro ######

-- table libro
CREATE TABLE libro (
    codigo VARCHAR(25) NOT NULL,
    titulo VARCHAR(250) NOT NULL,
    descripcion VARCHAR(500) NULL,
    id_group_autor VARCHAR(25) NOT NULL,
    id_group_categoria VARCHAR(25) NOT NULL,
    id_type_libro VARCHAR(25) NOT NULL,
    CONSTRAINT pk_libro PRIMARY KEY(codigo)
);

-- tipo libro 
CREATE TABLE type_libro (
    codigo VARCHAR(25) NOT NULL,
    nombre VARCHAR(250) NOT NULL,
    valor INTEGER NOT NULL,
    CONSTRAINT pk_type_libro PRIMARY KEY(codigo)
);

-- existencia libro 
CREATE TABLE existencia_libro (
    codigo VARCHAR(25) NOT NULL,
    disponible BOOLEAN,
    valor INTEGER NOT NULL,
    id_libro VARCHAR(25) NOT NULL,
    CONSTRAINT pk_existencia_libro PRIMARY KEY(codigo),
    CONSTRAINT fk_existencia_libro_libro FOREIGN KEY (id_libro) REFERENCES libro(codigo)
);

-- ###### CATEGORIAS ######

-- table grupos de categorias
CREATE TABLE group_category (
    codigo VARCHAR(25) NOT NULL,
    nombre VARCHAR(250),
    CONSTRAINT pk_group_category PRIMARY KEY(codigo)
);

-- table tag categorias
CREATE TABLE tag_categoria (
    codigo VARCHAR(25) NOT NULL,
    nombre VARCHAR(250),
    descripcion VARCHAR(500),
    CONSTRAINT pk_category PRIMARY KEY(codigo)
);

-- ###### AUTORES ######

-- table autor
CREATE TABLE autor (
    codigo VARCHAR(25) NOT NULL,
    nombre VARCHAR(250),
    CONSTRAINT pk_autor PRIMARY KEY(codigo)
);

-- table grupo de autores
CREATE TABLE group_autor (
    codigo VARCHAR(25) NOT NULL,
    nombre VARCHAR(250),
    id_autor VARCHAR(25) NOT NULL,
    CONSTRAINT pk_group_autor PRIMARY KEY(codigo),
    CONSTRAINT fk_group_autor_autor FOREIGN KEY (id_autor) REFERENCES autor(codigo)
);

-- ***********************************
-- *********** Foreign Keys AG *******
-- ***********************************

-- Foreign Keys for libro
ALTER TABLE libro
ADD CONSTRAINT fk_libro_group_autor FOREIGN KEY (id_group_autor) REFERENCES group_autor(codigo),
ADD CONSTRAINT fk_libro_group_category FOREIGN KEY (id_group_categoria) REFERENCES group_category(codigo),
ADD CONSTRAINT fk_libro_type_libro FOREIGN KEY (id_type_libro) REFERENCES type_libro(codigo);

-- Foreign Keys for group_category
ALTER TABLE group_category
ADD CONSTRAINT fk_group_category_tag_categoria FOREIGN KEY (codigo) REFERENCES tag_categoria(codigo);
