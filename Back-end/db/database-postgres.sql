-- **********************************
-- *********** Tables AG ************
-- **********************************

-- table libro
CREATE TABLE  libro (
	codigo INTEGER NOT NULL,
	titulo VARCHAR (250) NOT NULL,
	descripcion VARCHAR (500) NULL,
	CONSTRAINT  pk_libro
	PRIMARY KEY( codigo )
);

-- ###### CATEGORIAS ######

-- table grupos de categorias
CREATE TABLE group_category (
    codigo INTEGER NOT NULL,
	nombre VARCHAR (250),
	CONSTRAINT pk_group_category
);

-- table grupos de categorias
CREATE TABLE tag_categoria (
    codigo INTEGER NOT NULL,
	nombre VARCHAR (250),
    descripcion VARCHAR (500),
	CONSTRAINT pk_tag_category
);

-- ###### AUTORES ######

-- table autor
CREATE TABLE autor (
    codigo INTEGER NOT NULL,
	nombre INTEGER NOT NULL,
	CONSTRAINT pk_group_category
);

-- table grupos de categorias
CREATE TABLE tag_categoria (
    codigo INTEGER NOT NULL,
	nombre INTEGER NOT NULL,
    descripcion INTEGER NOT NULL,
	CONSTRAINT pk_tag_category
);


-- ****************************************
-- *********** Foreign Keys AG ************
-- ****************************************

-- For trazables(fk_Trazable_Agronegocio) 
ALTER TABLE trazables ADD
	CONSTRAINT fk_Trazable_Agronegocio
	FOREIGN KEY ( agronegocio )
	REFERENCES  agronegocios ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For trazables(fk_Trazable_Compuesto) 
ALTER TABLE trazables ADD
	CONSTRAINT fk_Trazable_Compuesto
	FOREIGN KEY ( agronegocio , padre )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For items(fk_Item_Trazable) 
ALTER TABLE items ADD
	CONSTRAINT fk_Item_Trazable
	FOREIGN KEY ( agronegocio , trazable )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For procesos(fk_Proceso_Agronegocio) 
ALTER TABLE procesos ADD
	CONSTRAINT fk_Proceso_Agronegocio
	FOREIGN KEY ( agronegocio )
	REFERENCES  agronegocios ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For procesos(fk_Proceso_Compuesto) 
ALTER TABLE procesos ADD
	CONSTRAINT fk_Proceso_Compuesto
	FOREIGN KEY ( agronegocio , padre )
	REFERENCES  procesos ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For tareas(fk_Tarea_Responsable) 
ALTER TABLE tareas ADD
	CONSTRAINT fk_Tarea_Responsable
	FOREIGN KEY ( agronegocio , responsable )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For tareas(fk_Tarea_Implicado) 
ALTER TABLE tareas ADD
	CONSTRAINT fk_Tarea_Implicado
	FOREIGN KEY ( agronegocio , implicado )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For tareas(fk_Tarea_Sitio) 
ALTER TABLE tareas ADD
	CONSTRAINT fk_Tarea_Sitio
	FOREIGN KEY ( agronegocio , sitio )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For tareas(fk_Tarea_Instrumento) 
ALTER TABLE tareas ADD
	CONSTRAINT fk_Tarea_Instrumento
	FOREIGN KEY ( agronegocio , instrumento )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For tareas(fk_Tarea_Insumo) 
ALTER TABLE tareas ADD
	CONSTRAINT fk_Tarea_Insumo
	FOREIGN KEY ( agronegocio , insumo )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For tareas(fk_Tarea_Resultado) 
ALTER TABLE tareas ADD
	CONSTRAINT fk_Tarea_Resultado
	FOREIGN KEY ( agronegocio , resultado )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For tareas(fk_Tarea_Proceso) 
ALTER TABLE tareas ADD
	CONSTRAINT fk_Tarea_Proceso
	FOREIGN KEY ( agronegocio , proceso )
	REFERENCES  procesos ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- **********************************
-- *********** Tables SG ************
-- **********************************

