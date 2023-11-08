-- Обновление типа данных в таблице Track: замена типа данных с decimal на integer (в секундах)
ALTER TABLE track ALTER COLUMN track_length TYPE integer
;

-- Заполнение таблиц
-- Таблица жанров
INSERT INTO genre(genre_name)
     VALUES ('rock')
;
INSERT INTO genre(genre_name)
     VALUES ('rap')
;
INSERT INTO genre(genre_name)
     VALUES ('pop')
;

-- Таблица исполнителей
INSERT INTO performer(performer_id, performer_name)
     VALUES (1, 'iron maiden')
;
INSERT INTO performer(performer_id, performer_name)
     VALUES (2, 'eminem')
;
INSERT INTO performer(performer_id, performer_name)
     VALUES (3, 'maroon 5')
;
INSERT INTO performer(performer_id, performer_name)
     VALUES (4, 'drake')
;

-- Таблица альбомов
INSERT INTO album(album_id, album_name, album_year)
     VALUES (1, 'For All the Dogs', 2023)
;
INSERT INTO album(album_id, album_name, album_year)
     VALUES (2, 'Take Care', 2011)
;
INSERT INTO album(album_id, album_name, album_year)
     VALUES (3, 'Fear Of The Dark', 1992)
;
INSERT INTO album(album_id, album_name, album_year)
     VALUES (4, 'The Eminem Show', 2002)
;
INSERT INTO album(album_id, album_name, album_year)
     VALUES (5, 'Overexposed', 2012)
;

-- Таблица треков
INSERT INTO track(track_id, album_id, track_name, track_length)
     VALUES(1, 1, 'Virginia Beach', 251)
;
INSERT INTO track(track_id, album_id, track_name, track_length)
     VALUES(2, 3, 'Fear Of The Dark', 438)
;
INSERT INTO track(track_id, album_id, track_name, track_length)
     VALUES(3, 4, 'Soldier', 226)
;
INSERT INTO track(track_id, album_id, track_name, track_length)
     VALUES(4, 4, 'Without me', 290)
;
INSERT INTO track(track_id, album_id, track_name, track_length)
     VALUES(5, 2, 'Headlines', 335)
;
INSERT INTO track(track_id, album_id, track_name, track_length)
     VALUES(6, 5, 'Daylight', 226)
;

-- Таблица сборников
INSERT INTO collection(collection_id, collection_name, collection_year)
     VALUES(1, 'some_collection_name_1', 2020)
;
INSERT INTO collection(collection_id, collection_name, collection_year)
     VALUES(2, 'some_collection_name_2', 2019)
;
INSERT INTO collection(collection_id, collection_name, collection_year)
     VALUES(3, 'some_collection_name_3', 2001)
;    
INSERT INTO collection(collection_id, collection_name, collection_year)
     VALUES(4, 'some_collection_name_4', 1998)
;

-- Таблица связи исполнителей с альбомами
INSERT INTO album_performer(album_performer_id, album_id, performer_id)
     VALUES(1, 4, 1)
;
INSERT INTO album_performer(album_performer_id, album_id, performer_id)
     VALUES(2, 3, 2)
;
INSERT INTO album_performer(album_performer_id, album_id, performer_id)
     VALUES(3, 1, 1)
;

-- Таблица связи исполнителей с жанрами
INSERT INTO performer_genre(performer_genre_id, performer_id, genre_id)
     VALUES(1, 1, 1)
;
INSERT INTO performer_genre(performer_genre_id, performer_id, genre_id)
     VALUES(2, 2, 2)
;
INSERT INTO performer_genre(performer_genre_id, performer_id, genre_id)
     VALUES(3, 2, 1)
;
INSERT INTO performer_genre(performer_genre_id, performer_id, genre_id)
     VALUES(4, 3, 3)
;
INSERT INTO performer_genre(performer_genre_id, performer_id, genre_id)
     VALUES(5, 3, 2)
;
INSERT INTO performer_genre(performer_genre_id, performer_id, genre_id)
     VALUES(6, 3, 1)
;
INSERT INTO performer_genre(performer_genre_id, performer_id, genre_id)
     VALUES(7, 4, 2)
;
INSERT INTO performer_genre(performer_genre_id, performer_id, genre_id)
     VALUES(8, 4, 3)
;

-- Таблица связи сборников с треками
INSERT INTO collection_track(collection_id, track_id)
     VALUES (1, 2)
;
INSERT INTO collection_track(collection_id, track_id)
     VALUES (1, 3)
;
INSERT INTO collection_track(collection_id, track_id)
     VALUES (2, 5)
;
INSERT INTO collection_track(collection_id, track_id)
     VALUES (2, 6)
;
INSERT INTO collection_track(collection_id, track_id)
     VALUES (3, 3)
;
INSERT INTO collection_track(collection_id, track_id)
     VALUES (4, 3)
;
