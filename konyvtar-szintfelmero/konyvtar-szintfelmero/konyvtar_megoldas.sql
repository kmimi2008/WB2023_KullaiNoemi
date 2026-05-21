-- ============================================================
-- Könyvtári nyilvántartás – Megoldások
-- ============================================================

-- 1. feladat: Az adatbázis importálása
-- A konyvtar.sql fájl futtatása a lokális SQL-szerveren.

-- ============================================================
-- 2. feladat: Krimi könyvek listája
-- Fájlnév: 2krimi.sql
-- ============================================================

SELECT cim, szerzo, kiadas_ev
FROM konyvek
WHERE kategoria = 'krimi'
ORDER BY kiadas_ev DESC, cim;

-- ============================================================
-- 3. feladat: Budapesti olvasók életkor szerint csökkenően
-- Fájlnév: 3budapest.sql
-- ============================================================

SELECT nev, kor, foglalkozas
FROM olvasok
WHERE varos = 'Budapest'
ORDER BY kor DESC;

-- ============================================================
-- 4. feladat: Az átlagosnál hosszabb könyvek (beágyazott lekérdezés)
-- Fájlnév: 4hosszu.sql
-- ============================================================

SELECT cim, szerzo, oldalszam
FROM konyvek
WHERE oldalszam > (SELECT AVG(oldalszam) FROM konyvek)
ORDER BY oldalszam DESC;

-- ============================================================
-- 5. feladat: 1950 előtt vagy 2010 után kiadott könyvek
-- Fájlnév: 5regiek.sql
-- ============================================================

SELECT cim, szerzo, kategoria, kiadas_ev
FROM konyvek
WHERE kiadas_ev < 1950 OR kiadas_ev > 2010
ORDER BY kiadas_ev, cim;

-- ============================================================
-- 6. feladat: Idős tanárok vagy fiatal diákok
-- Fájlnév: 6tanardiak.sql
-- ============================================================

SELECT nev, varos, foglalkozas, kor
FROM olvasok
WHERE (foglalkozas = 'tanár' AND kor > 40)
   OR (foglalkozas = 'diák'  AND kor < 22)
ORDER BY kor;

-- ============================================================
-- 7. feladat: Az átlagárnál drágább, nem gyermek könyvek
--             (beágyazott lekérdezés)
-- Fájlnév: 7dragabb.sql
-- ============================================================

SELECT cim, szerzo, kategoria, ar
FROM konyvek
WHERE ar > (SELECT AVG(ar) FROM konyvek)
  AND kategoria != 'gyermek'
ORDER BY ar DESC;

-- ============================================================
-- 8. feladat: „M" betűvel kezdődő nevű szerzők könyvei
-- Fájlnév: 8szerzobetu.sql
-- ============================================================

SELECT cim, szerzo
FROM konyvek
WHERE szerzo LIKE 'M%'
ORDER BY szerzo, cim;

-- ============================================================
-- 9. feladat: A 5 legdrágább könyv
-- Fájlnév: 9top5.sql
-- ============================================================

SELECT cim, szerzo, ar
FROM konyvek
ORDER BY ar DESC
LIMIT 5;

-- ============================================================
-- 10. feladat: Oldalszám szerint csökkenő sorrend, első 3 kihagyva
-- Fájlnév: 10kihagy.sql
-- ============================================================

SELECT cim, szerzo, oldalszam
FROM konyvek
ORDER BY oldalszam DESC
LIMIT 5 OFFSET 3;

-- ============================================================
-- 11. feladat: Késő vagy határidőhöz közeli aktív kölcsönzések
-- Fájlnév: 11kesik.sql
-- ============================================================

SELECT id, konyvid, olvasoid, kezdes_datum, hatarido_datum, allapot
FROM kolcsonzesek
WHERE allapot = 'késik'
   OR (allapot = 'aktív' AND hatarido_datum < '2026-05-15')
ORDER BY hatarido_datum;

-- ============================================================
-- 12. feladat: Könyvek száma kategóriánként
-- Fájlnév: 12kategorialet.sql
-- ============================================================

SELECT kategoria, COUNT(*) AS konyvek_szama
FROM konyvek
GROUP BY kategoria
ORDER BY konyvek_szama DESC, kategoria;

-- ============================================================
-- 13. feladat: Top 3 város olvasószám szerint
-- Fájlnév: 13varostop.sql
-- ============================================================

SELECT varos, COUNT(*) AS olvasok_szama
FROM olvasok
GROUP BY varos
ORDER BY olvasok_szama DESC
LIMIT 3;

-- ============================================================
-- 14. feladat: Átlagár kategóriánként
-- Fájlnév: 14atlagar.sql
-- ============================================================

SELECT kategoria, AVG(ar) AS atlag_ar
FROM konyvek
GROUP BY kategoria
ORDER BY atlag_ar DESC;

