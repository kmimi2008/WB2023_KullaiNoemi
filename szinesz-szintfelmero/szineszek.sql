DROP DATABASE IF EXISTS `szineszek`;
CREATE DATABASE IF NOT EXISTS `szineszek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `szineszek`;

-- ============================================================
-- TÁBLÁK LÉTREHOZÁSA
-- ============================================================

CREATE TABLE `szineszek` (
  `id`           INT         NOT NULL,
  `nev`          VARCHAR(80) NOT NULL,
  `szuletesi_ev` INT         NOT NULL,
  `nemzetiseg`   VARCHAR(30) NOT NULL,
  `nem`          VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

CREATE TABLE `filmek` (
  `id`             INT          NOT NULL,
  `cim`            VARCHAR(100) NOT NULL,
  `megjelenes_eve` INT          NOT NULL,
  `mufaj`          VARCHAR(30)  NOT NULL,
  `rendezo`        VARCHAR(80)  NOT NULL,
  `jegy_ar`        INT          NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

CREATE TABLE `szerepek` (
  `id`         INT         NOT NULL,
  `filmid`     INT         NOT NULL,
  `szineszid`  INT         NOT NULL,
  `szerepnev`  VARCHAR(80) NOT NULL,
  `foszerep`   TINYINT(1)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- ============================================================
-- ADATOK – szineszek
-- nem: 'férfi' | 'nő'
-- nemzetiseg: 'amerikai' | 'brit' | 'ausztrál' | 'francia' | 'magyar' | 'ír' | 'dán'
-- ============================================================

INSERT INTO `szineszek` (`id`, `nev`, `szuletesi_ev`, `nemzetiseg`, `nem`) VALUES
(1,  'Tom Hanks',         1956, 'amerikai', 'férfi'),
(2,  'Meryl Streep',      1949, 'amerikai', 'nő'),
(3,  'Leonardo DiCaprio', 1974, 'amerikai', 'férfi'),
(4,  'Cate Blanchett',    1969, 'ausztrál',  'nő'),
(5,  'Anthony Hopkins',   1937, 'brit',      'férfi'),
(6,  'Emma Thompson',     1959, 'brit',      'nő'),
(7,  'Mads Mikkelsen',    1965, 'dán',       'férfi'),
(8,  'Marion Cotillard',  1975, 'francia',   'nő'),
(9,  'Russell Crowe',     1964, 'ausztrál',  'férfi'),
(10, 'Keira Knightley',   1985, 'brit',      'nő'),
(11, 'Christian Bale',    1974, 'brit',      'férfi'),
(12, 'Charlize Theron',   1975, 'amerikai',  'nő'),
(13, 'Viggo Mortensen',   1958, 'amerikai',  'férfi'),
(14, 'Natalie Portman',   1981, 'amerikai',  'nő'),
(15, 'Jude Law',          1972, 'brit',      'férfi'),
(16, 'Juliette Binoche',  1964, 'francia',   'nő'),
(17, 'Matt Damon',        1970, 'amerikai',  'férfi'),
(18, 'Kate Winslet',      1975, 'brit',      'nő'),
(19, 'Joaquin Phoenix',   1974, 'amerikai',  'férfi'),
(20, 'Tilda Swinton',     1960, 'brit',      'nő'),
(21, 'Brad Pitt',         1963, 'amerikai',  'férfi'),
(22, 'Cillian Murphy',    1976, 'ír',        'férfi'),
(23, 'Florence Pugh',     1996, 'brit',      'nő'),
(24, 'Timothée Chalamet', 2000, 'amerikai',  'férfi'),
(25, 'Ana de Armas',      1988, 'amerikai',  'nő'),
(26, 'Jonathan Pryce',    1947, 'brit',      'férfi'),
(27, 'Saoirse Ronan',     1994, 'ír',        'nő'),
(28, 'Adam Driver',       1983, 'amerikai',  'férfi'),
(29, 'Zendaya',           1996, 'amerikai',  'nő'),
(30, 'Paul Mescal',       1996, 'ír',        'férfi');

-- ============================================================
-- ADATOK – filmek
-- mufaj: 'dráma' | 'vígjáték' | 'thriller' | 'akció' | 'sci-fi' | 'életrajzi' | 'romantikus'
-- Megjegyzés: id 21–22 szándékosan nem kapnak szereposztást (LEFT JOIN feladathoz)
-- ============================================================

INSERT INTO `filmek` (`id`, `cim`, `megjelenes_eve`, `mufaj`, `rendezo`, `jegy_ar`) VALUES
(1,  'Forrest Gump',                   1994, 'dráma',      'Robert Zemeckis',   1800),
(2,  'A zongorista',                   1993, 'dráma',      'Jane Campion',       1700),
(3,  'A harc klubja',                  1999, 'thriller',   'David Fincher',      2100),
(4,  'Gladiátor',                      2000, 'akció',      'Ridley Scott',       2000),
(5,  'Inception',                      2010, 'sci-fi',     'Christopher Nolan',  2400),
(6,  'A remény rabjai',                1994, 'dráma',      'Frank Darabont',     1900),
(7,  'Testőr',                         1985, 'thriller',   'Kevin Reynolds',     1500),
(8,  'Oppenheimer',                    2023, 'életrajzi',  'Christopher Nolan',  3200),
(9,  'Dűne',                           2021, 'sci-fi',     'Denis Villeneuve',   3000),
(10, 'Dűne: Második rész',             2024, 'sci-fi',     'Denis Villeneuve',   3200),
(11, 'Tár',                            2022, 'dráma',      'Todd Field',         2600),
(12, 'Titanic',                        1997, 'dráma',      'James Cameron',      2000),
(13, 'Joker',                          2019, 'thriller',   'Todd Phillips',      2800),
(14, 'Past Lives',                     2023, 'romantikus', 'Celine Song',        2500),
(15, 'A zöld könyv',                   2018, 'vígjáték',   'Peter Farrelly',     2300),
(16, 'Nyomorultak',                    2012, 'dráma',      'Tom Hooper',         2100),
(17, 'Barbie',                         2023, 'vígjáték',   'Greta Gerwig',       3100),
(18, 'A sötét lovag',                  2008, 'akció',      'Christopher Nolan',  2900),
(19, 'Kis nők',                        2019, 'romantikus', 'Greta Gerwig',       2400),
(20, 'Aftersun',                       2022, 'dráma',      'Charlotte Wells',    2200),
-- Szereposztás nélküli filmek (LEFT JOIN feladathoz):
(21, 'A nagy Lebowski',                1998, 'vígjáték',   'Joel Coen',          1600),
(22, 'Szegény párák',                  2023, 'sci-fi',     'Yorgos Lanthimos',   2700);

-- ============================================================
-- ADATOK – szerepek
-- foszerep: 1 = főszerep, 0 = mellékszerep
-- ============================================================

INSERT INTO `szerepek` (`id`, `filmid`, `szineszid`, `szerepnev`, `foszerep`) VALUES
-- Forrest Gump (1)
(1,  1,  1,  'Forrest Gump',                  1),
(2,  1,  2,  'Mrs. Gump',                     0),
-- A zongorista (2)
(3,  2,  4,  'Ada McGrath',                   1),
-- A harc klubja (3)
(4,  3, 13,  'Elbeszélő',                     1),
(5,  3, 11,  'Tyler Durden',                  1),
-- Gladiátor (4)
(6,  4,  9,  'Maximus',                       1),
(7,  4,  5,  'Marcus Aurelius',               0),
(8,  4, 26,  'Proximo',                       0),
-- Inception (5)
(9,  5,  3,  'Dom Cobb',                      1),
(10, 5, 10,  'Ariadne',                       0),
(11, 5, 17,  'Arthur',                        0),
-- A remény rabjai (6)
(12, 6,  1,  'Andy Dufresne',                 1),
(13, 6, 26,  'Warden Norton',                 0),
-- Testőr (7)
(14, 7, 15,  'Frank Farmer',                  1),
-- Oppenheimer (8)
(15, 8, 22,  'J. Robert Oppenheimer',         1),
(16, 8, 21,  'Leslie Groves tábornok',        0),
(17, 8, 17,  'Ernest Lawrence',               0),
(18, 8, 23,  'Jean Tatlock',                  0),
-- Dűne (9)
(19, 9, 24,  'Paul Atreides',                 1),
(20, 9,  8,  'Lady Jessica',                  0),
(21, 9, 11,  'Gurney Halleck',                0),
(22, 9, 20,  'Főanya',                        0),
-- Dűne: Második rész (10)
(23, 10, 24, 'Paul Atreides',                 1),
(24, 10, 29, 'Chani',                         1),
(25, 10, 11, 'Feyd-Rautha',                   0),
(26, 10,  8, 'Lady Jessica',                  0),
-- Tár (11)
(27, 11, 20, 'Lydia Tár',                     1),
-- Titanic (12)
(28, 12,  3, 'Jack Dawson',                   1),
(29, 12, 18, 'Rose DeWitt Bukater',           1),
-- Joker (13)
(30, 13, 19, 'Arthur Fleck / Joker',          1),
(31, 13, 28, 'Harvey Dent',                   0),
-- Past Lives (14)
(32, 14, 30, 'Hae Sung',                      1),
-- A zöld könyv (15)
(33, 15,  1, 'Frank Vallelonga',              1),
(34, 15, 21, 'Dr. Donald Shirley',            1),
-- Nyomorultak (16)
(35, 16, 14, 'Fantine',                       1),
(36, 16,  6, 'Mrs. Thénardier',               0),
-- Barbie (17)
(37, 17, 29, 'Barbie',                        1),
(38, 17, 25, 'Gloria',                        0),
-- A sötét lovag (18)
(39, 18, 11, 'Bruce Wayne / Batman',          1),
(40, 18, 15, 'Harvey Dent',                   0),
-- Kis nők (19)
(41, 19, 27, 'Meg March',                     0),
(42, 19, 23, 'Amy March',                     0),
-- Aftersun (20)
(43, 20, 30, 'Calum',                         1);

-- ============================================================
-- KULCSOK ÉS KÉNYSZERFELTÉTELEK
-- ============================================================

ALTER TABLE `szineszek` ADD PRIMARY KEY (`id`);
ALTER TABLE `filmek`    ADD PRIMARY KEY (`id`);
ALTER TABLE `szerepek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filmid`    (`filmid`),
  ADD KEY `szineszid` (`szineszid`);

ALTER TABLE `szerepek`
  ADD CONSTRAINT `szerep_ibfk_1` FOREIGN KEY (`filmid`)    REFERENCES `filmek`   (`id`),
  ADD CONSTRAINT `szerep_ibfk_2` FOREIGN KEY (`szineszid`) REFERENCES `szineszek` (`id`);
