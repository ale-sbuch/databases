/* 1. Selezionare username, nome, cognome,
data di nascita delle persone, esclusi i docenti */

SELECT username, nome, cognome, dataNascita
FROM Utente
WHERE docente = 0 AND ospite = 0

/* 2. Selezionare username, nome, cognome,
nome della commissione e ruolo ricoperto dalle persone
che appartengono attualmente ad una commissione */

SELECT Utente.username, Utente.nome, Utente.cognome,
  Commissione.nome, Appartiene.ruolo
FROM Utente, Appartiene, Commissione
WHERE Utente.ospite = 0 AND
  Utente.username = Appartiene.utente AND
  Appartiene.commissione = Commissione.id AND
  Appartiene.dataFine IS NULL

/* 3. Contare il numero di esami per ogni regolamento */

SELECT Esame.regolamento, COUNT(*)
FROM Esame
GROUP BY regolamento

/* 4. Selezionare le persone che non hanno mai sostenuto un esame */

SELECT username, nome, cognome, dataNascita
FROM Utente
WHERE username NOT IN (
  SELECT utente FROM Sostiene GROUP BY utente)

/* 5. Creare una vista con tutte le domande e risposte del
regolamento più recente redatto dalla commissione 'FIJLKAM_KA' */

CREATE VIEW SoluzioniEsame (id, testoDomanda, rispostaCorretta) AS
  SELECT id, testoDomanda, rispostaCorretta
  FROM Domanda
  WHERE regolamento = (
    SELECT id
    FROM Regolamento
    WHERE dataDiEntrataInVigore = (
      SELECT MAX(dataDiEntrataInVigore)
      FROM Regolamento
      WHERE commissione = 'FIJLKAM_KA') AND
        commissione = 'FIJLKAM_KA')