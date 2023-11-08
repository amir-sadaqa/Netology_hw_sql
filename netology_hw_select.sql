-- Задание 2
-- Название и продолжительность самого длительного трека
select track_name, track_length 
  from track
 where track_length = (
             select max(track_length) 
               from track
               )
;

-- Название треков, продолжительность которых не менее 3,5 минут
select track_name, track_length
  from track
 where track_length >= 210
;

-- Название сборников, вышедших в период с 2018 по 2020 год включительно
select collection_name
  from collection
 where collection_year between 2018 and 2020
;

-- Исполнители, чье имя состоит из одного слова
select performer_name
  from performer
 where performer_name not like '% %'
;

-- Название треков, которые содержат слово «мой» или «my»
select track_name
  from track
 where upper(track_name) like upper('%мой%') or upper(track_name) like upper('%my%')
;

-- Задание 3
-- Количество исполнителей в каждом жанре
select genre_id, count(performer_id)
  from performer_genre
  group by genre_id
  order by genre_id
 ;

 -- Количество треков, вошедших в альбомы 2019-2020 годов
 select count(track_id)
   from track
  where album_id in (
             select album_id
               from album
              where album_year between 2019 and 2020
               )
              ;

-- Средняя продолжительность треков по каждому альбому
select album_id, avg(track_length) as avg_track_length
  from track
 group by album_id
 order by avg_track_length
;

-- Все исполнители, которые не выпустили альбомы в 2020 году
select performer_id, performer_name
  from performer
 where performer_id not in (
                    select performer_id
                      from album_performer
                     where album_id in (
                                select album_id
                                  from album            
                                 where album_year = 2020
                                  )
                              )
                             ;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
select collection_name from album_performer as ap
  join performer as p on p.performer_id = ap.performer_id
  join track as t on t.album_id = ap.album_id
  join collection_track as ct on t.track_id = ct.track_id
  join collection as c on ct.collection_id = c.collection_id
 where p.performer_id = 1 -- несмотря на то, что на своей работе я постоянно работаю с таблицами excel на уровне продвинутого пользователя, визуализация join-ов в голове, несмотря
 --на их кажущуюся логичность, всё равно дается тяжеловато. Это вгоняет во фрустрацию :( Видимо, эту часть SQL еще грызть и грызть...
;

-- Задание 4
-- Названия альбомов, где присутствуют исполнители более чем одного жанра
select album_name from album
 where album_id in (
select album_id from album_performer as ap 
  join
		(select performer_id, count(genre_id)
		  from performer_genre
		 group by performer_id
		   having count(genre_id) > 1
		 order by performer_id) as t_1 
 	on ap.performer_id = t_1.performer_id
 	)
 	;

 -- Наименования треков, которые не входят в сборники
 select track_name from track
  where track_id not in (
                 select track_id
                   from collection_track
                   )
                   ; -- =/ Я неправильно понял задание или действительно такой легкий запрос?
                   
-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
select performer_name 
  from performer
 where performer_id in (
  select performer_id from album_performer as ap 
  join (              
       select album_id 
         from track
        where track_length = (
             select min(track_length)
               from track)
               ) as t_1
    on ap.album_id = t_1.album_id
    )
    ;
   
-- Названия альбомов, содержащих наименьшее количество треков
   select album_name 
     from album
    where album_id in 
                    (
                      select album_id from 
                                         (
		                            select album_id, count(track_id)
		                              from track
		                          group by album_id
		                            having count(track_id) = 
		                                                   (
		                                                    select min(c) from 
		                                                                     (
		                                                                select album_id, count(track_id) as c
		                                                                  from track
		                                                              group by album_id
		                                                              order by c asc
		                                                                     )
		                                                     )
		                                   )
		             );

		                   
		                

				  
  



