CREATE TABLE tipos_empleado (
  _id INTEGER,
  nombre VARCHAR(30) UNIQUE
);

CREATE TABLE tipos_contratacion (
  _id INTEGER,
  tipo_contratacion VARCHAR(30) UNIQUE
);

CREATE TABLE paises (
  _id INTEGER,
  nombre VARCHAR(20)
);

CREATE TABLE departamento (
  _id INTEGER,
  nombre VARCHAR(20),
  cod_pais INTEGER
);

CREATE TABLE ciudades (
  _id INTEGER,
  nombre VARCHAR(30),
  cod_dep INTEGER
);

CREATE TABLE sedes (
  _id INTEGER,
  nombre VARCHAR(30),
  cod_ciudades INTEGER
);

CREATE TABLE facultades (
  _id INTEGER,
  nombre VARCHAR(30),
  ubicacion VARCHAR(30),
  tel_num VARCHAR(30),
  id_decano INTEGER
);

CREATE TABLE areas (
  _id INTEGER,
  areas_name VARCHAR(30),
  id_facultades INTEGER,
  id_coordinador INTEGER
);

CREATE TABLE programas (
  _id INTEGER,
  nombre VARCHAR(30),
  id_areas INTEGER
);

CREATE TABLE empleados (
  _id INTEGER,
  nombres VARCHAR(30),
  apellidos VARCHAR(30),
  email VARCHAR(30),
  tipo_contratacion INTEGER,
  tipo_empleado INTEGER,
  id_facultades INTEGER,
  id_sedes INTEGER,
  nacimiento_lugar VARCHAR(30)
);

-- PRIMARY KEYS
ALTER TABLE tipos_empleado ADD CONSTRAINT pk_tipos_empleado PRIMARY KEY (_id);
ALTER TABLE tipos_contratacion ADD CONSTRAINT pk_tipos_contratacion PRIMARY KEY (_id);
ALTER TABLE paises ADD CONSTRAINT pk_paises PRIMARY KEY (_id);
ALTER TABLE departamento ADD CONSTRAINT pk_departamento PRIMARY KEY (_id);
ALTER TABLE ciudades ADD CONSTRAINT pk_ciudades PRIMARY KEY (_id);
ALTER TABLE sedes ADD CONSTRAINT pk_sedes PRIMARY KEY (_id);
ALTER TABLE facultades ADD CONSTRAINT pk_facultades PRIMARY KEY (_id);
ALTER TABLE areas ADD CONSTRAINT pk_areas PRIMARY KEY (_id);
ALTER TABLE programas ADD CONSTRAINT pk_programas PRIMARY KEY (_id);
ALTER TABLE empleados ADD CONSTRAINT pk_empleados PRIMARY KEY (_id);

-- FOREIGN KEYS
ALTER TABLE departamento ADD CONSTRAINT fk_departamento_paises FOREIGN KEY (cod_pais) REFERENCES paises(_id);
ALTER TABLE ciudades ADD CONSTRAINT fk_ciudades_departamento FOREIGN KEY (cod_dep) REFERENCES departamento(_id);
ALTER TABLE sedes ADD CONSTRAINT fk_sedes_ciudades FOREIGN KEY (cod_ciudades) REFERENCES ciudades(_id);
ALTER TABLE areas ADD CONSTRAINT fk_areas_facultades FOREIGN KEY (id_facultades) REFERENCES facultades(_id);
ALTER TABLE programas ADD CONSTRAINT fk_programas_areas FOREIGN KEY (id_areas) REFERENCES areas(_id);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_tipos_contratacion FOREIGN KEY (tipo_contratacion) REFERENCES tipos_contratacion(tipo_contratacion);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_tipos_empleado FOREIGN KEY (tipo_empleado) REFERENCES tipos_empleado(nombre);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_facultades FOREIGN KEY (id_facultades) REFERENCES facultades(_id);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_sedes FOREIGN KEY (id_sedes) REFERENCES sedes(_id);

-- Insercion de Datos

