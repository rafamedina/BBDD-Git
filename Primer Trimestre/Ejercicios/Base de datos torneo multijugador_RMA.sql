DROP DATABASE IF exists PLatafomra_Juegos;
CREATE DATABASE IF NOT EXISTS Plataforma_Juegos;
USE Plataforma_Juegos;
CREATE TABLE if not exists Equipos(
Nombre varchar(50) Primary Key not null,
Fecha_creacion DATE not null, 
Puntos int not null,
Descripcion tinytext
);

CREATE TABLE if not exists Jugadores(
Apodo Varchar(25) Primary Key not null,
Nombre varchar(50),
Apellido varchar(50),
Pais varchar(25),
Edad int,
Nombre_Equipo varchar(50) not null,
Constraint FK_nombre_equipoJ foreign key(Nombre_Equipo) references Equipos(Nombre)
on update cascade
on delete cascade
);

CREATE TABLE if not exists Torneos(
Nombre Varchar(50) Primary Key not null,
Fecha_Inicio DATE,
Premio_Dinero DECIMAL(10,2)
);

CREATE TABLE if not exists Participar(
Nombre_Equipo varchar(50) not null,
Nombre_Torneo VARCHAR(50) NOT null,
Constraint FK_Nombre_EquipoP FOREIGN KEY(Nombre_Equipo) REFERENCES Equipos(Nombre)
on update cascade
on delete cascade,
Constraint FK_Nombre_Torneo FOREIGN KEY(Nombre_Torneo) REFERENCES Torneos(Nombre)
on update cascade
on delete cascade
);
INSERT INTO Equipos (Nombre, Fecha_creacion, Puntos, Descripcion)
VALUES 
('Shadow Wolves', '2018-05-15', 1200, 'Equipo de élite especializado en juegos de sigilo y estrategia.'),
('Phoenix Ascendants', '2019-03-20', 1100, 'Equipo enfocado en juegos de rol y acción.'),
('Iron Gladiators', '2017-07-10', 1300, 'Equipo competitivo de juegos de combate.'),
('Blazing Comets', '2018-11-05', 1150, 'Equipo dinámico en juegos de carreras y aventura.'),
('Crimson Vanguard', '2020-02-28', 1250, 'Equipo experto en juegos de guerra.'),
('Nightmare Reapers', '2016-09-18', 1400, 'Equipo legendario de juegos de horror.'),
('Golden Hawks', '2018-08-25', 1180, 'Equipo destacado en simuladores de vuelo.'),
('Silver Dragons', '2020-01-10', 1220, 'Equipo mítico en juegos de fantasía.'),
('Titan Breakers', '2017-12-15', 1350, 'Equipo fuerte en juegos de resistencia y pelea.'),
('Fury Blades', '2019-06-10', 1270, 'Equipo veloz en juegos de habilidad y precisión.'),
('Mystic Rangers', '2018-04-30', 1210, 'Equipo con especialización en juegos de mundo abierto.'),
('Steel Titans', '2017-11-25', 1290, 'Equipo robusto en juegos de estrategia por turnos.'),
('Thunder Lords', '2019-02-15', 1140, 'Equipo ágil en juegos de aventuras.'),
('Cyber Knights', '2020-03-22', 1190, 'Equipo experto en juegos de ciencia ficción.'),
('Flame Warriors', '2018-10-10', 1160, 'Equipo implacable en juegos de combate.'),
('Frozen Guardians', '2019-07-20', 1230, 'Equipo sobresaliente en juegos temáticos de invierno.'),
('Shadow Assassins', '2016-05-01', 1370, 'Equipo ágil en juegos de infiltración.'),
('Storm Raiders', '2017-03-12', 1340, 'Equipo especializado en juegos de aventuras marinas.'),
('Emerald Defenders', '2018-06-18', 1260, 'Equipo dedicado a juegos de defensa estratégica.'),
('Crimson Warriors', '2019-09-14', 1320, 'Equipo audaz en juegos de acción y aventura.');


