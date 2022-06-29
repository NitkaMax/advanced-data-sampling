--Количество исполнителей в каждом жанре
select g.name genres, count(ga.artists_id) count_artists from genres g
left join genre_artists ga on g.id = ga.genres_id
group by g.name;

--Количество треков, вошедших в адьбомы 2019-2020
select count(t.id) count_2019_2020 from tracks t
right join albums a on t.album_id = a.id 
where year_release between 2019 and 2020;

--Средняя продолжительность треков по каждому альбому
select a.name albums, AVG (t.duration) avg_duration from tracks t
right join albums a on t.album_id = a.id 
group by a."name"; 

--Все исполнители, который не выпустили альбомы в 2020
select name from artists a
where name not in (
	select a.name from artists a2
	left join album_artists aa on a.id = aa.artists_id
	left join albums a3 on aa.albums_id = a3.id
	where year_release = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель
select distinct c.name with_Linkin_park from collections c 
join collections_tracks ct on c.id = ct.collections_id
join tracks t on ct.tracks_id = t.id 
join albums a on t.album_id = a.id
join album_artists aa on a.id = aa.albums_id
join artists a2 on aa.artists_id = a2.id
where a2."name" like '%%Linkin park%%';

--Название альбомов, в которых присутствуют исполнители более 1 жанра
select distinct a.name from albums a 
join album_artists aa on a.id = aa.albums_id
where aa.artists_id in (
	select artists_id from(
		select ga2.artists_id, count(ga2.genres_id) from genre_artists ga2
		group by ga2.artists_id
		having count(ga2.genres_id)>1
		) New_table
	);

drop table if exists New_table;

--Наименование треков, которые не входят в сборники
select name from tracks t 
where id not in (
	select distinct tracks_id from collections_tracks ct);

--Исполнитея(ей), написавшего самый коротки по продолжительности трек
select distinct a.name from artists a 
join album_artists aa ON a.id = aa.artists_id 
where albums_id in (
	select albums_id from tracks t
	where duration = (
		select min(t2.duration)from tracks t2)
	);

--НАзвание альбомов, содержащих наименьшее количество треков
select a.name, count(t.id) amount into New_table from albums a
join tracks t on a.id = t.album_id
group by a."name";

select * from New_table
where amount = (
	select min(amount)from New_table);
	
drop table if exists New_table;