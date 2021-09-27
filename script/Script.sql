DROP DATABASE IF EXISTS trabajo_individual;
CREATE DATABASE trabajo_individual;
USE trabajo_individual;

CREATE TABLE trabajo_individual.usuarios (
	usuario_id INT auto_increment NOT NULL,
	usuarioName varchar(10) NOT NULL,
	usaurio_email varchar(100) NOT NULL,
	CONSTRAINT Usuarios_pk PRIMARY KEY (usuario_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE trabajo_individual.notas (
	nota_id INT auto_increment NOT NULL,
	notaTitulo varchar(20) NOT NULL,
	fechaDeCreacion DATE NOT NULL,
	ultimaModificacion DATE NOT NULL,
	decriptionNote varchar(1000) NULL,
	status TINYINT NOT NULL,
	usuario_id INT NOT NULL,
	CONSTRAINT notas_pk PRIMARY KEY (nota_id),
	CONSTRAINT notas_FK FOREIGN KEY (usuario_id) REFERENCES trabajo_individual.usuarios(usuario_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE trabajo_individual.categoria (
	categoriaID INT auto_increment NOT NULL,
	categoryName varchar(100) NOT NULL,
	CONSTRAINT categoria_pk PRIMARY KEY (categoriaID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE trabajo_individual.categoriaNota (
	categoryNoteID INT auto_increment NOT NULL,
	category_id INT NOT NULL,
	nota_id INT NOT NULL,
	CONSTRAINT categoriaNota_pk PRIMARY KEY (categoryNoteID),
	CONSTRAINT categoriaNota_FK FOREIGN KEY (category_id) REFERENCES trabajo_individual.categoria(categoriaID),
	CONSTRAINT categoriaNota_FK_1 FOREIGN KEY (nota_id) REFERENCES trabajo_individual.notas(nota_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