-- ============================================================
-- 15. feladat: Több könyvvel és magasabb átlagárral szereplő szerzők
-- Fájlnév: 15tobbkonyv.sql
-- ============================================================

SELECT szerzo, COUNT(*) AS konyvek_szama, AVG(ar) AS atlag_ar
FROM konyvek
GROUP BY szerzo
HAVING COUNT(*) >= 2 AND AVG(ar) > 3500
ORDER BY konyvek_szama DESC, szerzo;

-- ============================================================
-- 16. feladat: Sok olvasójú vagy fiatal átlagéletkorú városok
-- Fájlnév: 16varostobb.sql
-- ============================================================

SELECT varos, COUNT(*) AS olvasok_szama, AVG(kor) AS atlag_kor
FROM olvasok
GROUP BY varos
HAVING COUNT(*) >= 3 OR AVG(kor) < 30
ORDER BY olvasok_szama DESC, varos;

-- ============================================================
-- 17. feladat: Évek, amikor több, és köztük vastag könyv jelent meg
-- Fájlnév: 17evtobb.sql
-- ============================================================

SELECT kiadas_ev, COUNT(*) AS konyvek_szama, MAX(oldalszam) AS leghosszabb
FROM konyvek
GROUP BY kiadas_ev
HAVING COUNT(*) >= 2 AND MAX(oldalszam) > 400
ORDER BY kiadas_ev;

-- ============================================================
-- 18. feladat: 2026.05.01–2026.05.10 közötti kölcsönzések
--             részletes listája (háromtáblás INNER JOIN)
-- Fájlnév: 18kolcsonlista.sql
-- ============================================================

SELECT k.cim, o.nev, kol.kezdes_datum, kol.allapot
FROM kolcsonzesek kol
INNER JOIN konyvek k ON kol.konyvid  = k.id
INNER JOIN olvasok o ON kol.olvasoid = o.id
WHERE kol.kezdes_datum BETWEEN '2026-05-01' AND '2026-05-10'
ORDER BY kol.kezdes_datum, k.cim;

-- ============================================================
-- 19. feladat: „Kovács Anna" által kölcsönzött könyvek
--              (háromtáblás INNER JOIN)
-- Fájlnév: 19anna.sql
-- ============================================================

SELECT k.cim, k.szerzo, kol.kezdes_datum, kol.allapot
FROM kolcsonzesek kol
INNER JOIN konyvek k ON kol.konyvid  = k.id
INNER JOIN olvasok o ON kol.olvasoid = o.id
WHERE o.nev = 'Kovács Anna'
ORDER BY kol.kezdes_datum;

-- ============================================================
-- 20. feladat: A 3 legnépszerűbb kategória a kölcsönzések alapján
-- Fájlnév: 20nepszerukat.sql
-- ============================================================

SELECT k.kategoria, COUNT(*) AS kolcsonzesek_szama
FROM kolcsonzesek kol
INNER JOIN konyvek k ON kol.konyvid = k.id
GROUP BY k.kategoria
ORDER BY kolcsonzesek_szama DESC, k.kategoria
LIMIT 3;

-- ============================================================
-- 21. feladat: Olvasók, akik még sosem kölcsönöztek (LEFT JOIN)
-- Fájlnév: 21sosemolvas.sql
-- ============================================================

SELECT o.nev, o.varos, o.foglalkozas
FROM olvasok o
LEFT JOIN kolcsonzesek kol ON o.id = kol.olvasoid
WHERE kol.id IS NULL
ORDER BY o.varos, o.nev;

-- ============================================================
-- 22. feladat: Könyvek, amelyeket még sosem kölcsönöztek (LEFT JOIN)
-- Fájlnév: 22sosemkonyv.sql
-- ============================================================

SELECT k.cim, k.szerzo, k.kategoria
FROM konyvek k
LEFT JOIN kolcsonzesek kol ON k.id = kol.konyvid
WHERE kol.id IS NULL
ORDER BY k.kategoria, k.cim;

-- ============================================================
-- 23. feladat: „ismeretterjesztő" kategória átnevezése
-- Fájlnév: 23update1.sql
-- ============================================================

UPDATE konyvek
SET kategoria = 'tudomány'
WHERE kategoria = 'ismeretterjesztő';

-- ============================================================
-- 24. feladat: 1970 előtti könyvek árának 10%-os emelése
-- Fájlnév: 24update2.sql
-- ============================================================

UPDATE konyvek
SET ar = ROUND(ar * 1.1)
WHERE kiadas_ev < 1970;

-- ============================================================
-- 25. feladat: Régi, visszahozott kölcsönzések törlése
-- Fájlnév: 25delete.sql
-- ============================================================

DELETE FROM kolcsonzesek
WHERE allapot = 'visszahozva'
  AND kezdes_datum < '2025-06-01';
