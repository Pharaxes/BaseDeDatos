-- comentatios con doble guion
CREATE TABLE posts (
	id SERIAL PRIMARY KEY, 									--serial es postgres ya identifica como int autoincrement, y primeary key ya toma el not null
	titulo VARCHAR(200) NOT NULL,
	contenido TEXT NOT NULL, 								--text es como varchar, pero sin un limite definido de caracteres
	fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP 	--a diferencia de DATE que guarda solo el dia, timestamp guarda hora/min/seg  
	--usuario_id INT NOT NULL REFERENCES usuarios(id)		--si hubieramos ejecutado una query para crear la tabla usuarios primero
);															--las sentencias SQL se terminan con ;. Cada linea de la query se debe separar por coma. 

--Para ejecutar querys hay que posicionarnos en el ;.
--Excecute query ejeuta solo la query donde estamos posicionados
--Excecute script ejecuta todas las consultas

SELECT * FROM posts;

INSERT INTO posts (titulo, contenido)
VALUES 
	('Primer post', 'Contenido del primer post'),
	('Segundo post', 'Contenido del segundo post'); 		--usar comillas simples ''. las dobles tiran error

CREATE TABLE usuarios (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	email VARCHAR(150) UNIQUE NOT NULL,
	password TEXT NOT NULL		--se puede usar VARCHAR(255)
);

SELECT * FROM usuarios;

INSERT INTO usuarios (nombre, email, password)
VALUES 
	('Pablo', 'pablo@emailfalso.com', 'facil123'),
	('Martin', 'martin@emailfalso.com', 'dificil123');

ALTER TABLE posts
ADD COLUMN usuario_id INT REFERENCES usuarios(id); -- no olvidar el tipo de dato que va a tener la columna

ALTER TABLE posts
DROP COLUMN usuario_id;

UPDATE posts
SET usuario_id = 1
WHERE id = 3;

INSERT INTO posts (titulo, contenido)
VALUES 
	('Tercer post', 'Contenido del tercer post');

ALTER TABLE posts
ALTER COLUMN usuario_id SET NOT NULL;

INSERT INTO posts (titulo, contenido, usuario_id)
VALUES 
	('Cuarto post', 'Contenido del cuarto post', 2);

SELECT * FROM usuarios;

CREATE TYPE user_status_enum AS ENUM ('ACTIVE', 'INACTIVE'); -- nuevo tipo de datos. Enum evita que se pueda poner cualquier valor en una variable, al contrario que si la defino como TEXT/VARCHAR

ALTER TABLE IF EXISTS public.usuarios
    ADD COLUMN estado user_status_enum DEFAULT 'ACTIVE'; --quiero que se rellene con ACTIVO,PENDIENTE,INACTIVO, ver arriba

ALTER TYPE user_status_enum ADD VALUE 'PENDING';




