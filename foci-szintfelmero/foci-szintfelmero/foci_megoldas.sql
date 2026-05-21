-- ============================================================
-- Labdarúgó-bajnokság – Megoldások
-- ============================================================

-- 1. feladat: Az adatbázis importálása
-- A foci.sql fájl futtatása a lokális SQL-szerveren.

-- ============================================================
-- 2. feladat: Nem Ferencváros TC-ben játszó játékosok
-- Fájlnév: 2nemferenc.sql
-- ============================================================

SELECT nev
FROM jatekosok
WHERE csapat != 'Ferencváros TC'
ORDER BY nev;

-- ============================================================
-- 3. feladat: Groupama Aréna – legalább 20 000 nézős meccsek
-- Fájlnév: 3groupama.sql
-- ============================================================

SELECT datum, hazai_csapat, vendeg_csapat, nezoszam
FROM merkozesek
WHERE helyszin = 'Groupama Aréna'
  AND nezoszam >= 20000
ORDER BY nezoszam DESC;

-- ============================================================
-- 4. feladat: Legalább 28 éves csatárok és középpályások
-- Fájlnév: 4vetorek.sql
-- ============================================================

SELECT nev, csapat, poszt, kor
FROM jatekosok
WHERE kor >= 28
  AND poszt IN ('csatár', 'középpályás')
ORDER BY kor DESC, nev
LIMIT 10;

-- ============================================================
-- 5. feladat: Csapatonkénti játékoslétszám (top 3)
-- Fájlnév: 5csapatok.sql
-- ============================================================

SELECT csapat, COUNT(*) AS jatekosok_szama
FROM jatekosok
GROUP BY csapat
ORDER BY jatekosok_szama DESC
LIMIT 3;

-- ============================================================
-- 6. feladat: Gólszerzők ranglistája (INNER JOIN, HAVING, LIMIT)
-- Fájlnév: 6golranglista.sql
-- ============================================================

SELECT j.nev, j.csapat,
       COUNT(g.id) AS golok_szama
FROM golelozmenyek g
INNER JOIN jatekosok j ON g.jatekosid = j.id
GROUP BY j.nev, j.csapat
HAVING golok_szama >= 2
ORDER BY golok_szama DESC, j.nev
LIMIT 5;

-- ============================================================
-- 7. feladat: Játékosok, akik még sosem szerepeltek
--             a gólszerzők között (LEFT JOIN)
-- Fájlnév: 7sohanemgol.sql
-- ============================================================

SELECT j.nev, j.csapat, j.poszt
FROM jatekosok j
LEFT JOIN golelozmenyek g ON j.id = g.jatekosid
WHERE g.id IS NULL
ORDER BY j.csapat, j.nev;

-- ============================================================
-- 8. feladat: Dzsudzsák Balázs csapattársai (beágyazott lekérdezés)
-- Fájlnév: 8csapattarsak.sql
-- ============================================================

SELECT nev
FROM jatekosok
WHERE csapat = (
    SELECT csapat
    FROM jatekosok
    WHERE nev = 'Dzsudzsák Balázs'
)
  AND nev != 'Dzsudzsák Balázs'
ORDER BY nev;

-- ============================================================
-- 9. feladat: A Győri ETO FC csapatnév frissítése
-- Fájlnév: 9update.sql
-- ============================================================

UPDATE jatekosok
SET csapat = 'ETO FC Győr'
WHERE csapat = 'Győri ETO FC';

-- ============================================================
-- 10. feladat: Öngólok törlése a golelozmenyek táblából
-- Fájlnév: 10delete.sql
-- ============================================================

DELETE FROM golelozmenyek
WHERE tipus = 'öngól';

-- ============================================================
-- 11. feladat: 2029-04-12-i Ferencváros TC hazai meccs
--              góleseményei (háromtáblás INNER JOIN)
-- Fájlnév: 11golelozmenyek.sql
-- ============================================================

SELECT j.nev, j.csapat, g.perc, g.tipus
FROM golelozmenyek g
INNER JOIN jatekosok j  ON g.jatekosid  = j.id
INNER JOIN merkozesek m ON g.merkozesid = m.id
WHERE m.hazai_csapat = 'Ferencváros TC'
  AND m.datum        = '2029-04-12'
ORDER BY g.perc;
