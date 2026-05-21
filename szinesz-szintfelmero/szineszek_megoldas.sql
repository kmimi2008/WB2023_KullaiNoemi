-- ============================================================
-- Filmek és Színészek – Megoldások
-- ============================================================

-- 1. feladat: Az adatbázis importálása
-- A szineszek.sql fájl futtatása a lokális SQL-szerveren.

-- ============================================================
-- 2. feladat: Nem amerikai nemzetiségű színészek
-- Fájlnév: 2nemamerikai.sql
-- ============================================================

SELECT nev
FROM szineszek
WHERE nemzetiseg != 'amerikai'
ORDER BY nev;

-- ============================================================
-- 3. feladat: Vígjáték műfajú filmek
-- Fájlnév: 3vigjatek.sql
-- ============================================================

SELECT cim, megjelenes_eve, rendezo
FROM filmek
WHERE mufaj = 'vígjáték'
ORDER BY megjelenes_eve;

-- ============================================================
-- 4. feladat: Drága jegyárú, újabb filmek (LIMIT)
-- Fájlnév: 4dragaujak.sql
-- ============================================================

SELECT cim, mufaj, megjelenes_eve, jegy_ar
FROM filmek
WHERE jegy_ar > 2500
  AND megjelenes_eve > 2019
ORDER BY jegy_ar DESC, megjelenes_eve DESC
LIMIT 5;

-- ============================================================
-- 5. feladat: Műfajonkénti filmszám
-- Fájlnév: 5mufajok.sql
-- ============================================================

SELECT mufaj, COUNT(*) AS filmek_szama
FROM filmek
GROUP BY mufaj
ORDER BY filmek_szama DESC;

-- ============================================================
-- 6. feladat: Christopher Nolan filmjeinek szereplői
--             (háromtáblás INNER JOIN)
-- Fájlnév: 6nolan.sql
-- ============================================================

SELECT sz.nev, sz.nemzetiseg, f.cim AS film_cim,
       s.szerepnev, s.foszerep
FROM szerepek s
INNER JOIN szineszek sz ON s.szineszid = sz.id
INNER JOIN filmek    f  ON s.filmid    = f.id
WHERE f.rendezo = 'Christopher Nolan'
ORDER BY f.cim, s.foszerep DESC, sz.nev;

-- ============================================================
-- 7. feladat: Filmek, amelyekhez még nem rögzítettek
--             szereposztást (LEFT JOIN)
-- Fájlnév: 7szerepnelkul.sql
-- ============================================================

SELECT f.cim, f.megjelenes_eve, f.mufaj, f.rendezo
FROM filmek f
LEFT JOIN szerepek s ON f.id = s.filmid
WHERE s.id IS NULL
ORDER BY f.megjelenes_eve;

-- ============================================================
-- 8. feladat: Cillian Murphy-vel azonos nemzetiségű
--             más színészek (beágyazott lekérdezés)
-- Fájlnév: 8irek.sql
-- ============================================================

SELECT nev, szuletesi_ev
FROM szineszek
WHERE nemzetiseg = (
    SELECT nemzetiseg
    FROM szineszek
    WHERE nev = 'Cillian Murphy'
)
  AND nev != 'Cillian Murphy'
ORDER BY nev;

-- ============================================================
-- 9. feladat: Denis Villeneuve rendező nevének frissítése
-- Fájlnév: 9update.sql
-- ============================================================

UPDATE filmek
SET rendezo = 'Denis Villeneuve-Tremblay'
WHERE rendezo = 'Denis Villeneuve';

-- ============================================================
-- 10. feladat: Mellékszerepek törlése
-- Fájlnév: 10delete.sql
-- ============================================================

DELETE FROM szerepek
WHERE foszerep = 0;

-- ============================================================
-- 11. feladat: A legtöbb filmben szereplő színészek
--              (INNER JOIN, GROUP BY, HAVING)
-- Fájlnév: 11nepszeruek.sql
-- ============================================================

SELECT sz.nev, sz.nemzetiseg,
       COUNT(DISTINCT s.filmid) AS filmek_szama
FROM szerepek s
INNER JOIN szineszek sz ON s.szineszid = sz.id
GROUP BY sz.nev, sz.nemzetiseg
HAVING filmek_szama > 1
ORDER BY filmek_szama DESC, sz.nev;
