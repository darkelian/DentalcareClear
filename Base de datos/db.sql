CREATE DATABASE IF NOT EXISTS database_dental;

USE database_dental;

CREATE TABLE  Usuarios(
    usuario_id INT (100) NOT NULL AUTO_INCREMENT ,
    usuario_correo VARCHAR(100) NOT NULL,
    usuario_clave VARCHAR(100) NOT NULL,
    usuario_permiso VARCHAR(10) NOT NULL
);

ALTER TABLE Usuarios 
ADD PRIMARY KEY (usuario_id);

CREATE TABLE Administradores(
    admin_id INT (100) NOT NULL AUTO_INCREMENT,
    admin_documento INT(100) NOT NULL,
    admin_nombre VARCHAR(100) NOT NULL,
    admin_apellido VARCHAR(100) NOT NULL,
    admin_telefono INT(100) NOT NULL,
    admin_direccion VARCHAR(100) NOT NULL,
    admin_usuario_correo VARCHAR(100) NOT NULL
);

ALTER TABLE Administradores 
ADD PRIMARY KEY (admin_id);

ALTER TABLE Administradores
ADD FOREIGN KEY (admin_usuario_correo) 
REFERENCES Usuarios(usuario_correo); 

CREATE TABLE Doctor(
    doctor_id INT (100) NOT NULL AUTO_INCREMENT,
    doctor_documento INT(100) NOT NULL,
    doctor_nombre VARCHAR(100) NOT NULL,
    doctor_apellido VARCHAR(100) NOT NULL,
    doctor_telefono INT(100) NOT NULL,
    doctor_direccion VARCHAR(100) NOT NULL,
    doctor_usuario_correo VARCHAR(100) NOT NULL     
);

ALTER TABLE Doctor 
ADD PRIMARY KEY (doctor_id);

ALTER TABLE Doctor
ADD FOREIGN KEY (doctor_usuario_correo ) 
REFERENCES Usuarios(usuario_correo); 

CREATE TABLE Paciente(
    paciente_id INT (100) NOT NULL AUTO_INCREMENT,
    paciente_documento INT(100) NOT NULL,
    paciente_nombre VARCHAR(100) NOT NULL,
    paciente_apellido VARCHAR(100) NOT NULL,
    paciente_telefono INT(100) NOT NULL,
    paciente_direccion VARCHAR(100) NOT NULL,
    paciente_usario_correo VARCHAR(100) NOT NULL,
    paciente_tipo_documento INT(10) NOT NULL,
    paciente_genero INT(10) NOT NULL,
    paciente_fecha_nac DATE NOT NULL,
    paciente_estado_civil INT(10) NOT NULL,
    paciente_fecha_registro DATETIME NOT NULL     
);

ALTER TABLE Paciente 
ADD PRIMARY KEY (paciente_id);

ALTER TABLE Doctor
ADD FOREIGN KEY (paciente_usario_correo) 
REFERENCES Usuarios(usuario_correo); 

CREATE TABLE InformacionBasica(
    info_basica_id INT (100) NOT NULL AUTO_INCREMENT,
    info_basica_nombre_acomp VARCHAR(100) NOT NULL,
    info_basica_telef_acomp INT(100) NOT NULL,
    info_basica_motivo VARCHAR(250) NOT NULL,
    info_basica_enfermedades_activas VARCHAR(200) NOT NULL,
    info_basica_antecedentes_personales VARCHAR(250) NOT NULL,
    info_basica_antecedentes_familiares VARCHAR(250) NOT NULL,
    info_basica_antecendentes_quirurgicos VARCHAR(250) NOT NULL,     
); 

ALTER TABLE InformacionBasica 
ADD PRIMARY KEY (info_basica_id);

CREATE TABLE Historial(
    historial_id INT (100) NOT NULL AUTO_INCREMENT,
    historial_paciente_id INT(100) NOT NULL,
    historial_fecha_inicio DATETIME NOT NULL, 
    historial_info_basica_id INT (100) NOT NULL
);

ALTER TABLE Historial 
ADD PRIMARY KEY (historial_id);

ALTER TABLE Historial
ADD FOREIGN KEY (historial_paciente_id) 
REFERENCES Paciente(paciente_id);

ALTER TABLE Historial
ADD FOREIGN KEY (historial_info_basica_id ) 
REFERENCES InformacionBasica(info_basica_id);

CREATE TABLE Agenda(
    agenda_id INT (100) NOT NULL AUTO_INCREMENT,
    agenda_doctor_id INT(100) NOT NULL,
    agenda_fecha DATETIME  NOT NULL,
    agenda_estado VARCHAR(100) NOT NULL
); 

ALTER TABLE Agenda 
ADD PRIMARY KEY (agenda_id);

ALTER TABLE Historial
ADD FOREIGN KEY (agenda_doctor_id)  
REFERENCES Doctor(doctor_id);

CREATE TABLE Tratamiento(
    trat_id INT (100) NOT NULL AUTO_INCREMENT,
    trat_nombre VARCHAR(200) NOT NULL,
    trat_descripcion VARCHAR(1000) NOT NULL,
    trat_precio INT(100) NOT NULL
);

ALTER TABLE Tratamiento 
ADD PRIMARY KEY (trat_id);

CREATE TABLE HistorialTratamiento( 
    histra_id INT (100) NOT NULL,
    histra_paciente_id  INT(100) NOT NULL,
    histra_tratamiento_id  INT(100) NOT NULL,
    histra_abono INT(100) NOT NULL,
    histra_estado VARCHAR(10 0) NOT NULL
);

ALTER TABLE HistorialTratamiento 
ADD PRIMARY KEY (histra_id);

ALTER TABLE HistorialTratamiento
ADD FOREIGN KEY (histra_paciente_id)  
REFERENCES Paciente(paciente_id);

ALTER TABLE HistorialTratamiento
ADD FOREIGN KEY (histra_tratamiento_id)  
REFERENCES Tratamiento(trat_id);

CREATE TABLE HistorialCita(
    hiscita_id INT (100) NOT NULL,
    hiscita_agenda_id INT (100) NOT NULL,
    hiscita_paciente_id INT (12) NOT NULL,
    hiscita_tratamiento_id INT (100) NOT NULL,
    hiscita_asistencia VARCHAR(100) NOT NULL,
    hiscita_descripcion VARCHAR(250) NOT NULL,
    hiscita_abono INT(250) NOT NULL 
);
 
ALTER TABLE HistorialCita 
ADD PRIMARY KEY (hiscita_id);

ALTER TABLE HistorialCita
ADD FOREIGN KEY (hiscita_agenda_id)  
REFERENCES Agenda(agenda_id);

ALTER TABLE HistorialCita
ADD FOREIGN KEY (hiscita_paciente_id)  
REFERENCES Paciente(paciente_id);

ALTER TABLE HistorialCita
ADD FOREIGN KEY (hiscita_tratamiento_id)  
REFERENCES Tratamiento(trat_id);

DESCRIBE users;