INSERT INTO Jugadores (Apodo, Nombre, Apellido, Pais, Edad, Nombre_Equipo)
VALUES 
('ShadowHunter', 'Carlos', 'Pérez', 'México', 24, 'Shadow Wolves'),
('NightWolf', 'Laura', 'Smith', 'USA', 22, 'Shadow Wolves'),
('DarkStalker', 'Pedro', 'Martínez', 'Chile', 25, 'Shadow Wolves'),
('LunarClaw', 'Ana', 'López', 'Colombia', 21, 'Shadow Wolves'),
('WolfFang', 'Luis', 'Fernández', 'Ecuador', 27, 'Shadow Wolves'),
('PhoenixFlame', 'Juan', 'González', 'España', 22, 'Phoenix Ascendants'),
('BlazingWing', 'Diego', 'Ramírez', 'Argentina', 26, 'Phoenix Ascendants'),
('FireSeeker', 'Sara', 'Johnson', 'Canadá', 28, 'Phoenix Ascendants'),
('SkyBlaze', 'Mario', 'Hernández', 'Perú', 29, 'Phoenix Ascendants'),
('InfernoEye', 'Gabriela', 'Castro', 'Uruguay', 20, 'Phoenix Ascendants'),
('IronMaiden', 'Lucía', 'Díaz', 'Panamá', 30, 'Iron Gladiators'),
('SteelWarden', 'Jorge', 'Gómez', 'Paraguay', 24, 'Iron Gladiators'),
('IronFist', 'Roberto', 'Santos', 'Venezuela', 22, 'Iron Gladiators'),
('BladeCrusher', 'Sofía', 'Moreno', 'Costa Rica', 26, 'Iron Gladiators'),
('MetalForge', 'Isabella', 'Martín', 'España', 28, 'Iron Gladiators'),
('BlazeMaster', 'Carlos', 'Pérez', 'México', 24, 'Blazing Comets'),
('FlareWing', 'Laura', 'Smith', 'USA', 22, 'Blazing Comets'),
('FireTail', 'Pedro', 'Martínez', 'Chile', 25, 'Blazing Comets'),
('SolarCore', 'Ana', 'López', 'Colombia', 21, 'Blazing Comets'),
('HeatStorm', 'Luis', 'Fernández', 'Ecuador', 27, 'Blazing Comets'),
('CrimsonWarrior', 'Juan', 'González', 'España', 22, 'Crimson Vanguard'),
('RedFury', 'Diego', 'Ramírez', 'Argentina', 26, 'Crimson Vanguard'),
('BloodGuard', 'Sara', 'Johnson', 'Canadá', 28, 'Crimson Vanguard'),
('ScarletSword', 'Mario', 'Hernández', 'Perú', 29, 'Crimson Vanguard'),
('RagingKnight', 'Gabriela', 'Castro', 'Uruguay', 20, 'Crimson Vanguard'),
('NightmareKing', 'Lucía', 'Díaz', 'Panamá', 30, 'Nightmare Reapers'),
('ReaperShadow', 'Jorge', 'Gómez', 'Paraguay', 24, 'Nightmare Reapers'),
('DarkHarvest', 'Roberto', 'Santos', 'Venezuela', 22, 'Nightmare Reapers'),
('SoulHunter', 'Sofía', 'Moreno', 'Costa Rica', 26, 'Nightmare Reapers'),
('DreadClaw', 'Isabella', 'Martín', 'España', 28, 'Nightmare Reapers'),
('GoldenSniper', 'Carlos', 'Pérez', 'México', 24, 'Golden Hawks'),
('HawkEye', 'Laura', 'Smith', 'USA', 22, 'Golden Hawks'),
('SkyShot', 'Pedro', 'Martínez', 'Chile', 25, 'Golden Hawks'),
('WingStrike', 'Ana', 'López', 'Colombia', 21, 'Golden Hawks'),
('EagleFang', 'Luis', 'Fernández', 'Ecuador', 27, 'Golden Hawks'),
('SilverMage', 'Juan', 'González', 'España', 22, 'Silver Dragons'),
('PlatinumClaw', 'Diego', 'Ramírez', 'Argentina', 26, 'Silver Dragons'),
('MoonSeeker', 'Sara', 'Johnson', 'Canadá', 28, 'Silver Dragons'),
('StarRider', 'Mario', 'Hernández', 'Perú', 29, 'Silver Dragons'),
('DragonHeart', 'Gabriela', 'Castro', 'Uruguay', 20, 'Silver Dragons'),
('TitanCrusher', 'Lucía', 'Díaz', 'Panamá', 30, 'Titan Breakers'),
('EarthShaker', 'Jorge', 'Gómez', 'Paraguay', 24, 'Titan Breakers'),
('Colossus', 'Roberto', 'Santos', 'Venezuela', 22, 'Titan Breakers'),
('StoneFist', 'Sofía', 'Moreno', 'Costa Rica', 26, 'Titan Breakers'),
('MountainRider', 'Isabella', 'Martín', 'España', 28, 'Titan Breakers'),
('BladeFury', 'Carlos', 'Pérez', 'México', 24, 'Fury Blades'),
('CuttingEdge', 'Laura', 'Smith', 'USA', 22, 'Fury Blades'),
('SlashMaster', 'Pedro', 'Martínez', 'Chile', 25, 'Fury Blades'),
('RazorStorm', 'Ana', 'López', 'Colombia', 21, 'Fury Blades'),
('SharpStrike', 'Luis', 'Fernández', 'Ecuador', 27, 'Fury Blades'),
('MysticArrow', 'Daniel', 'Cruz', 'Perú', 24, 'Mystic Rangers'),
('ForestShade', 'Clara', 'Mendoza', 'México', 22, 'Mystic Rangers'),
('SpiritSeeker', 'Fernando', 'Ruiz', 'Argentina', 25, 'Mystic Rangers'),
('EtherealBow', 'Patricia', 'Jiménez', 'Chile', 26, 'Mystic Rangers'),
('PhantomRanger', 'Oscar', 'Castillo', 'Colombia', 23, 'Mystic Rangers'),
('SteelCrusher', 'Ernesto', 'Vega', 'Venezuela', 29, 'Steel Titans'),
('MetalGuardian', 'Gloria', 'Navarro', 'España', 24, 'Steel Titans'),
('IronForge', 'Ricardo', 'Morales', 'Uruguay', 27, 'Steel Titans'),
('BronzeFist', 'Santiago', 'Ortiz', 'Paraguay', 25, 'Steel Titans'),
('TitaniumClaw', 'Natalia', 'Pérez', 'Panamá', 30, 'Steel Titans'),
('ThunderStrike', 'Javier', 'Martínez', 'Ecuador', 26, 'Thunder Lords'),
('LightningFury', 'Mariana', 'Luna', 'Costa Rica', 23, 'Thunder Lords'),
('StormRider', 'Adriana', 'Reyes', 'Bolivia', 21, 'Thunder Lords'),
('SkyBolt', 'Tomás', 'Serrano', 'Chile', 28, 'Thunder Lords'),
('TempestWing', 'Carmen', 'Lozano', 'Colombia', 27, 'Thunder Lords'),
('CyberSword', 'José', 'Álvarez', 'Argentina', 25, 'Cyber Knights'),
('DigitalShield', 'Sofía', 'Cárdenas', 'México', 29, 'Cyber Knights'),
('BinaryLancer', 'Andrés', 'Sánchez', 'España', 24, 'Cyber Knights'),
('CircuitBlade', 'Beatriz', 'Ramírez', 'Perú', 22, 'Cyber Knights'),
('NeonRogue', 'Leonardo', 'Blanco', 'Paraguay', 28, 'Cyber Knights'),
('InfernoBlade', 'Francisco', 'Hidalgo', 'Chile', 23, 'Flame Warriors'),
('EmberFury', 'Carolina', 'Zamora', 'Colombia', 22, 'Flame Warriors'),
('Firestorm', 'Diego', 'Escobar', 'Ecuador', 27, 'Flame Warriors'),
('AshWarden', 'Gabriela', 'López', 'Uruguay', 26, 'Flame Warriors'),
('BurningClaw', 'Fernando', 'Vargas', 'Panamá', 30, 'Flame Warriors'),
('FrostEdge', 'Laura', 'Guzmán', 'Bolivia', 21, 'Frozen Guardians'),
('SnowSeeker', 'Luis', 'Montero', 'México', 28, 'Frozen Guardians'),
('GlacialFang', 'Marcos', 'Lima', 'Perú', 24, 'Frozen Guardians'),
('IceBreaker', 'Camila', 'García', 'Chile', 26, 'Frozen Guardians'),
('WinterKnight', 'Sergio', 'Herrera', 'España', 25, 'Frozen Guardians'),
('SilentBlade', 'David', 'Ramos', 'Argentina', 24, 'Shadow Assassins'),
('DarkShadow', 'Esteban', 'Cortés', 'Paraguay', 22, 'Shadow Assassins'),
('GhostStrike', 'Lucía', 'Fernández', 'México', 27, 'Shadow Assassins'),
('NightShade', 'Marta', 'Ríos', 'Costa Rica', 29, 'Shadow Assassins'),
('PhantomBlade', 'Miguel', 'Ortiz', 'Panamá', 23, 'Shadow Assassins'),
('ThunderDash', 'Julio', 'Flores', 'Chile', 24, 'Storm Raiders'),
('TempestClaw', 'Claudia', 'Méndez', 'Ecuador', 22, 'Storm Raiders'),
('HurricaneBlade', 'Raúl', 'Rivera', 'Perú', 27, 'Storm Raiders'),
('CycloneFist', 'Patricia', 'Quintero', 'España', 25, 'Storm Raiders'),
('StormWing', 'Victor', 'Zapata', 'Colombia', 28, 'Storm Raiders'),
('EmeraldGuard', 'Santiago', 'Cano', 'Venezuela', 26, 'Emerald Defenders'),
('VerdantStrike', 'Teresa', 'Salinas', 'México', 23, 'Emerald Defenders'),
('ForestFury', 'Adolfo', 'Molina', 'Argentina', 29, 'Emerald Defenders'),
('GreenSpear', 'Angela', 'Palacios', 'Uruguay', 21, 'Emerald Defenders'),
('JungleHunter', 'Joaquín', 'Arce', 'Chile', 30, 'Emerald Defenders'),
('BloodClaw', 'Emilio', 'Barrios', 'España', 28, 'Crimson Warriors'),
('ScarletStorm', 'Andrea', 'Silva', 'Colombia', 22, 'Crimson Warriors'),
('RubyKnight', 'Roberto', 'Torres', 'Ecuador', 26, 'Crimson Warriors'),
('RedSaber', 'Valeria', 'Navarro', 'Argentina', 24, 'Crimson Warriors'),
('FireFang', 'Fernando', 'Suárez', 'Paraguay', 25, 'Crimson Warriors');







