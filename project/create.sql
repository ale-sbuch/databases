CREATE TABLE Commissione (
  id VARCHAR(20) NOT NULL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  via VARCHAR(100),
  città VARCHAR(50),
  CAP CHAR(5)
);


CREATE TABLE Regolamento (
  id VARCHAR(30) NOT NULL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  dataDiEntrataInVigore DATE NOT NULL,
  commissione VARCHAR(20) NOT NULL REFERENCES Commissione(id)
);


CREATE TABLE Domanda (
  id INT(10) NOT NULL,
  regolamento VARCHAR(30) NOT NULL REFERENCES Regolamento(id),
  testoDomanda VARCHAR(100) NOT NULL,
  rispostaCorretta CHAR(1) NOT NULL,
  PRIMARY KEY(id, regolamento)
);


CREATE TABLE Utente (
  username VARCHAR(30) NOT NULL PRIMARY KEY,
  password VARCHAR(20) NOT NULL,
  nome VARCHAR(50),
  cognome VARCHAR(50),
  dataNascita DATE,
  docente BIT DEFAULT 0,
  ospite BIT DEFAULT 0
);


CREATE TABLE Appartiene (
  utente VARCHAR(30) NOT NULL REFERENCES Utente(username),
  commissione VARCHAR(20) NOT NULL REFERENCES Commissione(id),
  ruolo VARCHAR(30) NOT NULL,
  dataInizio DATE NOT NULL,
  dataFine DATE DEFAULT NULL,
  PRIMARY KEY(utente, commissione, ruolo, dataInizio)
);


CREATE TABLE Esame (
  id INT(10) NOT NULL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  regolamento VARCHAR(30) REFERENCES Regolamento(id),
  numeroDomande INT(3) NOT NULL
);


CREATE TABLE Sostiene (
  utente VARCHAR(30) NOT NULL REFERENCES Utente(username),
  esame INT(10) NOT NULL REFERENCES Esame(id),
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  esitoEsame VARCHAR(100) NOT NULL,
  PRIMARY KEY(utente, esame, timestamp)
);