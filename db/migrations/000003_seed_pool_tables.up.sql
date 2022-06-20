
set foreign_key_checks=0;
truncate table users;
set foreign_key_checks=1;
insert into users 
(name,email,password,role_id,country_id)
values 
('Admin',         'admin@poolconf.net',    '$2y$10$Pd.GOvilmMjz7qDwlJHu4e.4f2UAIuZY2J9.NvkqsGRajZyM4e.vO',1,1),
('Vanja König',   'vanja.koenig@gmail.com','$2y$10$17Z6Uu3Mewww/o86aDpXAu5SN29iTHYxtlLABCHSqasJuXY2vUViq',1,1),
('Marko',         'marko@brainpool.net',   '$2y$10$sjzAQK0peHDmlcyjnpYR7uPK2986MoWSgiP0qkzLKPYy0BXzkNomG',2,1),
('api01',         'api01@brainpool.net',   '$2y$10$06V1qonYQmp5mRG.Dc69uuTFNZuXaT9MTvCCJuWnrS3k.WjjvrbSe',4,1),
('kunde.at',      'kunde.at@kunde.at',     '$2y$10$06V1qonYQmp5mRG.Dc69uuTFNZuXaT9MTvCCJuWnrS3k.WjjvrbSe',3,1),
('kunde.de',      'kunde.de@kunde.de',     '$2y$10$06V1qonYQmp5mRG.Dc69uuTFNZuXaT9MTvCCJuWnrS3k.WjjvrbSe',3,2),
('kunde.ch',      'kunde.ch@kunde.ch',     '$2y$10$06V1qonYQmp5mRG.Dc69uuTFNZuXaT9MTvCCJuWnrS3k.WjjvrbSe',3,3),
('Vanja PoolGirl','vanja.radenovic@aon.at','$2y$10$1oxVJGToY8RxiWZSVh8hsuzfyFQu8ddClb87qhP48KI.G.da7ir4S',3,1),
('Ergun Spitzer', 'ergun@spitzer.eu',      '$2y$10$5iN1OUspv8e3vNo.8GIHWeYlbvzMaE7Rk8mCUCCQ.WHGMHXY8OK96',3,1);
 
set foreign_key_checks=0;
truncate table pooltechnics;
set foreign_key_checks=1;
insert into pooltechnics
(name,number,price_at,price_de,price_ch,`desc`)
values
('Skimmertechnik', 'POOLTECHNICS_SKIM',0.0,    0.0,    0.0,   'Pool mit Skimmertechnik'),
('Überlauftechnik','POOLTECHNICS_UBER',4417.10,4905.08,5502.4,'Pool mit Überlauftechnik');

set foreign_key_checks=0;
truncate table pooltypes;
set foreign_key_checks=1;
insert into pooltypes
(name,number,desc1,pooltechnics_id)
values
('Skimmer', 'POOLTYPE_SKIM','Skimmertechnik',                1),
('Überlauf','POOLTYPE_UBER','Überlauftechnik',               2),
('Infinity','POOLTYPE_INFI','Überlauftechnik, Infinitykante',2);

set foreign_key_checks=0;
truncate table poolsizes;
set foreign_key_checks=1;
insert into poolsizes
(name,number,length,width,price_at,price_de,price_ch,`desc`)
values
('Poolgröße 600x300 cm', 'POOLSIZE_600_300', 600,300, 9449.10, 10493.04,11770.91,''),
('Poolgröße 700x320 cm', 'POOLSIZE_700_320', 700,320, 10482.36,11645.41,13073.91,''),
('Poolgröße 800x350 cm', 'POOLSIZE_800_350', 800,350, 11510.64,12714.06,14338.50,''),
('Poolgröße 900x350 cm', 'POOLSIZE_900_350', 900,350, 12588.14,13997.00,15782.11,''),
('Poolgröße 1000x350 cm','POOLSIZE_1000_350',1000,350,13501.40,14837.88,16818.00,''),
('Poolgröße 1200x350 cm','POOLSIZE_1200_350',1200,350,14475.60,16833.62,18890.00,'');