-- Tabla Tipos Empleado
INSERT INTO tipos_empleado (_id, nombre) VALUES (1, 'Administrativo');
INSERT INTO tipos_empleado (_id, nombre) VALUES (2, 'Docente');

-- Tabla tipos contratacion
INSERT INTO tipos_contratacion (_id, tipo_contratacion) VALUES (1, 'LIBRE NOMBRAMIENTO');
INSERT INTO tipos_contratacion (_id, tipo_contratacion) VALUES (2, 'CARRERA ADMINISTRATIVA');
INSERT INTO tipos_contratacion (_id, tipo_contratacion) VALUES (3, 'CARRERA DOCENTE');

-- Tabla Paises
INSERT INTO paises (_id, nombre) VALUES (1, 'Colombia');
INSERT INTO paises (_id, nombre) VALUES (2, 'Canadá');
INSERT INTO paises (_id, nombre) VALUES (3, 'Estados Unidos');
INSERT INTO paises (_id, nombre) VALUES (4, 'Alemania');
INSERT INTO paises (_id, nombre) VALUES (5, 'Francia');
INSERT INTO paises (_id, nombre) VALUES (6, 'España');
INSERT INTO paises (_id, nombre) VALUES (7, 'China');
INSERT INTO paises (_id, nombre) VALUES (8, 'Japón');
INSERT INTO paises (_id, nombre) VALUES (9, 'Brasil');
INSERT INTO paises (_id, nombre) VALUES (10, 'México');