-- table inquilinos
CREATE SEQUENCE inquilinos_codigo_seq;
CREATE TABLE inquilinos (
	territorio VARCHAR (25) NOT NULL,
	agronegocio VARCHAR (2) NOT NULL,
	tipo VARCHAR (50) NOT NULL,
	codigo VARCHAR (25) NOT NULL,
	nombre VARCHAR (250) NOT NULL,
	telefono VARCHAR (25) NOT NULL,
	tipo_id VARCHAR (50) NOT NULL,
	id VARCHAR (50) NOT NULL,
	correo VARCHAR (250) NULL,
	direccion VARCHAR (250) NULL,
	representante VARCHAR (250) NULL ,
	estado VARCHAR (50) NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT  pk_Inquilino
	PRIMARY KEY( codigo )
);

-- table usuarios
CREATE TABLE usuarios (
	nombre VARCHAR (250) NOT NULL,
	telefono VARCHAR (25) NOT NULL,
	clave VARCHAR (250) NOT NULL,
	rol INT NOT NULL,
	inquilino VARCHAR (25) NOT NULL,
	correo VARCHAR (250) NULL,
	tipo_id VARCHAR (50) NULL,
	id VARCHAR (50) NULL,
	direccion VARCHAR (250) NULL,
	id_trazii  VARCHAR (36) NULL,
	estado VARCHAR (50) NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT  pk_Usuario
	PRIMARY KEY( telefono )
);

-- table roles
CREATE TABLE roles (
	codigo SERIAL NOT NULL,
	nombre VARCHAR (250) NOT NULL,
	descripcion VARCHAR (500) NULL,
	inicio VARCHAR (500) NULL,
	CONSTRAINT  pk_Rol
	PRIMARY KEY( codigo )
);

-- table opciones
CREATE TABLE opciones (
	codigo VARCHAR (25) NOT NULL,
	titulo VARCHAR (250) NOT NULL,
	referencia VARCHAR (500) NULL,
	url_amigable VARCHAR (500) NULL,
	contenido TEXT NULL,
	tipo VARCHAR (50) NOT NULL,
	estado VARCHAR (50) NOT NULL,
	CONSTRAINT  pk_Opcion
	PRIMARY KEY( codigo )
);

-- table funcionalidades_web
CREATE TABLE funcionalidades_web (
	rol INT NOT NULL,
	opcion VARCHAR (25) NOT NULL,
	observacion VARCHAR (500) NULL, 
	CONSTRAINT  pk_Privilegio
	PRIMARY KEY( rol , opcion )
);

-- table funcionalidades_moviles
CREATE TABLE funcionalidades_moviles (
	rol INT NOT NULL,
	agronegocio VARCHAR (2) NOT NULL,
	tarea VARCHAR (4) NOT NULL,
	observacion VARCHAR (500) NULL,
	CONSTRAINT  pk_Funcionalidad
	PRIMARY KEY( rol , agronegocio , tarea )
);

-- table acciones (bitacora)
CREATE TABLE acciones (
	inquilino VARCHAR (25) NOT NULL,
	usuario VARCHAR (25) NOT NULL,
	descripcion VARCHAR (500) NULL,
	estado VARCHAR (50) NOT NULL,
	fecha TIMESTAMP NULL,
	CONSTRAINT  pk_Acciones
	PRIMARY KEY( usuario , fecha )
);

-- table divisiones_territoriales
CREATE TABLE  divisiones_territoriales (
	padre VARCHAR (25) NULL,
	codigo VARCHAR (25) NOT NULL,
	nombre VARCHAR (250) NOT NULL,
	nombre_corto VARCHAR (25) NULL,
	CONSTRAINT  pk_DivisionTerritorial
	PRIMARY KEY( codigo )
);

-- table accesos_usuarios
CREATE TABLE accesos_usuarios (
	inquilino VARCHAR (25) NOT NULL,
	usuario VARCHAR (25) NOT NULL,
	sitio VARCHAR (36) NULL,
	estado VARCHAR (50) NOT NULL,
	fecha TIMESTAMP NULL,
	CONSTRAINT  pk_AccesoUsuario
	PRIMARY KEY( inquilino, usuario , sitio )
);