set foreign_key_checks=0;
truncate table sizechanges;
set foreign_key_checks=1;
insert into sizechanges
(pooltype_id,name,number,price_at,price_de,price_ch,`desc`)
values
(1,'Veränderung der Maße beim Becken SKIMMER', 'SIZECHANGE_SKIM',292.95,295.74,369.51,''),
(2,'Veränderung der Maße beim Becken Überlauf','SIZECHANGE_UBER',380.84,384.46,479.60,''),
(3,'Veränderung der Maße beim Becken INFINITY','SIZECHANGE_INFI',380.84,384.46,479.60,'');

set foreign_key_checks=0;
truncate table pooledges;
set foreign_key_checks=1;
insert into pooledges
(pooltype_id,name,number,price_at,price_de,price_ch,`desc`)
values
(3,'Infinity Kante','POOLEDGE_INFI',301.35,357.00,421.83,'');

set foreign_key_checks=0;
truncate table poolframes;
set foreign_key_checks=1;
insert into poolframes
(name,number,price_at,price_de,price_ch,`desc`,image,has_color)
values
('Rand 8mm',            'POOLFRAME_RANDPLUS',   0.00,0.00,0.00,   '8 mm Rand plus',          'poolframe_001.jpg',0),
('Rand 8cm',            'POOLFRAME_RANDSKIMMER',0.00,0.00,0.00,   '8 cm Rand mit Skimmer',   'poolframe_002.jpg',1),
('Überlaufgitter',      'POOLFRAME_UBERGITTER', 0.00,0.00,0.00,   '20 cm Überlauf - Gitter', 'poolframe_003.jpg',1),
('Versteckter Überlauf','POOLFRAME_UBERRINNE',  54.00,54.00,54.00,'versteckte Überlaufrinne','poolframe_004.jpg',0);
       
set foreign_key_checks=0;
truncate table stepsforms;
set foreign_key_checks=1;
insert into stepsforms
(name,number,price_at,price_de,price_ch,type,`desc`,image)
values
('Runde Eckstiege',      'STEPSFORM_RUNDEECK',    0.00,   0.00,   0.00,   1,'',            'stepsform_001.jpg'),
('Gerade Eckstiege',     'STEPSFORM_GERADEECK',   0.00,   0.00,   0.00,   2,'',            'stepsform_002.jpg'),
('Sonderformstiege',     'STEPSFORM_SONDERN',     1047.77,1057.75,1349.20,3,'',            'stepsform_003.jpg'),
('Römerstiege RUND',     'STEPSFORM_ROMERRUND',   1047.77,1057.75,1349.20,4,'',            'stepsform_004.jpg'),
('Gerade Seitenstiege',  'STEPSFORM_GERADESEITE', 288.00, 288.00, 288.00, 5,'',            'stepsform_005.jpg'),
('Römerstiege ECKIG',    'STEPSFORM_ROMERECKBANK',1047.77,1057.75,1349.20,6,'mit Sitzbank','stepsform_006.jpg'),
('Durchgehende Treppe 5','STEPSFORM_DURCH5',      0.0,    0.0,    0.0,    7,'',            'stepsform_007.jpg');

set foreign_key_checks=0;
truncate table colorvaris;
set foreign_key_checks=1;
insert into colorvaris
(name,number,price_at,price_de,price_ch,`desc`,image)
values
('Einheitliche Farbe','COLORVAR_EINHEIT',    0.00,0.00,0.00,'Die gleiche Farbe',           'colorvari_001.jpg'),
('Trittfläche Farbe', 'COLORVAR_TRITTFLACHE',0.00,0.00,0.00,'Trittfläche in anderer Farbe','colorvari_002.jpg'),
('Schweißnaht Farbe', 'COLORVAR_SCWEISS',    0.00,0.00,0.00,'Schweißnaht in anderer Farbe','colorvari_003.jpg');

