--жанр
create table if not exists Genres (
	id SERIAL primary key,
	name VARCHAR (60) unique not null
);

--Артист
create table if not exists Artists(
	id SERIAL primary key,
	name VARCHAR (80) unique not null
);

--Альбом
create table if not exists Albums(
	id SERIAL primary key,
	name VARCHAR (80) not null,
	year_release INTEGER not null check (year_release > 0)
);

--Треки
create table if not exists Tracks(
	id SERIAL primary key,
	album_id INTEGER not null references Albums(id),
	name VARCHAR (80) not null,
	duration numeric not null check (duration > 0)
);

--Коллекции(Сборники)
create table if not exists Collections(
	id SERIAL primary key,
	name VARCHAR (80),
	year_release integer not null check (year_release > 0)
);

create table if not exists Genre_Artists(
	genres_id INTEGER not null references Genres(id),
	artists_id INTEGER not null references Artists(id),
	constraint pk1 primary key (genres_id,artists_id)
);

create table if not exists Album_Artists(
	artists_id INTEGER not null references Artists(id),
	albums_id INTEGER not null references Albums(id),
	constraint pk2 primary key (artists_id,albums_id)
);

create table if not exists Collections_Tracks(
	collections_id INTEGER not null references Collections (id),
	tracks_id INTEGER not null references Tracks(id),
	constraint pk3 primary key (collections_id, tracks_id)
);


INSERT into genres(name)
	values ('Hip-Hop'),
		('Rock'),
		('Alternative'),
		('Rock ’n’ roll'),
		('Indie'),
		('R&b'),
		('Pop music'),
		('Electronics');
		
INSERT into artists (name)
	values ('ATL'),
		('Linkin park'),
		('Bring Me The Horizon'),
		('The Baseballs'),
		('Oliver Tree'),
		('The Weeknd'),
		('GAYLE'),
		('Gesaffelstein');
		
insert into albums (name, year_release)
	values ('DRUMTAPE', 2021),
		('Hybrid Theory', 2000),
		('Sempiternal', 2013),
		('Hot Shots', 2021),
		('Ugly is Beautiful', 2020),
		('After Hours', 2020),
		('abcdefu', 2021),
		('Aleph', 2013);
		
insert into tracks (album_id, name, duration)
	values (1, 'Magic people', 197),
		(1, 'Marabu', 227),
		(1, 'Black snow', 226),
		(2, 'One Step Closer', 157),
		(2, 'Points of Authority', 200),
		(2, 'In The End', 216),
		(3, 'Can You Feel My Heart', 228),
		(3, 'Empire', 225),
		(3, 'Sleepwalking', 230),
		(4, 'Take On Me', 153),
		(4, 'Ghostbusters', 211),
		(4, 'Paradise City', 175),
		(5, 'Me, Myself & I', 173),
		(5, 'Let Me Down', 111),
		(5, 'Jerk', 135),
		(6, 'Escape From LA', 355),
		(6, 'Blinding Lights', 200),
		(6, 'In Your Eyes', 237),
		(7, 'abcdefu', 168),
		(8, 'Hellifornia', 220),
		(8, 'Aleph', 286);
		
insert into genre_artists
	values (1,1),
			(2,2),
			(3,3),
			(4,4),
			(5,5),
			(6,6),
			(7,7),
			(8,8),
			(7,5),
			(7,6);
			
insert into album_artists
	values (1,1),
			(2,2),
			(3,3),
			(4,4),
			(5,5),
			(6,6),
			(7,7),
			(8,8);
			
insert into collections (name, year_release)
	values ('For The Car', 2018),
			('10th', 2015),
			('Cool hook', 2020),
			('Best of the Best', 2022),
			('New', 2022),
			('Eternal Hits', 2018),
			('2000x', 2010),
			('Eron-don-don', 2020);
		
insert into collections_tracks 
	values (1,1),
			(1,2),
			(1,3),
			(1,4),
			(1,5),
			(1,6),
			(1,7),
			(1,8),
			(1,10),
			(1,14),
			(1,15),
			(1,17),
			(1,19),
			(2,7),
			(2,8),
			(2,9),
			(2,20),
			(2,21),
			(3,1),
			(3,3),
			(3,4),
			(3,5),
			(3,6),
			(3,7),
			(3,10),
			(3,15),
			(3,17),
			(4,2),
			(4,4),
			(4,5),
			(4,6),
			(4,10),
			(4,14),
			(4,17),
			(4,19),
			(5,1),
			(5,3),
			(5,10),
			(5,11),
			(5,13),
			(5,14),
			(5,15),
			(5,19),
			(6,2),
			(6,4),
			(6,5),
			(6,6),
			(6,7),
			(6,10),
			(6,17),
			(7,4),
			(7,5),
			(7,6),
			(8,1),
			(8,3),
			(8,5),
			(8,7),
			(8,13),
			(8,14),
			(8,15),
			(8,19);
			