INSERT INTO Torneos (Nombre, Fecha_Inicio, Premio_Dinero)
VALUES
('Shadow Championship', '2023-01-15', 50000.00),
('Phoenix Cup', '2023-03-20', 45000.00),
('Iron Clash', '2023-05-10', 60000.00),
('Blazing Sprint', '2023-07-05', 40000.00),
('Crimson Warzone', '2023-09-12', 55000.00),
('Nightmare Arena', '2023-11-18', 75000.00),
('Golden Skies Tournament', '2023-02-10', 47000.00),
('Dragon Fantasy League', '2023-04-15', 52000.00),
('Titan Battle Royale', '2023-06-25', 62000.00),
('Blade Master Series', '2023-08-30', 48000.00),
('Mystic Open', '2023-10-20', 49000.00);


INSERT INTO Participar (Nombre_Equipo, Nombre_Torneo)
VALUES
('Shadow Wolves', 'Shadow Championship'),
('Shadow Wolves', 'Phoenix Cup'),
('Shadow Wolves', 'Iron Clash'),
('Phoenix Ascendants', 'Phoenix Cup'),
('Phoenix Ascendants', 'Crimson Warzone'),
('Phoenix Ascendants', 'Golden Skies Tournament'),
('Iron Gladiators', 'Iron Clash'),
('Iron Gladiators', 'Nightmare Arena'),
('Iron Gladiators', 'Dragon Fantasy League'),
('Blazing Comets', 'Blazing Sprint'),
('Blazing Comets', 'Shadow Championship'),
('Blazing Comets', 'Phoenix Cup'),
('Crimson Vanguard', 'Crimson Warzone'),
('Crimson Vanguard', 'Golden Skies Tournament'),
('Crimson Vanguard', 'Titan Battle Royale'),
('Nightmare Reapers', 'Nightmare Arena'),
('Nightmare Reapers', 'Dragon Fantasy League'),
('Nightmare Reapers', 'Blade Master Series'),
('Golden Hawks', 'Golden Skies Tournament'),
('Golden Hawks', 'Shadow Championship'),
('Golden Hawks', 'Iron Clash'),
('Silver Dragons', 'Dragon Fantasy League'),
('Silver Dragons', 'Phoenix Cup'),
('Silver Dragons', 'Nightmare Arena'),
('Titan Breakers', 'Titan Battle Royale'),
('Titan Breakers', 'Blade Master Series'),
('Titan Breakers', 'Crimson Warzone'),
('Fury Blades', 'Blade Master Series'),
('Fury Blades', 'Blazing Sprint'),
('Fury Blades', 'Phoenix Cup'),
('Mystic Rangers', 'Mystic Open'),
('Mystic Rangers', 'Shadow Championship'),
('Mystic Rangers', 'Iron Clash'),
('Steel Titans', 'Iron Clash'),
('Steel Titans', 'Nightmare Arena'),
('Steel Titans', 'Blazing Sprint'),
('Thunder Lords', 'Blazing Sprint'),
('Thunder Lords', 'Titan Battle Royale'),
('Thunder Lords', 'Golden Skies Tournament'),
('Cyber Knights', 'Dragon Fantasy League'),
('Cyber Knights', 'Blade Master Series'),
('Cyber Knights', 'Mystic Open'),
('Flame Warriors', 'Crimson Warzone'),
('Flame Warriors', 'Phoenix Cup'),
('Flame Warriors', 'Nightmare Arena'),
('Frozen Guardians', 'Golden Skies Tournament'),
('Frozen Guardians', 'Shadow Championship'),
('Frozen Guardians', 'Blazing Sprint'),
('Shadow Assassins', 'Blade Master Series'),
('Shadow Assassins', 'Phoenix Cup'),
('Shadow Assassins', 'Dragon Fantasy League'),
('Storm Raiders', 'Crimson Warzone'),
('Storm Raiders', 'Nightmare Arena'),
('Storm Raiders', 'Iron Clash'),
('Emerald Defenders', 'Mystic Open'),
('Emerald Defenders', 'Blazing Sprint'),
('Emerald Defenders', 'Titan Battle Royale'),
('Crimson Warriors', 'Shadow Championship'),
('Crimson Warriors', 'Phoenix Cup'),
('Crimson Warriors', 'Iron Clash');



UPDATE Equipos set Puntos = (Puntos + 3) where Nombre = 'Shadow Wolves';
SELECT Nombre, Puntos from Equipos;

-- Obtén listado de jugadores incluyendo el equipo al que está unido cada uno.

SELECT Apodo, Nombre, Nombre_Equipo FROM Jugadores ORDER BY Nombre_Equipo;

-- Obtén listado de equipos con más de 3 jugadores.

SELECT Nombre_equipo, Count(Apodo) FROM Jugadores Group by Nombre_Equipo Having count(Apodo) > 3;

-- Obtén los torneos en los que participó un equipo específico.

SELECT Nombre_Equipo, Nombre_Torneo FROM Participar Order by Nombre_Equipo;

-- Obtén los 3 equipos con más puntos acumulados en los torneos.

SELECT Nombre, Puntos FROM Equipos order by puntos Desc limit 3;
