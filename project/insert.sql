INSERT INTO Commissione (id, nome, via, città, CAP) VALUES
('FIJLKAM_KA', 'Fijlkam Kata', 'Via dei Sandolini, 79',
  'Ostia Lido - Roma', '00122'),
('FIJLKAM_KU', 'Fijlkam Kumite', 'Via dei Sandolini, 79',
  'Ostia Lido - Roma', '00122'),
('WKF_KA', 'WKF Kata', NULL, NULL, NULL),
('WKF_KU', 'WKF Kumite', NULL, NULL, NULL);


INSERT INTO Regolamento (id, nome, dataDiEntrataInVigore, commissione) VALUES
('FIJLKAM_KA_2022_03_02', 'Fijlkam Kata 02-03-2022',
  '2022-03-02', 'FIJLKAM_KA'),
('FIJLKAM_KU_2022_03_02', 'Fijlkam Kumite 02-03-2022',
  '2022-03-02', 'FIJLKAM_KU'),
('WKF_KA_2022_01_17', 'WKF Kata 17-01-2022',
  '2022-01-17', 'WKF_KA'),
('WKF_KU_2022_01_17', 'WKF Kumite 17-01-2022',
  '2022-01-17', 'WKF_KU');


INSERT INTO Domanda (id, regolamento, testoDomanda, rispostaCorretta) VALUES
(1, 'FIJLKAM_KA_2022_03_02', 'Nel Kata sono ammesse le variazioni dello stile (Ryu-ha) praticato dal concorrente', 'F'),
(1, 'FIJLKAM_KU_2022_03_02', 'La giacca del karategi deve essere più lunga di tre quarti della coscia', 'F'),
(2, 'FIJLKAM_KA_2022_03_02', 'Nelle gare di kata gli occhiali sono proibiti', 'T'),
(2, 'FIJLKAM_KU_2022_03_02', 'I pantaloni del karategi devono coprire almeno due terzi della gamba', 'F'),
(3, 'FIJLKAM_KA_2022_03_02', 'Il numero dei concorrenti sarà il fattore determinante per definire il numero di gruppi per i turni eliminatori', 'T'),
(3, 'FIJLKAM_KU_2022_03_02', 'Le maniche della giacca del karategi non devono superare la piegatura del polso', 'T');


INSERT INTO Utente (username, password, nome, cognome, dataNascita, docente, ospite) VALUES
('mario.rossi', 'mario.psw', 'Mario', 'Rossi',
  '2000-01-01', 0, 0),
('andrea.bianchi', 'andrea.psw', 'Andrea', 'Bianchi',
  '1980-02-02', 1, 0),
('demo', 'demo', NULL, NULL, NULL, 0, 1);


INSERT INTO Appartiene (utente, commissione, ruolo, dataInizio, dataFine) VALUES
('mario.rossi', 'FIJLKAM_KA', 'Arbitro regionale',
  '2022-01-01', NULL),
('mario.rossi', 'FIJLKAM_KU', 'Arbitro regionale',
  '2022-01-01', NULL),
('andrea.bianchi', 'FIJLKAM_KA', 'Arbitro regionale',
  '2018-01-01', '2020-01-01'),
('andrea.bianchi', 'FIJLKAM_KU', 'Arbitro regionale',
  '2018-01-01', '2020-01-01'),
('andrea.bianchi', 'FIJLKAM_KA', 'Arbitro nazionale',
  '2020-01-01', NULL);


INSERT INTO Esame (id, nome, regolamento, numeroDomande) VALUES
(1, 'Test Kata Fijlkam', 'FIJLKAM_KA_2022_03_02', 3),
(2, 'Test Kumite Fijlkam', 'FIJLKAM_KU_2022_03_02', 3),
(3, 'Test WKF Kata', 'WKF_KA_2022_01_17', 30),
(4, 'Test WKF Kumite', 'WKF_KU_2022_01_17', 50);


INSERT INTO Sostiene (utente, esame, timestamp, esitoEsame) VALUES
('mario.rossi', 1, '2022-01-25 12:20:34', 'NON IDONEO'),
('mario.rossi', 2, '2022-01-25 14:30:35', 'NON IDONEO'),
('andrea.bianchi', 1, '2019-12-10 15:59:10', 'IDONEO'),
('demo', 1, '2018-12-10 18:40:09', 'IDONEO'),
('demo', 2, '2018-12-10 18:40:09', 'IDONEO'),
('demo', 1, '2019-12-10 18:40:09', 'NON IDONEO'),
('demo', 2, '2020-12-10 18:40:09', 'IDONEO'),
('demo', 3, '2020-12-10 18:40:09', 'NON VALIDO'),
('demo', 4, '2020-12-10 18:40:09', 'NON VALIDO');