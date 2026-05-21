DROP DATABASE IF EXISTS `foci`;
CREATE DATABASE IF NOT EXISTS `foci` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `foci`;

-- ============================================================
-- TÁBLÁK LÉTREHOZÁSA
-- ============================================================

CREATE TABLE `jatekosok` (
  `id`      INT         NOT NULL,
  `nev`     VARCHAR(60) NOT NULL,
  `csapat`  VARCHAR(60) NOT NULL,
  `poszt`   VARCHAR(20) NOT NULL,
  `mezszam` INT         NOT NULL,
  `kor`     INT         NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

CREATE TABLE `merkozesek` (
  `id`             INT         NOT NULL,
  `datum`          DATE        NOT NULL,
  `hazai_csapat`   VARCHAR(60) NOT NULL,
  `vendeg_csapat`  VARCHAR(60) NOT NULL,
  `helyszin`       VARCHAR(60) NOT NULL,
  `nezoszam`       INT         NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

CREATE TABLE `golelozmenyek` (
  `id`          INT         NOT NULL,
  `merkozesid`  INT         NOT NULL,
  `jatekosid`   INT         NOT NULL,
  `perc`        INT         NOT NULL,
  `tipus`       VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- ============================================================
-- ADATOK – jatekosok
-- poszt: 'kapus' | 'védő' | 'középpályás' | 'csatár'
-- Ferencváros TC    → id  1– 8
-- Puskás Akadémia FC → id  9–16
-- Debreceni VSC     → id 17–24
-- Fehérvár FC       → id 25–32
-- Paksi FC          → id 33–40
-- Újpest FC         → id 41–48
-- Győri ETO FC      → id 49–56
-- ============================================================

INSERT INTO `jatekosok` (`id`, `nev`, `csapat`, `poszt`, `mezszam`, `kor`) VALUES
(1,  'Dibusz Dénes',            'Ferencváros TC',      'kapus',        1,  34),
(2,  'Civic Miha',              'Ferencváros TC',      'védő',         5,  27),
(3,  'Botka Endre',             'Ferencváros TC',      'védő',         13, 30),
(4,  'Laidouni Aissa',          'Ferencváros TC',      'középpályás',  28, 28),
(5,  'Zachariassen Kristoffer', 'Ferencváros TC',      'középpályás',  10, 31),
(6,  'Varga Barnabás',          'Ferencváros TC',      'csatár',       99, 27),
(7,  'Tokmac Nguen',            'Ferencváros TC',      'csatár',       79, 32),
(8,  'Henry Wingo',             'Ferencváros TC',      'csatár',       9,  29),
(9,  'Kovácsik Ádám',           'Puskás Akadémia FC',  'kapus',        1,  33),
(10, 'Stronati Mirko',          'Puskás Akadémia FC',  'védő',         6,  29),
(11, 'Szolnoki Szabolcs',       'Puskás Akadémia FC',  'védő',         4,  24),
(12, 'Slagveer Sheraldo',       'Puskás Akadémia FC',  'középpályás',  7,  30),
(13, 'Könyves Norbert',         'Puskás Akadémia FC',  'csatár',       11, 34),
(14, 'Nagy Zsolt',              'Puskás Akadémia FC',  'csatár',       9,  27),
(15, 'Papp Kristóf',            'Puskás Akadémia FC',  'középpályás',  8,  23),
(16, 'Varela Bernardo',         'Puskás Akadémia FC',  'védő',         3,  26),
(17, 'Verpecz István',          'Debreceni VSC',       'kapus',        1,  29),
(18, 'Brkovics Josip',          'Debreceni VSC',       'védő',         5,  26),
(19, 'Ferenczi János',          'Debreceni VSC',       'védő',         3,  31),
(20, 'Kusnyír Viktor',          'Debreceni VSC',       'középpályás',  10, 25),
(21, 'Szécsi Márton',           'Debreceni VSC',       'csatár',       9,  22),
(22, 'Ugrai Roland',            'Debreceni VSC',       'csatár',       11, 29),
(23, 'Dzsudzsák Balázs',        'Debreceni VSC',       'középpályás',  77, 38),
(24, 'Takács Tamás',            'Debreceni VSC',       'csatár',       7,  28),
(25, 'Kovács Dániel',           'Fehérvár FC',         'kapus',        1,  28),
(26, 'Nego Loic',               'Fehérvár FC',         'védő',         2,  32),
(27, 'Fiola Attila',            'Fehérvár FC',         'középpályás',  21, 32),
(28, 'Bamgboye Taiwo',          'Fehérvár FC',         'csatár',       9,  25),
(29, 'Houri Yohan',             'Fehérvár FC',         'csatár',       11, 26),
(30, 'Boér Gábor',              'Fehérvár FC',         'védő',         3,  34),
(31, 'Kovács Balázs',           'Fehérvár FC',         'középpályás',  8,  23),
(32, 'Heister Csaba',           'Fehérvár FC',         'védő',         4,  27),
(33, 'Simon Krisztián',         'Paksi FC',            'kapus',        1,  31),
(34, 'Szélesi Zoltán',          'Paksi FC',            'védő',         6,  34),
(35, 'Windecker József',        'Paksi FC',            'védő',         4,  30),
(36, 'Vécsei Bálint',           'Paksi FC',            'középpályás',  8,  27),
(37, 'Balogh Balázs',           'Paksi FC',            'csatár',       9,  24),
(38, 'Böde Dániel',             'Paksi FC',            'csatár',       14, 38),
(39, 'Horváth Gábor',           'Paksi FC',            'középpályás',  7,  26),
(40, 'Lenzsér Ákos',            'Paksi FC',            'csatár',       10, 29),
(41, 'Balajti Álmos',           'Újpest FC',           'kapus',        1,  26),
(42, 'Myke',                    'Újpest FC',           'védő',         33, 28),
(43, 'Cropper Calvin',          'Újpest FC',           'védő',         5,  25),
(44, 'Újvári Tamás',            'Újpest FC',           'középpályás',  8,  29),
(45, 'Tóth Bence',              'Újpest FC',           'csatár',       10, 23),
(46, 'Lukács Bence',            'Újpest FC',           'csatár',       11, 27),
(47, 'Pillár Attila',           'Újpest FC',           'középpályás',  6,  24),
(48, 'Busai Attila',            'Újpest FC',           'csatár',       7,  32),
(49, 'Szarka Zoltán',           'Győri ETO FC',        'kapus',        1,  30),
(50, 'Pačinda Marek',           'Győri ETO FC',        'védő',         5,  27),
(51, 'Jagodics Olivér',         'Győri ETO FC',        'középpályás',  8,  24),
(52, 'Babati Gábor',            'Győri ETO FC',        'csatár',       10, 26),
(53, 'Gruber Zsombor',          'Győri ETO FC',        'csatár',       11, 23),
(54, 'Redzic Irfan',            'Győri ETO FC',        'középpályás',  7,  28),
(55, 'Szivacski Bence',         'Győri ETO FC',        'védő',         3,  25),
(56, 'Takács Milán',            'Győri ETO FC',        'csatár',       9,  31);

-- ============================================================
-- ADATOK – merkozesek
-- ============================================================

INSERT INTO `merkozesek`
  (`id`, `datum`, `hazai_csapat`, `vendeg_csapat`, `helyszin`, `nezoszam`) VALUES
(1,  '2029-03-01', 'Ferencváros TC',     'Puskás Akadémia FC', 'Groupama Aréna',          22000),
(2,  '2029-03-01', 'Debreceni VSC',      'Fehérvár FC',        'Nagyerdei Stadion',         8500),
(3,  '2029-03-02', 'Paksi FC',           'Újpest FC',          'Fehér Miklós Stadion',      3800),
(4,  '2029-03-02', 'Győri ETO FC',       'MTK Budapest FC',    'ETO Park',                  2900),
(5,  '2029-03-08', 'Fehérvár FC',        'Ferencváros TC',     'Mol Aréna Sóstó',          14200),
(6,  '2029-03-09', 'Újpest FC',          'Debreceni VSC',      'Szusza Ferenc Stadion',     6200),
(7,  '2029-03-09', 'Puskás Akadémia FC', 'Győri ETO FC',       'Pancho Aréna',              3500),
(8,  '2029-03-15', 'Ferencváros TC',     'Debreceni VSC',      'Groupama Aréna',           23500),
(9,  '2029-03-16', 'Győri ETO FC',       'Paksi FC',           'ETO Park',                  5100),
(10, '2029-03-16', 'Fehérvár FC',        'Újpest FC',          'Mol Aréna Sóstó',           9200),
(11, '2029-03-22', 'Paksi FC',           'Fehérvár FC',        'Fehér Miklós Stadion',      3200),
(12, '2029-03-22', 'Ferencváros TC',     'Győri ETO FC',       'Groupama Aréna',           21000),
(13, '2029-03-23', 'Debreceni VSC',      'Puskás Akadémia FC', 'Nagyerdei Stadion',         7800),
(14, '2029-03-29', 'Puskás Akadémia FC', 'Fehérvár FC',        'Pancho Aréna',              4300),
(15, '2029-03-30', 'Újpest FC',          'Győri ETO FC',       'Szusza Ferenc Stadion',     5900),
(16, '2029-04-05', 'Ferencváros TC',     'Újpest FC',          'Groupama Aréna',           19500),
(17, '2029-04-05', 'Paksi FC',           'Debreceni VSC',      'Fehér Miklós Stadion',      3600),
(18, '2029-04-06', 'Győri ETO FC',       'Fehérvár FC',        'ETO Park',                  5800),
(19, '2029-04-12', 'Ferencváros TC',     'Paksi FC',           'Groupama Aréna',           20000),
(20, '2029-04-12', 'Puskás Akadémia FC', 'Debreceni VSC',      'Pancho Aréna',              4100),
(21, '2029-04-13', 'Debreceni VSC',      'Újpest FC',          'Nagyerdei Stadion',         7200),
(22, '2029-04-13', 'Fehérvár FC',        'Győri ETO FC',       'Mol Aréna Sóstó',           8100),
(23, '2029-04-19', 'Ferencváros TC',     'Fehérvár FC',        'Groupama Aréna',           24000),
(24, '2029-04-20', 'Újpest FC',          'Puskás Akadémia FC', 'Szusza Ferenc Stadion',     6800),
(25, '2029-04-26', 'Debreceni VSC',      'Győri ETO FC',       'Nagyerdei Stadion',         7400);

-- ============================================================
-- ADATOK – golelozmenyek
-- tipus: 'gól' | 'öngól' | 'tizenegyes'
-- ============================================================

INSERT INTO `golelozmenyek`
  (`id`, `merkozesid`, `jatekosid`, `perc`, `tipus`) VALUES
-- Mérkőzés  1: Ferencváros TC vs Puskás Akadémia FC
(1,  1,  6, 12, 'gól'),
(2,  1,  7, 34, 'gól'),
(3,  1, 13, 67, 'gól'),
(4,  1,  8, 81, 'tizenegyes'),
-- Mérkőzés  2: Debreceni VSC vs Fehérvár FC
(5,  2, 22, 15, 'gól'),
(6,  2, 28, 44, 'gól'),
(7,  2, 24, 72, 'tizenegyes'),
-- Mérkőzés  3: Paksi FC vs Újpest FC
(8,  3, 37, 28, 'gól'),
(9,  3, 45, 55, 'gól'),
(10, 3, 38, 88, 'gól'),
-- Mérkőzés  5: Fehérvár FC vs Ferencváros TC
(11, 5, 28,  9, 'gól'),
(12, 5,  7, 41, 'gól'),
(13, 5,  6, 78, 'tizenegyes'),
(14, 5, 19, 85, 'öngól'),
-- Mérkőzés  8: Ferencváros TC vs Debreceni VSC
(15, 8,  8,  7, 'gól'),
(16, 8, 23, 53, 'tizenegyes'),
(17, 8,  6, 69, 'gól'),
(18, 8, 22, 90, 'gól'),
-- Mérkőzés 12: Ferencváros TC vs Győri ETO FC
(19, 12,  7, 18, 'gól'),
(20, 12,  5, 37, 'gól'),
(21, 12, 52, 61, 'gól'),
(22, 12,  8, 75, 'gól'),
-- Mérkőzés 13: Debreceni VSC vs Puskás Akadémia FC
(23, 13, 12, 22, 'gól'),
(24, 13, 21, 49, 'gól'),
(25, 13, 14, 77, 'tizenegyes'),
-- Mérkőzés 16: Ferencváros TC vs Újpest FC
(26, 16,  6, 11, 'gól'),
(27, 16,  6, 44, 'gól'),
(28, 16, 46, 58, 'gól'),
(29, 16,  4, 83, 'tizenegyes'),
-- Mérkőzés 19: Ferencváros TC vs Paksi FC (2029-04-12)
(30, 19,  8, 14, 'gól'),
(31, 19,  6, 29, 'tizenegyes'),
(32, 19, 37, 41, 'gól'),
(33, 19,  7, 56, 'gól'),
(34, 19, 38, 71, 'öngól'),
(35, 19,  5, 88, 'gól'),
-- Mérkőzés 22: Fehérvár FC vs Győri ETO FC
(36, 22, 27, 16, 'gól'),
(37, 22, 54, 33, 'gól'),
(38, 22, 28, 64, 'gól'),
(39, 22, 53, 79, 'tizenegyes'),
-- Mérkőzés 23: Ferencváros TC vs Fehérvár FC
(40, 23,  6,  5, 'gól'),
(41, 23,  8, 27, 'gól'),
(42, 23,  7, 38, 'tizenegyes'),
(43, 23, 29, 55, 'gól'),
(44, 23,  6, 82, 'gól'),
-- Mérkőzés 25: Debreceni VSC vs Győri ETO FC
(45, 25, 22, 19, 'gól'),
(46, 25, 23, 45, 'gól'),
(47, 25, 51, 67, 'gól'),
(48, 25, 24, 88, 'tizenegyes');

-- ============================================================
-- KULCSOK ÉS KÉNYSZERFELTÉTELEK
-- ============================================================

ALTER TABLE `jatekosok`  ADD PRIMARY KEY (`id`);
ALTER TABLE `merkozesek` ADD PRIMARY KEY (`id`);
ALTER TABLE `golelozmenyek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merkozesid` (`merkozesid`),
  ADD KEY `jatekosid`  (`jatekosid`);

ALTER TABLE `golelozmenyek`
  ADD CONSTRAINT `gol_ibfk_1` FOREIGN KEY (`merkozesid`) REFERENCES `merkozesek` (`id`),
  ADD CONSTRAINT `gol_ibfk_2` FOREIGN KEY (`jatekosid`)  REFERENCES `jatekosok`  (`id`);