set foreign_key_checks=0;
truncate table pooltype_poolframe;
set foreign_key_checks=1;
insert into pooltype_poolframe
(pooltype_id,poolframe_id)
values
(1,1),
(1,2),
(2,3),
(2,4),
(3,3),
(3,4);

set foreign_key_checks=0;
truncate table poolbenches;
set foreign_key_checks=1;
insert into poolbenches
(name,number,price_at,price_de,price_ch,desc1,ask_for_price,image,type)
values
('Keine Sitzbank',            'POOLBENCH_NONE',       0.0,    0.0,    0.0,    '',                         0,'poolbench_001.jpg',1),
('Sitzbank Modern',           'POOLBENCH_MODERN',     592.20, 620.10, 649.65, '',                         0,'poolbench_002.jpg',2),
('Sitzbank Insel',            'POOLBENCH_ISLAND',     592.20, 620.10, 649.65, '',                         0,'poolbench_003.jpg',3),
('Sitzbank Extra',            'POOLBENCH_EXTRA',      592.20, 620.10, 649.65, '',                         0,'poolbench_004.jpg',4),
('Sitzbank 5',                'POOLBENCH_DURCH5',     592.20, 620.10, 649.65, '',                         0,'poolbench_005.jpg',5),
('Flachwasserbereich',        'POOLBENCH_SHALLOW',    779.10, 779.10, 798.77, 'Preis pro Meter Breite',   0,'poolbench_006.jpg',6),
('Liege Relax',               'POOLBENCH_RELAX',      2763.60,2789.00,2868.88,'Liegefläche mit Whirlpool',0,'poolbench_007.jpg',7),
('Sitzbank Längsseite',       'POOLBENCH_LONGSIDE',   592.20, 620.10, 649.65, '',                         0,'poolbench_008.jpg',8),
('Sitzbank Eigenkreation*',   'POOLBENCH_SELFMADE',   0.00,   0.00,   0.00,   '',                         1,'poolbench_009.jpg',9),
('Sitzbank 2 & Gerade Treppe','POOLBENCH_DURCH2STEPS',592.20, 592.20, 592.20, '',                         0,'poolbench_010.jpg',10),
('Sitzbank 2',                'POOLBENCH_DURCH2',     592.20, 620.10, 649.65, '',                         0,'poolbench_011.jpg',11);

set foreign_key_checks=0;
truncate table skimmertypes;
set foreign_key_checks=1;
insert into skimmertypes
(name,number,price_at,price_de,price_ch,`desc`,image)
values
('SKIMMER Big',    'SKIMMERTYPE_BIG',    0.00,  0.00,  0.00,  '','skimmer_001.jpg'),
('SKIMMER Flat',   'SKIMMERTYPE_FLAT',   362.84,373.12,397.98,'','skimmer_002.jpg'),
('SKIMMER Skyline','SKIMMERTYPE_SKYLINE',496.08,496.08,571.33,'','skimmer_003.jpg');
 
set foreign_key_checks=0;
truncate table technicsboxes;
set foreign_key_checks=1;
insert into technicsboxes
(name,number,length,width,depth,price_at,price_de,price_ch,`desc`,position)
values
('Extra Schacht',  'TECHNICSBOX_SKIMEXTRA',150,120,150,0.0,   0.0,    0.0,    '',1),
('Extra Schacht',  'TECHNICSBOX_UBEREXTRA',250,150,150,0.0,   0.0,    0.0,    '',1),
('Schacht am Pool','TECHNICSBOX_SKIMPOOL', 150,120,150,488.61,515.56, 535.94, '',2),
('Schacht am Pool','TECHNICSBOX_UBERPOOL', 250,150,150,982.78,1010.85,1077.96,'',2),
('GSA Schacht',    'TECHNICSBOX_GSA',      250,150,150,397.43,397.43, 412.00, '',1),
('L-Paneel',       'TECHNICSBOX_LPANEEL',  250,150,150,0.0,   0.0,    0.0,    '',0),
('Ohne Schacht',   'TECHNICSBOX_OHNE',     0,  0,  0,  0.0,   0.0,    0.0,    '',0);

