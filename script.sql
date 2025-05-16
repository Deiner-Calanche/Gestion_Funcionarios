
-- Base de datos: funcionariosdb

CREATE DATABASE IF NOT EXISTS funcionariosdb;
USE funcionariosdb;

-- Tabla: tipo_documento
CREATE TABLE tipo_documento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

-- Tabla: estado_civil
CREATE TABLE estado_civil (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(50) NOT NULL
);

-- Tabla: funcionario
CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento_id INT NOT NULL,
    numero_identificacion VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    estado_civil_id INT NOT NULL,
    sexo VARCHAR(10),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento(id),
    FOREIGN KEY (estado_civil_id) REFERENCES estado_civil(id)
);

-- Tabla: grupo_familiar
CREATE TABLE grupo_familiar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    relacion VARCHAR(50) NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);

-- Tabla: formacion_academica
CREATE TABLE formacion_academica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    universidad VARCHAR(100) NOT NULL,
    nivel_estudio VARCHAR(50) NOT NULL,
    titulo_estudio VARCHAR(100) NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);