-- table accesos_inquilinos
CREATE TABLE accesos_inquilinos (
	anfitrion VARCHAR (25) NOT NULL,
	invitado VARCHAR (25) NOT NULL,
	sitio VARCHAR (36) NULL,
	estado VARCHAR (50) NOT NULL,
	fecha TIMESTAMP NULL,
	CONSTRAINT  pk_AccesoInquilino
	PRIMARY KEY( anfitrion, invitado , sitio )
);

-- ****************************************
-- *********** Foreign Keys SG ************
-- ****************************************

-- For inquilinos(fk_Inquilino_Agronegocio)
ALTER TABLE inquilinos ADD
	CONSTRAINT fk_Inquilino_Agronegocio
	FOREIGN KEY ( agronegocio )
	REFERENCES agronegocios ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For inquilinos(fk_Inquilino_Ubicacion)
ALTER TABLE inquilinos ADD
	CONSTRAINT fk_Inquilino_Ubicacion
	FOREIGN KEY ( territorio )
	REFERENCES divisiones_territoriales ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For usuarios(fk_Usuario_Inquilino)
ALTER TABLE usuarios ADD
	CONSTRAINT fk_Usuario_Inquilino
	FOREIGN KEY ( inquilino )
	REFERENCES inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For usuarios(fk_Usuario_Rol)
ALTER TABLE usuarios ADD
	CONSTRAINT fk_Usuario_Rol
	FOREIGN KEY ( rol )
	REFERENCES roles ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For funcionalidades_web(fk_Funcionalidad_Web_Rol)
ALTER TABLE funcionalidades_web ADD
	CONSTRAINT fk_Funcionalidad_Web_Rol
	FOREIGN KEY ( rol )
	REFERENCES roles ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For funcionalidades_web(fk_Funcionalidad_Web_Opcion)
ALTER TABLE funcionalidades_web ADD
	CONSTRAINT fk_Funcionalidad_Web_Opcion
	FOREIGN KEY ( opcion )
	REFERENCES opciones ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For funcionalidades_moviles(fk_Funcionalidad_Movil_Rol)
ALTER TABLE funcionalidades_moviles ADD
	CONSTRAINT fk_Funcionalidad_Movil_Rol
	FOREIGN KEY ( rol )
	REFERENCES roles ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;
	
-- For funcionalidades_moviles(fk_Funcionalidad_Movil_Tarea)
ALTER TABLE funcionalidades_moviles ADD
	CONSTRAINT fk_Funcionalidad_Movil_Tarea
	FOREIGN KEY ( agronegocio , tarea )
	REFERENCES tareas ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For acciones(fk_Accion_Inquilino)
ALTER TABLE acciones ADD
	CONSTRAINT fk_Accion_Inquilino
	FOREIGN KEY ( inquilino )
	REFERENCES inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For acciones(fk_Accion_Usuario)
ALTER TABLE acciones ADD
	CONSTRAINT fk_Accion_Usuario
	FOREIGN KEY ( usuario )
	REFERENCES usuarios ( telefono )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For accesos_usuarios(fk_Acceso_Usuario_Inquilino)
ALTER TABLE accesos_usuarios ADD
	CONSTRAINT fk_Acceso_Usuario_Inquilino
	FOREIGN KEY ( inquilino )
	REFERENCES inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For accesos_usuarios(fk_Accesos_Usuario_Usuario)
ALTER TABLE accesos_usuarios ADD
	CONSTRAINT fk_Accesos_Usuario_Usuario
	FOREIGN KEY ( usuario )
	REFERENCES usuarios ( telefono )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For accesos_inquilinos(fk_Acceso_Inquilino_Anfitrion)
ALTER TABLE accesos_inquilinos ADD
	CONSTRAINT fk_Acceso_Inquilino_Anfitrion
	FOREIGN KEY ( anfitrion )
	REFERENCES inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For accesos_inquilinos(fk_Acceso_Inquilino_Invitado)
