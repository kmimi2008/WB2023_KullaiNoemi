DROP DATABASE IF EXISTS `konyvtar`;
CREATE DATABASE IF NOT EXISTS `konyvtar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `konyvtar`;

-- ============================================================
-- TÁBLÁK LÉTREHOZÁSA
-- ============================================================

CREATE TABLE `konyvek` (
  `id`        INT          NOT NULL,
  `cim`       VARCHAR(100) NOT NULL,
  `szerzo`    VARCHAR(60)  NOT NULL,
  `kategoria` VARCHAR(30)  NOT NULL,
  `kiadas_ev` INT          NOT NULL,
  `oldalszam` INT          NOT NULL,
  `ar`        INT          NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

CREATE TABLE `olvasok` (
  `id`              INT         NOT NULL,
  `nev`             VARCHAR(60) NOT NULL,
  `varos`           VARCHAR(40) NOT NULL,
  `kor`             INT         NOT NULL,
  `foglalkozas`     VARCHAR(30) NOT NULL,
  `regisztracio_ev` INT         NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

CREATE TABLE `kolcsonzesek` (
  `id`             INT         NOT NULL,
  `konyvid`        INT         NOT NULL,
  `olvasoid`       INT         NOT NULL,
  `kezdes_datum`   DATE        NOT NULL,
  `hatarido_datum` DATE        NOT NULL,
  `allapot`        VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- ============================================================
-- ADATOK – konyvek
-- kategoria: 'szépirodalom' | 'krimi' | 'sci-fi' | 'fantasy'
--          | 'gyermek' | 'ismeretterjesztő' | 'történelem'
-- ============================================================

INSERT INTO `konyvek` (`id`, `cim`, `szerzo`, `kategoria`, `kiadas_ev`, `oldalszam`, `ar`) VALUES
(1,  'Légy jó mindhalálig',              'Móricz Zsigmond',           'szépirodalom',     1920, 320, 3200),
(2,  'Az arany ember',                   'Jókai Mór',                 'szépirodalom',     1872, 480, 4500),
(3,  'Szent Péter esernyője',            'Mikszáth Kálmán',           'szépirodalom',     1895, 280, 3000),
(4,  'Egri csillagok',                   'Gárdonyi Géza',             'történelem',       1899, 540, 4900),
(5,  'János vitéz',                      'Petőfi Sándor',             'szépirodalom',     1845, 120, 1800),
(6,  'A kőszívű ember fiai',             'Jókai Mór',                 'szépirodalom',     1869, 560, 5100),
(7,  'Szindbád',                         'Krúdy Gyula',               'szépirodalom',     1925, 220, 2800),
(8,  'A néhai bárány',                   'Mikszáth Kálmán',           'szépirodalom',     1888, 180, 2500),
(9,  'Piszkos Fred, a kapitány',         'Rejtő Jenő',                'krimi',            1940, 240, 2900),
(10, 'Gyilkosság az Orient expresszen',  'Agatha Christie',           'krimi',            1934, 320, 3500),
(11, 'Sherlock Holmes kalandjai',        'Arthur Conan Doyle',        'krimi',            1902, 280, 3300),
(12, 'A láthatatlan légió',              'Rejtő Jenő',                'krimi',            1938, 220, 2800),
(13, 'Tíz kicsi néger',                  'Agatha Christie',           'krimi',            1939, 290, 3400),
(14, 'Régészet a halálban',              'Patricia Cornwell',         'krimi',            2010, 400, 4800),
(15, 'A ragyogás',                       'Stephen King',              'krimi',            1977, 660, 5500),
(16, 'Alapítvány',                       'Isaac Asimov',              'sci-fi',           1951, 280, 3800),
(17, 'Dűne',                             'Frank Herbert',             'sci-fi',           1965, 720, 6800),
(18, '2001 Űrodüsszeia',                 'Arthur C. Clarke',          'sci-fi',           1968, 340, 4300),
(19, 'Én, a robot',                      'Isaac Asimov',              'sci-fi',           1950, 220, 3400),
(20, 'Solaris',                          'Stanislaw Lem',             'sci-fi',           1961, 260, 3500),
(21, 'A marsi',                          'Andy Weir',                 'sci-fi',           2011, 480, 4900),
(22, 'A Gyűrűk Ura',                     'J.R.R. Tolkien',            'fantasy',          1954, 1200, 9500),
(23, 'A hobbit',                         'J.R.R. Tolkien',            'fantasy',          1937, 320, 3900),
(24, 'Narnia krónikái',                  'C.S. Lewis',                'fantasy',          1950, 580, 5200),
(25, 'A Szigetvilág varázslója',         'Ursula K. Le Guin',         'fantasy',          1968, 300, 4100),
(26, 'Korongvilág',                      'Terry Pratchett',           'fantasy',          1983, 280, 3800),
(27, 'Az idő kereke',                    'Robert Jordan',             'fantasy',          1990, 800, 7200),
(28, 'Alice Csodaországban',             'Lewis Carroll',             'gyermek',          1865, 140, 2100),
(29, 'A kis herceg',                     'Antoine de Saint-Exupéry',  'gyermek',          1943, 100, 1900),
(30, 'Harisnyás Pippi',                  'Astrid Lindgren',           'gyermek',          1945, 160, 2300),
(31, 'Karcsi és a csokigyár',            'Roald Dahl',                'gyermek',          1964, 200, 2600),
(32, 'A két Lotti',                      'Erich Kästner',             'gyermek',          1949, 150, 2200),
(33, 'Sapiens',                          'Yuval Noah Harari',         'ismeretterjesztő', 2011, 480, 5800),
(34, 'Az idő rövid története',           'Stephen Hawking',           'ismeretterjesztő', 1988, 260, 4200),
(35, 'Kozmosz',                          'Carl Sagan',                'ismeretterjesztő', 1980, 380, 4700),
(36, 'Az önző gén',                      'Richard Dawkins',           'ismeretterjesztő', 1976, 360, 4500),
(37, 'A franciák tündöklése és bukása',  'Hahner Péter',              'történelem',       2015, 420, 5400),
(38, 'Magyarország története',           'Romsics Ignác',             'történelem',       2010, 680, 7400),
(39, 'A második világháború',            'Ránki György',              'történelem',       1973, 540, 5100),
(40, 'Magyar középkor',                  'Hóman Bálint',              'történelem',       1938, 480, 4600);

-- ============================================================
-- ADATOK – olvasok
-- foglalkozas: 'diák' | 'tanár' | 'mérnök' | 'orvos' | 'nyugdíjas'
-- ============================================================

INSERT INTO `olvasok` (`id`, `nev`, `varos`, `kor`, `foglalkozas`, `regisztracio_ev`) VALUES
(1,  'Kovács Anna',       'Budapest',  28, 'mérnök',    2018),
(2,  'Nagy Péter',        'Debrecen',  45, 'tanár',     2010),
(3,  'Szabó Eszter',      'Budapest',  22, 'diák',      2022),
(4,  'Tóth László',       'Szeged',    67, 'nyugdíjas', 2005),
(5,  'Horváth Júlia',     'Budapest',  35, 'orvos',     2015),
(6,  'Varga Zoltán',      'Pécs',      31, 'mérnök',    2017),
(7,  'Kiss Andrea',       'Győr',      19, 'diák',      2023),
(8,  'Molnár Gábor',      'Budapest',  52, 'tanár',     2008),
(9,  'Németh Katalin',    'Miskolc',   41, 'orvos',     2014),
(10, 'Farkas István',     'Budapest',  25, 'mérnök',    2020),
(11, 'Balogh Réka',       'Debrecen',  38, 'tanár',     2012),
(12, 'Papp Levente',      'Budapest',  17, 'diák',      2024),
(13, 'Takács Mária',      'Szeged',    71, 'nyugdíjas', 2003),
(14, 'Juhász Bence',      'Budapest',  29, 'mérnök',    2019),
(15, 'Mészáros Vera',     'Veszprém',  44, 'orvos',     2013),
(16, 'Oláh Tamás',        'Debrecen',  33, 'tanár',     2016),
(17, 'Simon Dóra',        'Budapest',  23, 'diák',      2022),
(18, 'Fekete Bálint',     'Pécs',      48, 'mérnök',    2011),
(19, 'Lakatos Ágnes',     'Budapest',  56, 'tanár',     2007),
(20, 'Király Norbert',    'Szeged',    62, 'nyugdíjas', 2006),
(21, 'Pintér Zsuzsa',     'Debrecen',  27, 'mérnök',    2020),
(22, 'Fodor Krisztina',   'Győr',      39, 'orvos',     2015),
(23, 'Lukács Márton',     'Budapest',  21, 'diák',      2023),
(24, 'Bognár Eszter',     'Eger',      46, 'tanár',     2012),
(25, 'Hegedűs Dániel',    'Budapest',  32, 'mérnök',    2017),
(26, 'Szücs Petra',       'Miskolc',   18, 'diák',      2024),
(27, 'Polák Tibor',       'Budapest',  73, 'nyugdíjas', 2004),
(28, 'Antal Edina',       'Pécs',      36, 'orvos',     2016),
(29, 'Borsos Ákos',       'Budapest',  26, 'mérnök',    2021),
(30, 'Csikós Judit',      'Debrecen',  50, 'tanár',     2009);

-- ============================================================
-- ADATOK – kolcsonzesek
-- allapot: 'visszahozva' | 'késik' | 'aktív'
-- ============================================================

INSERT INTO `kolcsonzesek`
  (`id`, `konyvid`, `olvasoid`, `kezdes_datum`, `hatarido_datum`, `allapot`) VALUES
-- visszahozva
(1,   1,  1, '2024-09-15', '2024-10-15', 'visszahozva'),
(2,   5,  2, '2024-10-20', '2024-11-20', 'visszahozva'),
(3,  22,  3, '2024-11-01', '2024-12-01', 'visszahozva'),
(4,  16,  5, '2025-01-10', '2025-02-10', 'visszahozva'),
(5,  28,  7, '2025-02-15', '2025-03-15', 'visszahozva'),
(6,  33,  9, '2025-03-01', '2025-04-01', 'visszahozva'),
(7,  17,  1, '2025-04-05', '2025-05-05', 'visszahozva'),
(8,   4, 11, '2025-05-12', '2025-06-12', 'visszahozva'),
(9,  10,  6, '2025-06-01', '2025-07-01', 'visszahozva'),
(10, 22, 14, '2025-07-08', '2025-08-08', 'visszahozva'),
(11, 29, 17, '2025-08-15', '2025-09-15', 'visszahozva'),
(12, 13, 19, '2025-09-20', '2025-10-20', 'visszahozva'),
(13, 38,  2, '2025-10-05', '2025-11-05', 'visszahozva'),
(14,  9, 13, '2025-11-10', '2025-12-10', 'visszahozva'),
(15, 25, 22, '2026-01-05', '2026-02-05', 'visszahozva'),
(16, 11,  8, '2026-01-15', '2026-02-15', 'visszahozva'),
(17, 34,  5, '2026-02-01', '2026-03-01', 'visszahozva'),
-- késik
(18, 21, 23, '2026-02-20', '2026-03-20', 'késik'),
(19, 30, 11, '2026-03-01', '2026-04-01', 'késik'),
(20,  7, 18, '2026-03-10', '2026-04-10', 'késik'),
(21, 16, 14, '2026-03-15', '2026-04-15', 'késik'),
(22, 22, 25, '2026-03-20', '2026-04-20', 'késik'),
(23, 17,  3, '2026-04-01', '2026-05-01', 'késik'),
(24, 33,  6, '2026-04-05', '2026-05-05', 'késik'),
(25, 26, 17, '2026-04-08', '2026-05-08', 'késik'),
(26, 36, 19, '2026-04-10', '2026-05-10', 'késik'),
-- aktív
(27, 12, 21, '2026-04-12', '2026-05-12', 'aktív'),
(28, 14, 23, '2026-04-15', '2026-05-15', 'aktív'),
(29, 35,  8, '2026-04-18', '2026-05-18', 'aktív'),
(30, 24, 29, '2026-04-20', '2026-05-20', 'aktív'),
(31, 22,  1, '2026-04-22', '2026-05-22', 'aktív'),
(32, 27, 11, '2026-04-25', '2026-05-25', 'aktív'),
(33, 24,  7, '2026-04-28', '2026-05-28', 'aktív'),
(34, 18, 14, '2026-05-01', '2026-06-01', 'aktív'),
(35,  1, 19, '2026-05-02', '2026-06-02', 'aktív'),
(36, 20, 24, '2026-05-03', '2026-06-03', 'aktív'),
(37, 13, 25, '2026-05-04', '2026-06-04', 'aktív'),
(38, 37,  8, '2026-05-05', '2026-06-05', 'aktív'),
(39, 23, 30, '2026-05-06', '2026-06-06', 'aktív'),
(40, 15, 22, '2026-05-07', '2026-06-07', 'aktív'),
(41,  3, 17, '2026-05-08', '2026-06-08', 'aktív'),
(42, 34, 28, '2026-05-09', '2026-06-09', 'aktív'),
(43, 16,  1, '2026-05-09', '2026-06-09', 'aktív'),
(44, 32, 26, '2026-05-10', '2026-06-10', 'aktív'),
(45, 11, 13, '2026-05-10', '2026-06-10', 'aktív');

-- ============================================================
-- KULCSOK ÉS KÉNYSZERFELTÉTELEK
-- ============================================================

ALTER TABLE `konyvek`  ADD PRIMARY KEY (`id`);
ALTER TABLE `olvasok`  ADD PRIMARY KEY (`id`);
ALTER TABLE `kolcsonzesek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konyvid`  (`konyvid`),
  ADD KEY `olvasoid` (`olvasoid`);

ALTER TABLE `kolcsonzesek`
  ADD CONSTRAINT `kolcs_ibfk_1` FOREIGN KEY (`konyvid`)  REFERENCES `konyvek`  (`id`),
  ADD CONSTRAINT `kolcs_ibfk_2` FOREIGN KEY (`olvasoid`) REFERENCES `olvasok`  (`id`);