-- Tabla Departamentos
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (1, 'Amazonas', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (2, 'Antioquia', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (3, 'Arauca', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (4, 'Atlántico', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (5, 'Bolívar', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (6, 'Boyacá', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (7, 'Caldas', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (8, 'Caquetá', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (9, 'Casanare', 1);
INSERT INTO departamento (_id, nombre, cod_pais) VALUES (10, 'Cauca', 1);

-- Tabla Ciudades
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (1, 'Leticia', 1);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (2, 'Puerto Nariño', 1);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (3, 'Tarapacá', 1);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (4, 'Medellín', 2);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (5, 'Envigado', 2);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (6, 'Itagüí', 2);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (7, 'Arauca', 3);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (8, 'Saravena', 3);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (9, 'Tame', 3);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (10, 'Barranquilla', 4);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (11, 'Soledad', 4);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (12, 'Malambo', 4);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (13, 'Cartagena', 5);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (14, 'Magangué', 5);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (15, 'Sincelejo', 5);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (16, 'Tunja', 6);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (17, 'Duitama', 6);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (18, 'Sogamoso', 6);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (19, 'Manizales', 7);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (20, 'Pereira', 7);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (21, 'Armenia', 7);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (22, 'Florencia', 8);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (23, 'San Vicente del Caguán', 8);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (24, 'Valparaíso', 8);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (25, 'Yopal', 9);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (26, 'Aguazul', 9);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (27, 'Tauramena', 9);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (28, 'Popayán', 10);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (29, 'Santander de Quilichao', 10);
INSERT INTO ciudades (_id, nombre, cod_dep) VALUES (30, 'Puerto Tejada', 10);

-- tabla sedes
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (1, 'Sede Central', 1);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (2, 'Sede Norte', 2);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (3, 'Sede Sur', 3);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (4, 'Sede Este', 4);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (5, 'Sede Oeste', 5);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (6, 'Sede Principal', 6);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (7, 'Sede Secundaria', 7);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (8, 'Sede Central', 8);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (9, 'Sede Norte', 9);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (10, 'Sede Sur', 10);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (11, 'Sede Este', 11);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (12, 'Sede Oeste', 12);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (13, 'Sede Principal', 13);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (14, 'Sede Secundaria', 14);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (15, 'Sede Central', 15);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (16, 'Sede Norte', 16);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (17, 'Sede Sur', 17);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (18, 'Sede Este', 18);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (19, 'Sede Oeste', 19);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (20, 'Sede Principal', 20);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (21, 'Sede Secundaria', 21);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (22, 'Sede Central', 22);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (23, 'Sede Norte', 23);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (24, 'Sede Sur', 24);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (25, 'Sede Este', 25);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (26, 'Sede Oeste', 26);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (27, 'Sede Principal', 27);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (28, 'Sede Secundaria', 28);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (29, 'Sede Nueva', 29);
INSERT INTO sedes (_id, nombre, cod_ciudades) VALUES (30, 'Sede Alterna', 30);

-- tabla facultades
INSERT INTO facultades (_id, nombre, ubicacion, tel_num, id_decano) VALUES (1, 'F. Ingeniería', 'Edificio Principal', '123456789', 1);
INSERT INTO facultades (_id, nombre, ubicacion, tel_num, id_decano) VALUES (2, 'F. Ciencias Económicas', 'Edificio B', '987654321', 2);
INSERT INTO facultades (_id, nombre, ubicacion, tel_num, id_decano) VALUES (3, 'F. Ciencias de la Salud', 'Edificio C', '567891234', 3);
INSERT INTO facultades (_id, nombre, ubicacion, tel_num, id_decano) VALUES (4, 'F. Artes y Humanidades', 'Edificio D', '432109876', 4);
INSERT INTO facultades (_id, nombre, ubicacion, tel_num, id_decano) VALUES (5, 'F. Ciencias Básicas', 'Edificio E', '678912345', 5);

-- Tabla Areas
INSERT INTO areas (_id, areas_name, id_facultades, id_coordinador) VALUES (1, 'Ingenierías', 1, 1);
INSERT INTO areas (_id, areas_name, id_facultades, id_coordinador) VALUES (2, 'Administración', 2, 2);
INSERT INTO areas (_id, areas_name, id_facultades, id_coordinador) VALUES (3, 'Medicina', 3, 3);
INSERT INTO areas (_id, areas_name, id_facultades, id_coordinador) VALUES (4, 'Arte y Diseño', 4, 4);
INSERT INTO areas (_id, areas_name, id_facultades, id_coordinador) VALUES (5, 'Matemáticas', 5, 5);

-- Tabla programas
INSERT INTO programas (_id, nombre, id_areas) VALUES (1, 'Ingeniería de Sistemas', 1);
INSERT INTO programas (_id, nombre, id_areas) VALUES (2, 'Administración de Empresas', 2);
INSERT INTO programas (_id, nombre, id_areas) VALUES (3, 'Psicología', 3);
INSERT INTO programas (_id, nombre, id_areas) VALUES (4, 'Arquitectura', 4);
INSERT INTO programas (_id, nombre, id_areas) VALUES (5, 'Contaduría Pública', 2);

-- tabla Empleados
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (1, 'Juan', 'Perez', 'juan@example.com', 2, 1, 1, 1, 'Medellin');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (2, 'Maria', 'Lopez', 'maria@example.com', 3, 2, 2, 2, 'Bogota');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (3, 'Pedro', 'Gonzalez', 'pedro@example.com', 2, 1, 1, 3, 'Cali');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (4, 'Ana', 'Martinez', 'ana@example.com', 3, 2, 2, 4, 'Medellin');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (5, 'Carlos', 'Sanchez', 'carlos@example.com', 2, 1, 1, 1, 'Bogota');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (6, 'Laura', 'Gomez', 'laura@example.com', 3, 2, 2, 3, 'Cali');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (7, 'Manuel', 'Rodriguez', 'manuel@example.com', 2, 1, 1, 4, 'Medellin');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (8, 'Isabel', 'Torres', 'isabel@example.com', 3, 2, 2, 2, 'Bogota');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (9, 'Fernando', 'Lopez', 'fernando@example.com', 1, 1, 1, 3, 'Cali');
INSERT INTO empleados (_id, nombres, apellidos, email, tipo_contratacion, tipo_empleado, id_facultades, id_sedes, nacimiento_lugar)
VALUES (10, 'Daniela', 'Hernandez', 'daniela@example.com', 1, 2, 2, 4, 'Medellin');