ALTER TABLE accesos_inquilinos ADD
	CONSTRAINT fk_Acceso_Inquilino_Invitado
	FOREIGN KEY ( invitado )
	REFERENCES inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- **********************************
-- ********** Tables AD *************
-- **********************************

-- table listas
CREATE TABLE listas (
	codigo VARCHAR (25) NOT NULL,
	nombre VARCHAR (250) NOT NULL,
	descripcion VARCHAR (500) NULL,
	agronegocio VARCHAR (2) NOT NULL,
	trazable VARCHAR (3) NOT NULL,
	item VARCHAR (4) NOT NULL,
	CONSTRAINT  pk_Lista 
	PRIMARY KEY( codigo )
);

-- table itemslista
CREATE TABLE items_listas (
	lista VARCHAR (25) NOT NULL,
	valor VARCHAR (250) NOT NULL,
	orden INT NOT NULL,
	CONSTRAINT  pk_ItemLista 
	PRIMARY KEY( lista , valor )
);

-- table parametros
CREATE TABLE parametros (
	nombre VARCHAR (50) NOT NULL,
	valor TEXT NULL,
	descripcion VARCHAR (500) NULL,
	tipo VARCHAR (50) NOT NULL,
	inquilino VARCHAR (25) NOT NULL,
	CONSTRAINT  pk_Parametro 
	PRIMARY KEY( nombre )
);

-- table tarifas
CREATE TABLE tarifas (
	codigo SERIAL NOT NULL,
	nombre VARCHAR (250) NOT NULL,
	descripcion VARCHAR (500) NULL,
	valor INT NOT NULL,
	forma_pago VARCHAR (50) NOT NULL,
	descuento INT NULL,
	dias INT NOT NULL,
	minimo INT NULL,
	maximo INT NULL,
	estado VARCHAR (50) NOT NULL,
	vigencia TIMESTAMP NULL,
	CONSTRAINT  pk_Tarifas
	PRIMARY KEY( codigo )
);

-- table suscripciones
CREATE TABLE suscripciones (
	inquilino VARCHAR (25) NOT NULL,
	tarifa INT NOT NULL,
	valor INT NOT NULL,
	forma_pago VARCHAR (50) NULL,
	descuento INT NULL,
	comisionador VARCHAR (25) NULL,
	comision INT NULL,
	estado VARCHAR (50) NOT NULL,
	desde TIMESTAMP NOT NULL,
	hasta TIMESTAMP NOT NULL,
	CONSTRAINT  pk_Suscripcion
	PRIMARY KEY( inquilino , desde )
);

-- table casos
CREATE TABLE casos (
	codigo SERIAL NOT NULL,
	asunto VARCHAR (250) NOT NULL,
	detalle TEXT NOT NULL,
	tipo VARCHAR (50) NOT NULL,
	inquilino VARCHAR (25) NOT NULL,
	usuario VARCHAR (25) NOT NULL,
	opcion VARCHAR (25) NULL,
	agronegocio VARCHAR (2) NULL,
	tarea VARCHAR (4) NULL,
	referencia VARCHAR (500) NULL,
	estado VARCHAR (50) NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT  pk_Caso
	PRIMARY KEY( codigo )
);

-- table respuestas
CREATE TABLE respuestas (
	codigo SERIAL NOT NULL,
	caso INT NOT NULL,
	asunto VARCHAR (250) NOT NULL,
	detalle TEXT NOT NULL,
	tipo VARCHAR (50) NOT NULL,
	usuario VARCHAR (25) NOT NULL,
	referencia VARCHAR (500) NULL,
	estado VARCHAR (50) NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT  pk_Respuesta
	PRIMARY KEY( codigo )
);

-- table calificaciones
CREATE TABLE calificaciones (
	respuesta INT NOT NULL,
	valor INT NOT NULL,
	observaciones VARCHAR (500) NULL,
	usuario VARCHAR (25) NOT NULL,
	referencia VARCHAR (500) NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT  pk_calificacion
	PRIMARY KEY( respuesta , usuario )
);

