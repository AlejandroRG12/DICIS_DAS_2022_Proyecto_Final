CREATE DATABASE IF NOT EXISTS rides_db;

USE rides_db;

CREATE TABLE IF NOT EXISTS conductor (
	con_id INT AUTO_INCREMENT NOT NULL,
    con_nombre VARCHAR(40),
    con_ape_pat VARCHAR(30) NOT NULL,
    con_ape_mat VARCHAR(30) NOT NULL,
    con_edad DATE NOT NULL,
    con_numero_licencia VARCHAR(12) NOT NULL,
    con_telefono VARCHAR(10) NOT NULL,
    con_pais ENUM('Mexico') NOT NULL,
    PRIMARY KEY (con_id)
);

CREATE TABLE IF NOT EXISTS pasajero (
	pas_id INT AUTO_INCREMENT NOT NULL,
    pas_nombre VARCHAR(30) NOT NULL,
    pas_ape_pat VARCHAR(30) NOT NULL,
    pas_ape_mat VARCHAR(30) NOT NULL,
    pas_edad DATE NOT NULL,
    PRIMARY KEY (pas_id)
);

CREATE TABLE IF NOT EXISTS auto (
	aut_id INT AUTO_INCREMENT NOT NULL,
    aut_modelo VARCHAR(40) NOT NULL,
    aut_modelo_anio YEAR NOT NULL,
    aut_marca VARCHAR(30) NOT NULL,
    aut_color VARCHAR(20) NOT NULL,
    aut_placas VARCHAR(7) NOT NULL,
    aut_con_id INT,
    PRIMARY KEY(aut_id),
    CONSTRAINT conductor_auto_fk
		FOREIGN KEY (aut_con_id)
        REFERENCES conductor(con_id)
);

CREATE TABLE IF NOT EXISTS viaje (
	via_id INT AUTO_INCREMENT NOT NULL,
    via_lugar_inicio VARCHAR(50) NOT NULL,
    via_lugar_fin VARCHAR(50) NOT NULL,
    via_inicio DATE NOT NULL,
    via_fin DATE NOT NULL,
    via_costo  FLOAT(7,2) NOT NULL,
    via_estado BOOLEAN DEFAULT(false),
    via_pas_id INT,
    via_con_id INT,
    PRIMARY KEY(via_id),
    CONSTRAINT pasajero_viaje_fk
		FOREIGN KEY (via_pas_id)
        REFERENCES pasajero(pas_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
	CONSTRAINT conductor_pasajero_fk
		FOREIGN KEY (via_con_id)
        REFERENCES conductor(con_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);