set foreign_key_checks=0;
truncate table pooltype_technicsbox;
set foreign_key_checks=1;
insert into pooltype_technicsbox
(pooltype_id,technicsbox_id)
values
(1,1),
(1,3),
(1,5),
(1,6),
(1,7),
(2,2),
(2,4),
(2,5),
(2,6),
(2,7),
(3,2),
(3,4),
(3,5),
(3,6),
(3,7);

set foreign_key_checks=0;
truncate table poolwaters;
set foreign_key_checks=1;
insert into poolwaters
(name,number,price_at,price_de,price_ch,desc1,desc2,desc3,desc4,desc5,image)
values
('Manuell',           'POOLWATER_MANUALL', 0,      0,      0,       '',           '',           '',       '',       '',   ''),
('1/2 BRAIN Minisalt','POOLWATER_HALFMINI',2223.74,2223.74,2286.82,'ph Dosierung','Salzanlage', '',       '',       '',   'poolwater_001.jpg'),
('Full BRAIN Net',    'POOLWATER_FULLNET', 2443.88,2467.15,2536.98,'ph Dosierung','Chloranlage','App',    '',       '',   'poolwater_002.jpg'),
('Full BRAIN Salt',   'POOLWATER_FULLSALT',3469.93,3523.16,3622.88,'ph Dosierung','Salzanlage', 'Algicid','App',    '',   'poolwater_003.jpg'),
('Full BRAIN Home',   'POOLWATER_FULLHOME',3830.63,3867.11,3976.56,'ph Dosierung','Chloranlage','Algcid', 'Flocken','App','poolwater_004.jpg');

set foreign_key_checks=0;
truncate table electros;
set foreign_key_checks=1;
insert into electros
(name,number,price_at,price_de,price_ch,desc1,image)
values
('E-Verteiler','ELECTRO_EVERTEILER',437.35,481.00,523.40,'','electro_001.jpg');

set foreign_key_checks=0;
truncate table whirlpools;
set foreign_key_checks=1;
insert into whirlpools
(name,number,price_at,price_de,price_ch,desc1,image)
values
('Whirlpool','WHIRLPOOL_BASE',549.36,565.98,649.64,'','whirlpool_001.jpg');

set foreign_key_checks=0;
truncate table ventils;
set foreign_key_checks=1;
insert into ventils
(name,number,price_at,price_de,price_ch,desc1,image)
values
('5 Wege DeLux','VENTIL_5WEGE',1801.80,1818.96,1870.44,'','ventil_001.jpg');
 

set foreign_key_checks=0;
truncate table poolwater_ventil;
set foreign_key_checks=1;
insert into poolwater_ventil
(poolwater_id,ventil_id)
values
(4,1),
(5,1);
 
set foreign_key_checks=0;
truncate table leds;
set foreign_key_checks=1;
insert into leds
(name,number,price_at,price_de,price_ch,desc1,image,has_remote)
values
('Keine Leds','LED_NONE', 0.0,   0.0,   0.0,   '',                  '',             0),
('Led WEISS', 'LED_WEISS',449.06,453.34,449.06,'ohne Fernbedienung','led_white.jpg',0),
('Led RGB',   'LED_RGB',  449.06,453.34,466.17,'mit Fernbedienung', 'led_rgb.jpg',  1);

set foreign_key_checks=0;
truncate table gsas;
set foreign_key_checks=1;
insert into gsas
(name,number,price_at,price_de,price_ch,desc1,image)
values
('Keine GSA',  'GSA_NONE',   0.0,    0.0,    0.0,    '',       ''),
('V-Jet 66m3', 'GSA_VJET66', 1934.39,1952.81,2008.08,'66 m3/h','gsa_001.jpg'),
('Swim Motion','GSA_SWIMMOT',3148.93,3188.92,3268.89,'46 m3/h','gsa_002.jpg'),
('Athlete',    'GSA_ATHLETE',3696.00,3731.20,3836.80,'68 m3/h','gsa_003.jpg');