-- ****************************************
-- *********** Foreign Keys AD ************
-- ****************************************

-- For listas(fk_Lista_Item)
ALTER TABLE listas ADD
	CONSTRAINT fk_Lista_Item
	FOREIGN KEY ( agronegocio , trazable , item )
	REFERENCES  items ( agronegocio , trazable , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For items_lista(fk_ItemLista_Lista)
ALTER TABLE items_listas ADD
	CONSTRAINT fk_ItemLista_Lista
	FOREIGN KEY ( lista )
	REFERENCES  listas ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For parametros(fk_Parametro_Inquilino)
ALTER TABLE parametros ADD
	CONSTRAINT fk_Parametro_Inquilino
	FOREIGN KEY ( inquilino )
	REFERENCES  inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For divisiones_territoriales(fk_DivisionTerritorial_Padre)
ALTER TABLE divisiones_territoriales ADD
	CONSTRAINT fk_DivisionTerritorial_Padre
	FOREIGN KEY ( padre )
	REFERENCES  divisiones_territoriales ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For suscripciones(fk_Suscripcion_Inquilino)
ALTER TABLE suscripciones ADD
	CONSTRAINT fk_Suscripcion_Inquilino
	FOREIGN KEY ( inquilino )
	REFERENCES  inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For suscripciones(fk_Suscripcion_Tarifa)
ALTER TABLE suscripciones ADD
	CONSTRAINT fk_Suscripcion_Tarifa
	FOREIGN KEY ( tarifa )
	REFERENCES  tarifas ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For suscripciones(fk_Suscripcion_Comisionador)
ALTER TABLE suscripciones ADD
	CONSTRAINT fk_Suscripcion_Comisionador
	FOREIGN KEY ( comisionador )
	REFERENCES  inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For casos(fk_Caso_Tarea)
ALTER TABLE casos ADD
	CONSTRAINT fk_Caso_Tarea
	FOREIGN KEY ( agronegocio , tarea )
	REFERENCES tareas ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For casos(fk_Caso_Inquilino)
ALTER TABLE casos ADD
	CONSTRAINT fk_Caso_Inquilino
	FOREIGN KEY ( inquilino )
	REFERENCES  inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For casos(fk_Caso_Usuario)
ALTER TABLE casos ADD
	CONSTRAINT fk_Caso_Usuario
	FOREIGN KEY ( usuario )
	REFERENCES usuarios ( telefono )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For casos(fk_Caso_Opcion)
ALTER TABLE casos ADD
	CONSTRAINT fk_Caso_Opcion
	FOREIGN KEY ( opcion )
	REFERENCES opciones ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For respuestas(fk_Respuesta_Caso)
ALTER TABLE respuestas ADD
	CONSTRAINT fk_Respuesta_Caso
	FOREIGN KEY ( caso )
	REFERENCES casos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For respuestas(fk_Respuesta_Usuario)
ALTER TABLE respuestas ADD
	CONSTRAINT fk_Respuesta_Usuario
	FOREIGN KEY ( usuario )
	REFERENCES usuarios ( telefono )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For calificaciones(fk_Calificacion_Respuesta)
ALTER TABLE calificaciones ADD
	CONSTRAINT fk_Calificacion_Respuesta
	FOREIGN KEY ( respuesta )
	REFERENCES respuestas ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For calificaciones(fk_Calificacion_Usuario)
ALTER TABLE calificaciones ADD
	CONSTRAINT fk_Calificacion_Usuario
	FOREIGN KEY ( usuario )
	REFERENCES usuarios ( telefono )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- **********************************
-- ********** Tables CP *************
-- **********************************

-- table publicaciones
CREATE TABLE  publicaciones (
	codigo SERIAL NOT NULL,
	encargado VARCHAR (25) NOT NULL,
	agronegocio VARCHAR (2) NOT NULL,
	categoria INT NOT NULL,
	titulo VARCHAR (250) NOT NULL,
	resumen VARCHAR (500) NULL,
	autor VARCHAR (250) NULL,
	referencia VARCHAR (500) NULL,
	etiquetas JSON NULL,
	fecha TIMESTAMP NOT NULL,
	imagen VARCHAR (250) NULL,
	nombre_corto VARCHAR (25) NOT NULL,
	contenido TEXT NULL,
	CONSTRAINT  pk_Publicacion 
	PRIMARY KEY( codigo )
);

-- table tipos_publicaciones
CREATE TABLE  categorias_publicaciones (
	codigo SERIAL NOT NULL,
	nombre VARCHAR (250) NOT NULL,
	descripcion VARCHAR (500) NULL,
	icono VARCHAR (250) NULL,
	CONSTRAINT  pk_TipoPublicacion 
	PRIMARY KEY( codigo )
);

-- table difusiones
CREATE TABLE  difusiones (
	codigo SERIAL NOT NULL,
	inquilino VARCHAR (25) NOT NULL,
	publicacion INT NOT NULL,
	valor INT NOT NULL,
	impresiones INT NOT NULL,
	forma_pago VARCHAR (50) NULL,
	descuento INT NULL,
	estado VARCHAR (50) NOT NULL,
	desde TIMESTAMP NOT NULL,
	hasta TIMESTAMP NOT NULL,
	CONSTRAINT  pk_Difusion
	PRIMARY KEY( codigo )
);

-- table sectores
CREATE TABLE  sectores (
	difusion INT NOT NULL,
	ubicacion VARCHAR (25) NOT NULL,
	referencia VARCHAR (500) NULL
);

-- table impresiones
CREATE TABLE  impresiones (
	difusion INT NOT NULL,
	usuario VARCHAR (25) NOT NULL,
	fecha TIMESTAMP NOT NULL
);

-- table reacciones
CREATE TABLE  reacciones (
	publicacion INT NOT NULL,
	usuario VARCHAR (25) NOT NULL,
	comentario TEXT NULL,
	tipo VARCHAR (50) NOT NULL, -- Me gusta / Comentario / Compartir
	fecha TIMESTAMP NOT NULL
);

-- ****************************************
-- *********** Foreign Keys CP ************
-- ****************************************

-- For publicaciones(fk_Publicacion_Agronegocio)
ALTER TABLE publicaciones ADD
	CONSTRAINT fk_Publicacion_Agronegocio
	FOREIGN KEY ( agronegocio )
	REFERENCES agronegocios ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For publicaciones(fk_Publicacion_Encargado)
ALTER TABLE publicaciones ADD
	CONSTRAINT fk_Publicacion_Encargado
	FOREIGN KEY ( encargado )
	REFERENCES  usuarios ( telefono )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For publicaciones(fk_Publicacion_Categoria)
ALTER TABLE publicaciones ADD
	CONSTRAINT fk_Publicacion_Categoria
	FOREIGN KEY ( categoria )
	REFERENCES  categorias_publicaciones ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For difusiones(fk_Difusion_Inquilino)
ALTER TABLE difusiones ADD
	CONSTRAINT fk_Difusion_Inquilino
	FOREIGN KEY ( inquilino )
	REFERENCES  inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For difusiones(fk_Difusion_Publicacion)
ALTER TABLE difusiones ADD
	CONSTRAINT fk_Difusion_Publicacion
	FOREIGN KEY ( publicacion )
	REFERENCES  publicaciones ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For sectores(fk_Sector_Difusion)
ALTER TABLE sectores ADD
	CONSTRAINT fk_Sector_Difusion
	FOREIGN KEY ( difusion )
	REFERENCES  difusiones ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For sectores(fk_Sector_Ubicaciones)
ALTER TABLE sectores ADD
	CONSTRAINT fk_Sector_Ubicaciones
	FOREIGN KEY ( ubicacion )
	REFERENCES  divisiones_territoriales ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For impresiones(fk_Impresion_Difusion)
ALTER TABLE impresiones ADD
	CONSTRAINT fk_Impresion_Difusion
	FOREIGN KEY ( difusion )
	REFERENCES  difusiones ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For impresiones(fk_Impresion_Usuario)
ALTER TABLE impresiones ADD
	CONSTRAINT fk_Impresion_Usuario
	FOREIGN KEY ( usuario )
	REFERENCES  usuarios ( telefono )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For reacciones(fk_Reaccion_Publicacion)
ALTER TABLE reacciones ADD
	CONSTRAINT fk_Reaccion_Publicacion
	FOREIGN KEY ( publicacion )
	REFERENCES  publicaciones ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For reacciones(fk_Reaccion_Usuario)
ALTER TABLE reacciones ADD
	CONSTRAINT fk_Reaccion_Usuario
	FOREIGN KEY ( usuario )
	REFERENCES  usuarios ( telefono )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- **********************************
-- *********** Tables TR ************
-- **********************************

-- table inventarios
CREATE TABLE  inventarios (
	id_trazii VARCHAR (36) NOT NULL,
	inquilino VARCHAR (25) NOT NULL,
	agronegocio VARCHAR (2) NOT NULL,
	trazable VARCHAR (3) NOT NULL,
	referencia VARCHAR (500) NULL,
	denominacion VARCHAR (500) NULL,	
	padre VARCHAR (36) NULL,
	estado VARCHAR (50) NULL,
	ultimo_cambio TIMESTAMP NULL,
	CONSTRAINT  pk_Inventario 
	PRIMARY KEY( id_trazii )
);

-- table datos
CREATE TABLE  datos (
	inventario VARCHAR (36) NOT NULL,
	agronegocio VARCHAR (2) NOT NULL,
	trazable VARCHAR (3) NOT NULL,
	item VARCHAR (4) NOT NULL,
	valor VARCHAR (500) NOT NULL,
	estado VARCHAR (50) NULL,
	ultimo_cambio TIMESTAMP NULL,
	CONSTRAINT  pk_Dato 
	PRIMARY KEY( inventario , agronegocio , trazable , item )
);

-- table trazas
CREATE TABLE  trazas (
	agronegocio VARCHAR (2) NOT NULL,
	tarea VARCHAR (4) NOT NULL,
	responsable VARCHAR (36) NOT NULL,
	inicio TIMESTAMP  NOT NULL,
	implicado VARCHAR (36) NULL,
	sitio VARCHAR (36) NULL,
	instrumento VARCHAR (36) NULL,
	fin TIMESTAMP  NULL,
	observaciones VARCHAR (500) NULL,
	referencia VARCHAR (500) NULL,	
	estado VARCHAR (50) NULL,
	ultimo_cambio TIMESTAMP NULL,
	CONSTRAINT  pk_Traza 
	PRIMARY KEY( agronegocio , tarea , responsable , inicio )
);

-- table ubicaciones
CREATE TABLE  ubicaciones (
	elemento VARCHAR (36) NOT NULL,
	desde TIMESTAMP  NOT NULL,
	ubicacion VARCHAR (36) NOT NULL,
	hasta TIMESTAMP  NULL,
	observaciones VARCHAR (500) NULL,
	referencia VARCHAR (500) NULL,	
	estado VARCHAR (50) NULL,
	ultimo_cambio TIMESTAMP NULL,
	CONSTRAINT  pk_Ubicacion 
	PRIMARY KEY( elemento , desde )
);

-- table caracteristicas
CREATE TABLE  caracteristicas (
	agronegocio VARCHAR (2) NOT NULL,
	trazable VARCHAR (3) NOT NULL,
	item VARCHAR (4) NOT NULL,
	tarea VARCHAR (4) NOT NULL,
	responsable VARCHAR (36) NOT NULL,
	inicio TIMESTAMP  NOT NULL,
	valor VARCHAR (500) NOT NULL,
	estado VARCHAR (50) NULL,
	ultimo_cambio TIMESTAMP NULL,
	CONSTRAINT  pk_Caracteristica 
	PRIMARY KEY( agronegocio , trazable , item , tarea , responsable , inicio )
);

-- ****************************************
-- *********** Foreign Keys TR ************
-- ****************************************

-- For usuarios(fk_Usuario_Inventario)
ALTER TABLE usuarios ADD
	CONSTRAINT fk_Usuario_Inventario
	FOREIGN KEY ( id_trazii )
	REFERENCES inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For accesos_usuarios(fk_Accesos_Usuario_Sitio)
ALTER TABLE accesos_usuarios ADD
	CONSTRAINT fk_Accesos_Usuario_Sitio
	FOREIGN KEY ( sitio )
	REFERENCES inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For accesos_inquilinos(fk_Acceso_Inquilino_Sitio)
ALTER TABLE accesos_inquilinos ADD
	CONSTRAINT fk_Acceso_Inquilino_Sitio
	FOREIGN KEY ( sitio )
	REFERENCES inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For inventarios(fk_Inventario_Inquilino) 
ALTER TABLE inventarios ADD
	CONSTRAINT fk_Inventario_Inquilino
	FOREIGN KEY ( inquilino )
	REFERENCES  inquilinos ( codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For inventarios(fk_Inventario_Trazable) 
ALTER TABLE inventarios ADD
	CONSTRAINT fk_Inventario_Trazable
	FOREIGN KEY ( agronegocio , trazable )
	REFERENCES  trazables ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For inventarios(fk_Inventario_Compuesto) 
ALTER TABLE inventarios ADD
	CONSTRAINT fk_Inventario_Compuesto
	FOREIGN KEY ( padre )
	REFERENCES  inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For datos(fk_Dato_Inventario) 
ALTER TABLE datos ADD
	CONSTRAINT fk_Dato_Inventario
	FOREIGN KEY ( inventario )
	REFERENCES  inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For datos(fk_Dato_Item) 
ALTER TABLE datos ADD
	CONSTRAINT fk_Dato_Item
	FOREIGN KEY ( agronegocio , trazable , item )
	REFERENCES  items ( agronegocio , trazable , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For ubicaciones(fk_Elemento_Inventario) 
ALTER TABLE ubicaciones ADD
	CONSTRAINT fk_Elemento_Inventario
	FOREIGN KEY ( elemento )
	REFERENCES  inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For ubicaciones(fk_Ubicacion_Inventario) 
ALTER TABLE ubicaciones ADD
	CONSTRAINT fk_Ubicacion_Inventario
	FOREIGN KEY ( ubicacion )
	REFERENCES  inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For trazas(fk_Traza_Tarea) 
ALTER TABLE trazas ADD
	CONSTRAINT fk_Traza_Tarea
	FOREIGN KEY ( agronegocio , tarea )
	REFERENCES  tareas ( agronegocio , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For trazas(fk_Traza_Responsable) 
ALTER TABLE trazas ADD
	CONSTRAINT fk_Traza_Responsable
	FOREIGN KEY ( responsable )
	REFERENCES  inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For trazas(fk_Traza_Implicado) 
ALTER TABLE trazas ADD
	CONSTRAINT fk_Traza_Implicado
	FOREIGN KEY ( implicado )
	REFERENCES  inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For trazas(fk_Traza_Sitio) 
ALTER TABLE trazas ADD
	CONSTRAINT fk_Traza_Sitio
	FOREIGN KEY ( sitio )
	REFERENCES  inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For trazas(fk_Traza_Instrumento) 
ALTER TABLE trazas ADD
	CONSTRAINT fk_Traza_Instrumento
	FOREIGN KEY ( instrumento )
	REFERENCES  inventarios ( id_trazii )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For caracteristicas(fk_Caracteristica_Traza) 
ALTER TABLE caracteristicas ADD
	CONSTRAINT fk_Caracteristica_Traza
	FOREIGN KEY ( agronegocio , tarea , responsable , inicio )
	REFERENCES  trazas ( agronegocio , tarea , responsable , inicio )
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- For caracteristicas(fk_Caracteristica_Item) 
ALTER TABLE caracteristicas ADD
	CONSTRAINT fk_Caracteristica_Item
	FOREIGN KEY ( agronegocio , trazable , item  )
	REFERENCES  items ( agronegocio , trazable , codigo )
	ON DELETE CASCADE
    ON UPDATE CASCADE;