set foreign_key_checks=0;
truncate table pooltype_gsa;
set foreign_key_checks=1;
insert into pooltype_gsa
(pooltype_id,gsa_id)
values
(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(2,2),
(2,4),
(3,1),
(3,2),
(3,4);

set foreign_key_checks=0;
truncate table poolcolors;
set foreign_key_checks=1;
insert into poolcolors
(name,number,value)
values
('Weiß',     'POOLCOLOR_WEISS',    '#ffffff'),
('Stahlblau','POOLCOLOR_STAHLBLAU','#bcd2ee'),
('Eisblau',  'POOLCOLOR_EISBLAU',  '#cae1ff'),
('Blau',     'POOLCOLOR_BLUE',     '#0082ee'),
('Grau',     'POOLCOLOR_GRAU',     '#9b9b9b'),
('Beige',    'POOLCOLOR_BEIGE',    '#e6d2b5');
 
set foreign_key_checks=0;
truncate table poolframecolors;
set foreign_key_checks=1;
insert into poolframecolors
(name,number,value)
values
('Weiß',      'POOLFRAMECOLOR_WEISS',     '#ecece7'),
('Beige',     'POOLFRAMECOLOR_BEIGE',     '#e6d2b5'),
('Hellgrau',  'POOLFRAMECOLOR_HELLGRAU',  '#c5c7c4'),
('Silber',    'POOLFRAMECOLOR_SILBER',    '#a1a1a0'),
('Mittelgrau','POOLFRAMECOLOR_MITTELGRAU','#8d9295'),
('Dunkelgrau','POOLFRAMECOLOR_DUNKELGRAU','#383e42');

set foreign_key_checks=0;
truncate table technicsboxchanges;
set foreign_key_checks=1;
insert into technicsboxchanges
(name,number,price_at,price_de,price_ch,desc1)
values
('Vergrößerung Schacht','TECHNICSBOXCHANGES_BASE',484.0,484.0,484.0,'Preis per m2');

set foreign_key_checks=0;
truncate table ledremotes;
set foreign_key_checks=1;
insert into ledremotes
(name,number,price_at,price_de,price_ch,desc1)
values
('Led Fernbedienung','LEDREMOTE_BASE',138.60,138.60,138.60,'');


set foreign_key_checks=0;
truncate table formtypes;
set foreign_key_checks=1;
insert into formtypes
(name,number)
values
('Rechteck',   'FORMTYPE_RECT'),
('Römer Rund', 'FORMTYPE_ROMERRUND'),
('Römer Eckig','FORMTYPE_ROMERECK'),
('Inseln',     'FORMTYPE_ISLAND');

set foreign_key_checks=0;
truncate table formgroups;
set foreign_key_checks=1;
insert into formgroups
(name,number,desc1,desc2,desc3,image)
values
('Runde Eckstiege',                       'FORMGROUP_001','Treppen mit 4 oder 5 Stufen','',                         '',                    'formgroup_001.jpg'),
('Gerade Eckstiege',                      'FORMGROUP_002','Treppen mit 4 oder 5 Stufen','',                         '',                    'formgroup_002.jpg'),
('Gerade Seitenstiege',                   'FORMGROUP_003','Treppen mit 4 oder 5 Stufen','Breite 80 cm',             '',                    'formgroup_003.jpg'),
('Runde Römerstiege',                     'FORMGROUP_004','Treppen mit 4 oder 5 Stufen','Zweite Stufe als Sitzbank','',                    'formgroup_004.jpg'),
('Eckige Römerstiege',                    'FORMGROUP_005','Treppen mit 4 oder 5 Stufen','Zweite Stufe als Sitzbank','',                    'formgroup_005.jpg'),
('Geraden Seitenstiege & Sitzbank',       'FORMGROUP_006','Treppen mit 4 oder 5 Stufen','Sitzbank mit 2 Stufen',    '',                    'formgroup_006.jpg'),
('Gerade Eckstiege & Sitzbank Modern',    'FORMGROUP_007','Treppen mit 4 oder 5 Stufen','Sitzbank mit 2 Stufen',    '',                    'formgroup_007.jpg'),
('Gerade Eckstiege & Sitzbank Längsseite','FORMGROUP_008','Treppen mit 4 oder 5 Stufen','Sitzbank mit 2 Stufen',    'Sitzbank Länge 3,5 m','formgroup_008.jpg'),
('Durchgehende Sitzbank 5',               'FORMGROUP_009','Sitzbank mit 5 Stufen',      '',                         '',                    'formgroup_009.jpg'),
('Durchgehende Treppe mit Sitzbank 2',    'FORMGROUP_010','Treppen mit 4 oder 5 Stufen','Sitzbank mit 2 Stufen',    '',                    'formgroup_010.jpg'),
('Sitzbank Extra',                        'FORMGROUP_011','Sitzbank mit 2 Stufen',      'Sitzbank Länge 3,5 m',     '',                    'formgroup_011.jpg'),
('Runde Eckstiege & Sitzbank Kombi',      'FORMGROUP_012','Treppen mit 4 oder 5 Stufen','Sitzbank mit 2 Stufen',    '',                    'formgroup_012.jpg'),
('Inseln',                                'FORMGROUP_013','Treppen mit 4 oder 5 Stufen','Sitzbank mit 2 Stufen',    '',                    'formgroup_013.jpg'),
('Pool ohne Stiege & Sitzbank',           'FORMGROUP_014','Keine Treppen',              'Keine Sitzbank',           '',                    'formgroup_014.jpg');

set foreign_key_checks=0;
truncate table poolforms;
set foreign_key_checks=1;
insert into poolforms
(formtype_id,formgroup_id)
values
(1,1),
(1,1),
(1,1),
(1,1),
(1,2),
(1,2),
(1,2),
(1,2),
(1,3),
(1,3),
(1,3),
(1,3),
(2,4),
(2,4),
(3,5),
(3,5),
(1,6),
(1,6),
(1,6),
(1,6),
(1,7),
(1,7),
(1,7),
(1,7),
(1,8),
(1,8),
(1,8),
(1,8),
(1,9),
(1,9),
(1,10),
(1,10),
(1,11),
(1,11),
(1,12),
(1,12),
(1,12),
(1,12),
(4,13),
(4,13),
(4,13),
(4,13),
(1,14);

set foreign_key_checks=0;
truncate table poolform_stepsform;
set foreign_key_checks=1;
insert into poolform_stepsform
(poolform_id,stepsform_id,pos)
values
(1,1,1),
(2,1,3),
(3,1,7),
(4,1,9),
(5,2,1),
(6,2,3),
(7,2,7),
(8,2,9),
(9,5,1),
(10,5,3),
(11,5,7),
(12,5,9),
(13,4,2),
(14,4,8),
(15,6,2),
(16,6,8),
(31,7,7),
(32,7,1),
(35,1,1),
(36,1,3),
(37,1,7),
(38,1,9);

set foreign_key_checks=0;
truncate table poolform_poolbench;
set foreign_key_checks=1;
insert into poolform_poolbench
(poolform_id,poolbench_id,pos)
values
(17,10,1),
(18,10,3),
(19,10,7),
(20,10,9),
(21,2,1),
(22,2,3),
(23,2,7),
(24,2,9),
(25,8,1),
(26,8,3),
(27,8,7),
(28,8,9),
(29,5,1),
(30,5,7),
(31,11,1),
(32,11,7),
(33,4,4),
(34,4,6),
(35,11,7),
(36,11,7),
(37,11,1),
(38,11,1),
(39,3,1),
(40,3,3),
(41,3,7),
(42,3,9);

